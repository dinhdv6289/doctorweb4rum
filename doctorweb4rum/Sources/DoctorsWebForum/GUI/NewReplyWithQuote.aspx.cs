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

public partial class GUI_NewReplyWithQuote : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String topicID = Request.QueryString["topicID"];
        String postID = Request.QueryString["postID"];
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
            }
            else
            {
                Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
            }
        }
    }

    public string GetContent()
    {
        string content = "";
        String postID = Request.QueryString["postID"];
        if (postID != null)
        {
            int postId = Convert.ToInt32(postID);
            Post post = PostBLL.GetPostByPostID(postId);
            if (post != null)
                content = post.Content;
        }
        return content;
    }

    public string OriginallyPostedBy()
    {
        string originallyPostedBy = "";
        String postID = Request.QueryString["postID"];
        if (postID != null)
        {
            int postId = Convert.ToInt32(postID);
            Post post = PostBLL.GetPostByPostID(postId);
            if (post != null)
                originallyPostedBy = MemberBLL.GetMemberByMemberID(post.MemberID).UserName;
        }
        return originallyPostedBy;
    }

    protected void btnSubmitNewReply_Click(object sender, EventArgs e)
    {
        string contents = Editor1.Content;
        if (contents.Length >= 100)
        {
            Post newPost = new Post();
            if (Request.QueryString["topicID"] != null || Request.QueryString["topicID"].Length > 0 || Request.QueryString["postID"] != null || Request.QueryString["postID"].Length > 0)
            {
                newPost.TopicID = Convert.ToInt32(Request.QueryString["topicID"]);
                Member memberloged = (Member)Session["UserLoged"];
                if (memberloged != null)
                {
                    newPost.MemberID = memberloged.MemberID;
                    newPost.IPAddress = MemberBLL.GetMemberProfileByMemberID(memberloged.MemberID).IPAddress;
                }
                newPost.QuoteID = Convert.ToInt32(Request.QueryString["postID"]);
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
        }else
        {
            lblErrors.Text = "Please enter content of Reply! Characters min 100.";
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

    public string GetErrorsMessage()
    {
        if (contents.Length < 100)
        {
            return "<h2 class=\"blockhead\">Errors Message</h2><div class=\"blockbody postpreview\">" +
                "<blockquote class=\"blockrow postcontent restore preview postcontainer forumcontent\" id=\"Blockquote1\">" +
                 "<div class=\"bbcode_container\">" + "Please enter content of Reply! Characters min 100." + "</div></blockquote></div>";
        }
        else
        {
            return "";
        }
    }

}
