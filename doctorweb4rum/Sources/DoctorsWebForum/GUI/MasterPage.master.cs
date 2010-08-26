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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            ModalPopupExtenderLogin.Enabled = true;
            ModalPopupExtenderLogin.Show();
        }
        if (Page.IsValid)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;
            if (userName.Length > 0 || userName != null || password.Length > 0 || password != null)
            {
                Member member = MemberBLL.GetMemberByUserNamePassword(userName, password);
                if (member != null)
                {
                    MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
                    if (memberProfile != null)
                    {
                        Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                        if (role != null)
                        {
                            if (role.RoleName.Equals("Member"))
                            {
                                Response.Redirect("Index.aspx");
                            }
                            if (role.RoleName.Equals("Moderator"))
                            {

                            }
                            if (role.RoleName.Equals("Super Moderator"))
                            {

                            }
                            if (role.RoleName.Equals("Admin"))
                            {

                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}
