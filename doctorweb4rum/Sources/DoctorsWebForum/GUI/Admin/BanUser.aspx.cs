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
        if(!IsPostBack)
        {
            panelBanUser.Visible = true;
            panelMessage.Visible = false;
        }
    }

    protected void btnBan_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text.Length > 0 || txtUserName.Text != null)
        {
            Member member = MemberBLL.GetMemberByUserName(txtUserName.Text);
            if (member != null)
            {
                int result = MemberBLL.BanOrUnBanUser(member.MemberID, false);
                if(result >0)
                {
                    panelBanUser.Visible = false;
                    panelMessage.Visible = true;
                }else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('Invalid UserName. Please retype again!');</script>");
                }
            }else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('Invalid UserName. Please retype again!');</script>");
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('Please enter UserName to Ban!');</script>");
        }
    }
    protected void btnRediect_Click(object sender, EventArgs e)
    {
        Response.Redirect("BannedUsers.aspx");
    }
}
