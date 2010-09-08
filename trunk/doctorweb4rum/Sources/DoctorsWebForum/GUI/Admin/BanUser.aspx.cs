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
public partial class GUI_Admin_BanUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserLoged"] != null)
            {
                Member memberloged = (Member)Session["UserLoged"];
                MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(memberloged.MemberID);
                Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                if (role.RoleName.Equals("Admin"))
                {
                    panelBanUser.Visible = true;
                    PanelsVisiableFalse();
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

    private void PanelsVisiableFalse()
    {
        panelMessage.Visible = false;
        panelInvalidUserSpecified.Visible = false;
        panelError.Visible = false;
        
    }

    protected void btnBan_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text.Length > 0 || txtUserName.Text != null || txtUserName.Text == "")
        {
            Member member = MemberBLL.GetMemberByUserName(txtUserName.Text);
            if (member != null)
            {
                int result = MemberBLL.BanOrUnBanUser(member.MemberID, false);
                if(result >0)
                {
                    lblUserBan.Text = member.UserName;
                    panelBanUser.Visible = false;
                    panelMessage.Visible = true;
                    panelInvalidUserSpecified.Visible = false;
                    
                }else
                {
                    panelBanUser.Visible = false;
                    panelError.Visible = true;
                }
            }else
            {
                panelBanUser.Visible = false;
                panelInvalidUserSpecified.Visible = true;
            }
        }
        else
        {
            panelBanUser.Visible = false;
            panelInvalidUserSpecified.Visible = true;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        PanelsVisiableFalse();
        Response.Redirect("BannedUsers.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        panelBanUser.Visible = true;
        PanelsVisiableFalse();
        
    }
    protected void btnErrorGoBack_Click(object sender, EventArgs e)
    {
        panelBanUser.Visible = true;
        PanelsVisiableFalse();

    }
}
