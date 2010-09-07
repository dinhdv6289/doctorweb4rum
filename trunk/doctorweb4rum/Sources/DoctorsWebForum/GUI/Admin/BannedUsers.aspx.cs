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
public partial class GUI_Admin_BannedUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Member[] members = MemberBLL.GetBannedUsers();
            if (members.Length > 0)
            {
                repeaterBannedUser.DataSource = members;
                repeaterBannedUser.DataBind();
                panelBanedUsers.Visible = true;
                panelMessage.Visible = false;
            }
        }
    }
    protected void repeaterBannedUser_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "BanLift")
        {
            Member member = MemberBLL.GetBannedUser(Convert.ToInt32(e.CommandArgument.ToString()));
            if (member != null)
            {
                panelBanedUsers.Visible = false;
                lblUserName.Text = member.UserName;
                panelMessage.Visible = true;
            }
        }
    }
    protected void btnCanccel_Click(object sender, EventArgs e)
    {
        panelBanedUsers.Visible = true;
        lblUserName.Text = "";
        panelMessage.Visible = false;
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        if(lblUserName.Text.Length>0 || lblUserName.Text != null)
        {
            Member member = MemberBLL.GetMemberByUserName(lblUserName.Text);
            if (member != null)
            {
                int result = MemberBLL.BanOrUnBanUser(member.MemberID, true);
                if (result > 0)
                {
                    Response.Redirect("BannedUsers.aspx");
                }
            }
        }
    }
}
