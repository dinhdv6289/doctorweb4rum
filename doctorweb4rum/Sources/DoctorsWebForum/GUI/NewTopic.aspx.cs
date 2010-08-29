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
using System.Collections.Generic;
using TuyenPV;
using BLL;

public partial class GUI_NewTopic : System.Web.UI.Page
{
    private int subID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        String subForumID = Request.QueryString["subForumID"];
        if (subForumID != null)
        {
            if (!IsPostBack)
            {
                Session.Add("subForumID", subForumID);
                subID = Convert.ToInt32(subForumID);
                SubForum sf = SubForumBLL.GetSubForumBySubForumID(subID);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                this.Page.Title = sf.SubForumName + "  - New Topic";
            }
        }
        else
        {
            Response.Redirect("ShowTopics.aspx?subForumID=" + Session["subForumID"].ToString());
        }
    }

    public SubForum GetSubForumBySubForumID()
    {
        return SubForumBLL.GetSubForumBySubForumID(subID);
    }
    protected void btnSubmitNewTopic_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string contents = Editor1.Content;
        if (title != null || title.Length > 0 || contents.Length > 0 || contents != null)
        {
            Topic newTopic = new Topic();
            if (Request.QueryString["subForumID"] != null || Request.QueryString["subForumID"].Length > 0)
            {
                newTopic.SubForumID = Convert.ToInt32(Request.QueryString["subForumID"]);
                newTopic.MemberID = 1;// MemberID fix cung' bang 1. vi chua co Session Login.
                newTopic.Title = title;
                newTopic.Content = contents;
                newTopic.IsLocked = false;
                newTopic.TotalViews = 0;
                newTopic.TotalMessages = 0;
                newTopic.MoveTo = 0;
                int resultStatus = 0;
                int result = TopicBLL.InsertTopic(newTopic, out resultStatus);
                if (resultStatus > 0)
                {
                    Response.Redirect("TopicDetails.aspx?topicID=" + resultStatus.ToString());
                }
            }
        }


    }
}
