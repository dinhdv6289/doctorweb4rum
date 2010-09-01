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

public partial class GUI_NewReplyToPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String topicID = Request.QueryString["topicID"];
        String postID = Request.QueryString["postID"];
        String postWithQuote = Request.QueryString["postWithQuote"];
        if (!IsPostBack)
        {
            if (topicID != null && postID != null)
            {
                int topicId = Convert.ToInt32(topicID);
                int postId = Convert.ToInt32(postID);
                Topic topic = TopicBLL.GetTopicByTopicID(topicId);
                Post post = PostBLL.GetPostByPostID(postId);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(topic.Title, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                this.Page.Title = topic.Title;
                try
                {
                    if (postWithQuote == "1" || postWithQuote.Equals("1"))
                    {
                        //Editor1.Content = "<span style=\"font-style: italic;font-size: 8pt;\">" + topic.Content + "</span>";
                        Editor1.Content = post.Quote;
                        //Editor1.Content = "<div class=\"bbcode_container\">" +
                        //    "<div class=\"bbcode_quote\">" +
                        //        "<div class=\"quote_container\">" +
                        //        "<div class=\"bbcode_quote_container\">" +
                        //        "</div>" +
                        //        "<div class=\"bbcode_postedby\">" +
                        //        "<img alt=\"Quote\" src=\"Images/quote_icon.png\" title=\"Quote\">" +
                        //        "Originally Posted by" +
                        //        "<strong>" + "ten user" + "</strong>" + "</div>" +
                        //        "<div class=\"message\">" + post.Content + "</div></div></div></div>";
                        
                    }
                    else
                    {
                        Editor1.Content = "";
                        
                    }
                }
                catch (Exception ex)
                {

                }
            }
            else
            {
                Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
            }
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
                Member memberloged = (Member)Session["UserLoged"];
                if (memberloged != null)
                {
                    newPost.MemberID = memberloged.MemberID;
                }
                Post post = PostBLL.GetPostByPostID(Convert.ToInt32(Request.QueryString["postID"]));
                if(post != null)
                {
                    newPost.Content = Editor1.PlainText;
                }
                newPost.DateEdited = DateTime.Now;
                newPost.Signature = true;
                newPost.IPAddress = "5564545455";
                newPost.Quote = "<div class=\"bbcode_container\">" +
                            "<div class=\"bbcode_quote\">" +
                                "<div class=\"quote_container\">" +
                                "<div class=\"bbcode_quote_container\">" +
                                "</div>" +
                                "<div class=\"bbcode_postedby\">" +
                                "<img alt=\"Quote\" src=\"Images/quote_icon.png\" title=\"Quote\">" +
                                "Originally Posted by" +
                                "<strong>" + "ten user" + "</strong>" + "</div>" +
                                "<div class=\"message\">" + post.Content + "</div></div></div></div>";
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
