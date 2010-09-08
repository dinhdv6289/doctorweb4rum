using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BLL;
public partial class GUI_Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["UserLoged"] != null)
            {
                Member member = (Member)Session["UserLoged"];
                txtUserName.Text = member.UserName;
                txtPassword.Text = member.Password;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string password = txtPassword.Text;
        if (userName.Length > 0 || userName != null || password.Length > 0 || password != null)
        {
            Member member = MemberBLL.GetMemberByUserNamePassword(userName, password);
            if (member != null)
            {
                Session["id"] = member.MemberID;
                member.IsOnline = true;
                MemberBLL.UpdateMember(member);
                MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
                if (memberProfile != null)
                {
                    //string origin = Request.QueryString["ReturnURL"];
                    //if (origin == null)
                    //{
                    //    origin = "Default.aspx";
                    //}
                    Session.Add("UserLoged", member);
                    Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                    if (role != null)
                    {
                        if (role.RoleName.Equals("Super Moderator"))
                        {
                            Response.Redirect("modcp/Index.aspx");
                        }
                        if (role.RoleName.Equals("Admin"))
                        {
                            Response.Redirect("Default.aspx");
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("MessagesForum.aspx");
            }
        }
        else
        {
            Response.Redirect("MessagesForum.aspx");
        }
    }
}
