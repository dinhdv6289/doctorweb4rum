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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String subForumID = Request.QueryString["subForumID"];
            if (subForumID != null)
            {
                lblErrors.Text = "";
                int subID = Convert.ToInt32(subForumID);
                SubForum sf = SubForumBLL.GetSubForumBySubForumID(subID);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                this.Page.Title = sf.SubForumName + "  - New Topic";
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }

    }

    public SubForum GetSubForumBySubForumID()
    {
        return SubForumBLL.GetSubForumBySubForumID(Convert.ToInt32(Request.QueryString["subForumID"]));
    }

    protected void btnSubmitNewTopic_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string contents = Editor1.Content;
        if (checkBoxBelieve.Checked)
        {
            if (title != null || title.Length > 0 || contents.Length > 0 || contents != null)
            {
                if (title.Length <= 150 && title.Length >= 15)
                {
                    Topic newTopic = new Topic();
                    if (Request.QueryString["subForumID"] != null || Request.QueryString["subForumID"].Length > 0)
                    {
                        newTopic.SubForumID = Convert.ToInt32(Request.QueryString["subForumID"]);
                        Member memberloged = (Member)Session["UserLoged"];
                        if (memberloged != null)
                        {
                            newTopic.MemberID = memberloged.MemberID;
                        }
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
                else
                {
                    //Validation The length of Topic must more than 100 character.
                    lblErrors.Text = "The length of Topic must more than 100 character!";

                }
            }
            else
            {
                lblErrors.Text = "Title and content must not null!";
                //validation title and content must not null.
                //   Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Title and content must not null!');window.location.href='NewTopic.aspx';</script>");
            }
        }
        else
        {
            lblErrors.Text = "Please check i believe  is the BEST section for this topic!";
            //validation. please check i believe  is the BEST section for this topic
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Title and content must not null!');window.location.href='NewTopic.aspx';</script>");
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["subForumID"] != null)
        {
            Response.Redirect("ShowTopics.aspx?subForumID=" + Request.QueryString["subForumID"]);
        }
        else
        {
            Response.Redirect("Index.aspx");
        }
    }
}
