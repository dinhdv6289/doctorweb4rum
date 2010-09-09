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
public partial class GUI_Admin_AddNewSubForum : System.Web.UI.Page
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
                    String categoryID = Request.QueryString["categoryID"];
                    if (categoryID != null)
                    {
                        panelAddNewSubForum.Visible = true;
                        panelMessage.Visible = false;
                        panelError.Visible = false;
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
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

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        txtPriority.Text = "";
        txtSubForumName.Text = "";
        txtDescription.Text = "";
        panelMessage.Visible = false;
        panelError.Visible = false;
        Response.Redirect("Default.aspx");
    }
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        String categoryID = Request.QueryString["categoryID"];
        if (categoryID != null)
        {
            if(txtSubForumName.Text == "" || txtSubForumName.Text == null || txtSubForumName.Text.Length==0) 
            {
                panelAddNewSubForum.Visible = false;
                panelMessage.Visible = false;
                panelError.Visible = true;
            }
            SubForum subForum = new SubForum();
            subForum.CategoryID = Convert.ToInt32(categoryID);
            
            subForum.SubForumName = txtSubForumName.Text;
            subForum.Description = txtDescription.Text;
            subForum.TotalMessages = 0;
            subForum.TotalTopics = 0;
            subForum.Priority = Convert.ToInt32(txtPriority.Text);
            int result = SubForumBLL.InsertSubForum(subForum);
            if (result > 0)
            {
                panelAddNewSubForum.Visible = false;
                panelMessage.Visible = true;
            }
            else
            {
                panelAddNewSubForum.Visible = false;
                panelMessage.Visible = false;
                panelError.Visible = true;
            }
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panelAddNewSubForum.Visible = false;
        Response.Redirect("Default.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        panelError.Visible = false;
        panelAddNewSubForum.Visible = true;
        panelMessage.Visible = false;
    }
}
