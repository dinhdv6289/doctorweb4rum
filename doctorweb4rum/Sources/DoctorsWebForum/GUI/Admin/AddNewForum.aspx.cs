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

public partial class GUI_Admin_AddNewForum : System.Web.UI.Page
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
                    panelAddNewForum.Visible = true;
                    panelMessage.Visible = false;
                    panelError.Visible = false;
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
        txtCategoryName.Text = "";
        panelMessage.Visible = false;
        panelError.Visible = false;
        Response.Redirect("Default.aspx");
    }
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Category category = new Category();
        category.CategoryName = txtCategoryName.Text;
        category.Priority = Convert.ToInt32(txtPriority.Text);
        int result = CategoryBLL.InsertCategoryNotOutputReturn(category);
        if (result > 0)
        {
            panelAddNewForum.Visible = false;
            panelMessage.Visible = true;
        }else
        {
            panelAddNewForum.Visible = false;
            panelMessage.Visible = false;
            panelError.Visible = true;
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtCategoryName.Text = "";
        txtPriority.Text = "";
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        panelError.Visible = false;
        panelAddNewForum.Visible = true;
        panelMessage.Visible = false;
    }
}
