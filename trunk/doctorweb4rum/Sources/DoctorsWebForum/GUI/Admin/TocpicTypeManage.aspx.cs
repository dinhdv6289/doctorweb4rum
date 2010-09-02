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

public partial class GUI_Admin_TocpicTypeManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DropDownList1        
        loadData();
    }

    private void loadData()
    {
        GridView1.DataSource = CategoryBLL.GetAllCategory();
        GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Continue"))
        {
            Response.Redirect("EditForum.aspx");
        }
    }
}
