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
public partial class GUI_ShowTopics : System.Web.UI.Page
{
    private int subID =0;
    protected void Page_Load(object sender, EventArgs e)
    {
        String subForumID = Request.QueryString["subForumID"];
        if (subForumID != null)
        {
            if (!IsPostBack)
            {
                subID = Convert.ToInt32(subForumID);
                LoadData(subID);
            }
        }
        else
        {
            Response.Redirect("Index.aspx");
        }
    }

    private void LoadData(int subForumID)
    {
        repeaterTopics.DataSource = TopicBLL.GetAllTopicBySubForumID(subForumID);
        repeaterTopics.DataBind();
    
    }

    public SubForum GetSubForumBySubForumID(){
        return SubForumBLL.GetSubForumBySubForumID(subID);
    }

}
