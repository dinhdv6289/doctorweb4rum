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


public partial class GUI_EditPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String postID = Request.QueryString["postID"];
            if (postID != null)
            {
                Post postToEdit = PostBLL.GetPostByPostID(Convert.ToInt32(postID));
                if (postToEdit != null)
                {
                    Editor1.Content = postToEdit.Content;
                    Topic topic = TopicBLL.GetTopicByTopicID(postToEdit.TopicID);
                    SubForum sf = SubForumBLL.GetSubForumBySubForumID(topic.SubForumID);
                    List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                    nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, new Uri(Request.Url, string.Format("ShowTopics.aspx?subForumID={0}", sf.SubForumID))));
                    nodes.Add(new KeyValuePair<string, Uri>(topic.Title, Request.Url));
                    ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                }
            }
        }
        this.Page.Title = "Edit Post";
    }
    protected void btnSaveChanges_Click(object sender, EventArgs e)
    {
        if (Editor1.Content.Length >= 100)
        {
            String postID = Request.QueryString["postID"];
            if (postID != null)
            {
                Post postToEdit = PostBLL.GetPostByPostID(Convert.ToInt32(postID));
                if (postToEdit != null)
                {
                    postToEdit.Content = Editor1.Content;
                    int result = PostBLL.EditPost(postToEdit);
                    if (result > 0)
                    {
                        Response.Redirect("TopicDetails.aspx?topicID=" + postToEdit.TopicID.ToString());
                    }
                }
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('The contents you have entered is too short. Please lengthen your contents to at least 100 Characters.');</script>");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        String postID = Request.QueryString["postID"];
        if (postID != null)
        {
            Post postToEdit = PostBLL.GetPostByPostID(Convert.ToInt32(postID));
            if (postToEdit != null)
            {
                Response.Redirect("TopicDetails.aspx?topicID=" + postToEdit.TopicID.ToString());
            }
        }
    }
}
