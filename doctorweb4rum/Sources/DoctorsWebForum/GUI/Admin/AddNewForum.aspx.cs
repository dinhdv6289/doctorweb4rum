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
    private int listID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = CategoryBLL.GetAllCategory();
            DropDownList1.DataTextField = "CategoryName";
            DropDownList1.DataValueField = "CategoryID";
            DropDownList1.DataBind();
            //loadData();
        }
    }

    //private void loadData()
    //{
        
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        SubForum sub = new SubForum();
        sub.SubForumName = TextBox1.Text;
        sub.Description = TextBox2.Text;
        sub.DateCreation = DateTime.Parse(TextBox3.Text);

        int resultStatus = 0;
        SubForumBLL.InsertSubForum(sub, out resultStatus);
        Response.Redirect("");
    }
}
