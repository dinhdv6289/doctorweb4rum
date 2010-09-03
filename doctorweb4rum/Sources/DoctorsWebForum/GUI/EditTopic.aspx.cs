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


public partial class GUI_EditTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String topicID = Request.QueryString["topicID"];
            if (topicID != null)
            {
                Topic topicToEdit = TopicBLL.GetTopicByTopicID(Convert.ToInt32(topicID));
                if (topicToEdit != null)
                {
                    txtTitle.Text = topicToEdit.Title;
                    Editor1.Content = topicToEdit.Content;
                    SubForum sf = SubForumBLL.GetSubForumBySubForumID(topicToEdit.SubForumID);
                    List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                    nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, new Uri(Request.Url, string.Format("ShowTopics.aspx?subForumID={0}", sf.SubForumID))));
                    nodes.Add(new KeyValuePair<string, Uri>(topicToEdit.Title, Request.Url));
                    ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                }
            }
        }
        this.Page.Title = "Edit Topic";
    }

    protected void btnSaveChanges_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text.Length >= 15 && txtTitle.Text.Length <= 100)
        {
            if (Editor1.Content.Length >= 100)
            {
                String topicID = Request.QueryString["topicID"];
                if (topicID != null)
                {
                    Topic topicToEdit = TopicBLL.GetTopicByTopicID(Convert.ToInt32(topicID));
                    if (topicToEdit != null)
                    {
                        topicToEdit.Title = txtTitle.Text;
                        topicToEdit.Content = Editor1.Content;
                        topicToEdit.TopicID = topicToEdit.TopicID;
                        int result = TopicBLL.EditTopic(topicToEdit);
                        if (result > 0)
                        {
                            Response.Redirect("TopicDetails.aspx?topicID=" + topicID);
                        }
                    }
                }
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('The contents you have entered is too short. Please lengthen your contents to at least 100 Characters.');</script>");
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Errors", "<script>alert('The Title you have entered is too short. Please lengthen your contents to at least 15 Characters.');</script>");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("TopicDetails.aspx?topicID=" + Request.QueryString["topicID"]);
    }
}
