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
        String topicID = Request.QueryString["topicID"];
        String withQuote = Request.QueryString["withQuote"];
        if (!IsPostBack)
        {
            this.Page.Title = "New Reply";
            if (topicID != null)
            {
                int topicId = Convert.ToInt32(topicID);
                Topic topic = TopicBLL.GetTopicByTopicID(topicId);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(topic.Title, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                
                lblErrors.Text = "";
            }
            else
            {
                Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
            }

        }

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
                    newPost.IPAddress = MemberBLL.GetMemberProfileByMemberID(memberloged.MemberID).IPAddress;
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
}
