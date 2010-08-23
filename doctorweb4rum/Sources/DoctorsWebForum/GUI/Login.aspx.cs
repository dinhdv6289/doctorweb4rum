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

public partial class GUI_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtPassword.Text = "";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string password = txtPassword.Text;
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
            //Response.w
        }
    }
}
