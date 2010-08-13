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

public partial class GUI_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            loadData();
        }
    }

    private void loadData()
    {
        repeaterCategories.DataSource = CategoryBLL.GetAllCategory();
        repeaterCategories.DataBind();
    }

    public SubForum[] GetAllSubForumsByCategoryID(int CategoryID)
    {
       return SubForumBLL.GetlAllSubForumsByCategoryID(CategoryID);
    }

    public String GetImageStatus(int SubForumID)
    {
        if (SubForumBLL.GetImageStatus(SubForumID))
        {
            return @"Images/forum_new-48.png";
        }
        else
        {
            return @"Images/forum_old-48.png";
        }
    }
}
