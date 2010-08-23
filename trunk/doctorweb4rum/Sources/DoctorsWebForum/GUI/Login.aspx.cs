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
        if (Roles.IsUserInRole("admin"))
        {
            //Response.Redirect("~/Admin/QuanLySanPham.aspx");
        }
        else
        {
            Response.Redirect("~/Index.aspx");
        }
    }
}
