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

public partial class GUI_NewReply : System.Web.UI.Page
{
    private int topicId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        String topicID = Request.QueryString["topicID"];
        String withQuote = Request.QueryString["withQuote"];

        if (topicID != null)
        {
            if (!IsPostBack)
            {
                Session.Add("topicID", topicID);
                topicId = Convert.ToInt32(topicID);
                Topic topic = TopicBLL.GetTopicByTopicID(topicId);
                try
                {
                    if (withQuote == "1" || withQuote.Equals("1"))
                    {
                        Editor1.Content = "<span style=\"font-style: italic;font-size: 8pt;\">" + topic.Content + "</span>";
                    }
                    else
                    {
                        Editor1.Content = "";
                    }
                }
                catch (Exception ex)
                {

                }
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(topic.Title, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                this.Page.Title = topic.Title;
            }
        }
        else
        {
            Response.Redirect("TopicDetails.aspx?topicID=" + Session["topicID"].ToString());
        }
    }


    protected void btnSubmitNewReply_Click(object sender, EventArgs e)
    {
        string contents = Editor1.Content;
        if (contents.Length > 0 || contents != null)
        {
            Post newPost = new Post();
            if (Request.QueryString["topicID"] != null || Request.QueryString["topicID"].Length > 0)
            {
                newPost.TopicID = Convert.ToInt32(Request.QueryString["topicID"]);
                newPost.MemberID = 1;// MemberID fix cung' bang 1. vi chua co Session Login.
                newPost.Title = "sau phai bo title di.";
                newPost.Content = contents;
                newPost.DateEdited = DateTime.Now;
                newPost.Signature = true;
                newPost.IPAddress = "5564545455";
                int result = PostBLL.InsertPost(newPost);
                if (result > 0)
                {
                    Response.Redirect("TopicDetails.aspx?topicID=" + Session["topicID"].ToString());
                }
            }
            else
            {
                Server.Transfer("TopicDetails.aspx?topicID=" + Session["topicID"].ToString());
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("TopicDetails.aspx?topicID=" + Session["topicID"].ToString());
    }
}
