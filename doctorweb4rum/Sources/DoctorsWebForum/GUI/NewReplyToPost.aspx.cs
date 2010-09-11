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

        if (!IsPostBack)
        {
            if (topicID != null && postID != null)
            {
                int topicId = Convert.ToInt32(topicID);
                int postId = Convert.ToInt32(postID);
                Topic topic = TopicBLL.GetTopicByTopicID(topicId);
                this.Page.Title = topic.Title;
                SubForum sf = SubForumBLL.GetSubForumBySubForumID(topic.SubForumID);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, new Uri(Request.Url, string.Format("ShowTopics.aspx?subForumID={0}", sf.SubForumID))));
                nodes.Add(new KeyValuePair<string, Uri>(topic.Title, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
            }
            else
            {
                Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
            }
        }
    }


    protected void btnSubmitNewReply_Click(object sender, EventArgs e)
    {
        if (Editor1.Content.Length >= 100)
        {
            Post newPost = new Post();
            if (Request.QueryString["topicID"] != null || Request.QueryString["topicID"].Length > 0 || Request.QueryString["postID"] != null || Request.QueryString["postID"].Length > 0)
            {
                newPost.TopicID = Convert.ToInt32(Request.QueryString["topicID"]);
                Member memberloged = (Member)Session["UserLoged"];
                MemberProfile memberProfile = null;
                if (memberloged != null)
                {
                    newPost.MemberID = memberloged.MemberID;
                    memberProfile = MemberBLL.GetMemberProfileByMemberID(memberloged.MemberID);
                }
                newPost.QuoteID = 0;
                newPost.Content = Editor1.Content;
                newPost.DateEdited = DateTime.Now;
                newPost.Signature = true;
                int result = PostBLL.InsertPost(newPost);
                if (result > 0)
                {
                    memberProfile.TotalPosts = memberProfile.TotalPosts + 1;
                    MemberBLL.UpdateTotalPostOfMemberByMemberID(memberProfile);
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
