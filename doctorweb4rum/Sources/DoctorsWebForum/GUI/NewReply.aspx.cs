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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String topicID = Request.QueryString["topicID"];
            if (topicID != null)
            {
                int topicId = Convert.ToInt32(topicID);
                Topic topic = TopicBLL.GetTopicByTopicID(topicId);
                if (topic != null)
                {
                    SubForum sf = SubForumBLL.GetSubForumBySubForumID(topic.SubForumID);
                    if (sf != null)
                    {
                        List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                        nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, new Uri(Request.Url, string.Format("ShowTopics.aspx?subForumID={0}", sf.SubForumID))));
                        nodes.Add(new KeyValuePair<string, Uri>(topic.Title, Request.Url));
                        ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                    }
                }
            }
            else
            {
                Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
            }
        }
        this.Page.Title = "New Reply";
    }

    private string Quote(string content, string userNamePosted)
    {
        return "<div class=\"bbcode_container\"><div class=\"bbcode_quote\"><div class=\"quote_container\"><div class=\"bbcode_quote_container\"></div><div class=\"bbcode_postedby\"><img alt=\"Quote\" src=\"Images/quote_icon.png\" title=\"Quote\">" +
                                "Originally Posted by <strong> " + userNamePosted + "</strong>" + "</div><div class=\"message\">" + content + "</div></div></div></div>";
    }


    protected void btnSubmitNewReply_Click(object sender, EventArgs e)
    {
        string contents = Editor1.Content;
        if (contents.Length >= 100)
        {
            Post newPost = new Post();
            if (Request.QueryString["topicID"] != null || Request.QueryString["topicID"].Length > 0)
            {
                newPost.TopicID = Convert.ToInt32(Request.QueryString["topicID"]);
                Member memberloged = (Member)Session["UserLoged"];
                if (memberloged != null)
                {
                    newPost.MemberID = memberloged.MemberID;
                }
                newPost.QuoteID = 0;
                newPost.Content = contents;
                newPost.DateEdited = DateTime.Now;
                newPost.Signature = true;
                int result = PostBLL.InsertPost(newPost);
                if (result > 0)
                {
                    Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
                }
            }
            else
            {
                Server.Transfer("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('The contents you have entered is too short. Please lengthen your contents to at least 100 Characters.');</script>");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["topicID"] != null)
        {
            Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
        }
        else
        {
            Response.Redirect("Index.aspx");
        }

    }
}
