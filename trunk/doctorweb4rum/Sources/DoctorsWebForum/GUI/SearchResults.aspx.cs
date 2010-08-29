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
using BLL;
using TuyenPV;
using System.Collections.Specialized;
using System.Collections.Generic;
public partial class GUI_SearchResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["keysSearch"] != null)
            {
                NameValueCollection nameValuesCollection = (NameValueCollection)Session["keysSearch"];
                string keySearchString = (string)nameValuesCollection["keySearchString"];
                string categories = (string)nameValuesCollection["Categories"];
                string subForums = (string)nameValuesCollection["SubForums"];
                string txtKeyUserName = (string)nameValuesCollection["txtKeyUserName"];
                string txtFromDateCreate = (string)nameValuesCollection["txtFromDateCreate"];
                string txtToDateCreate = (string)nameValuesCollection["txtToDateCreate"];

                Topic[] topics = TopicBLL.SearchTopic(keySearchString, categories, subForums, txtKeyUserName, txtFromDateCreate, txtToDateCreate);
                if (topics != null)
                {
                    repeaterTopics.DataSource = topics;
                    repeaterTopics.DataBind();
                }
                else
                {
                    Response.Redirect("Search.aspx");
                }
                
            }
            else
            {
                Response.Redirect("Search.aspx");
            }

        }
        List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
        nodes.Add(new KeyValuePair<string, Uri>("Search Results", Request.Url));
        ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
        this.Page.Title = "Search Results";
    }

    public Member GetMemberOfTopicByTopicID(int topicID)
    {

        return MemberBLL.GetMemberOfTopicByTopicID(topicID);
    }

    public String GetCountPostsByTopicID(int topicID)
    {
        return PostBLL.GetCountPostsByTopicID(topicID).ToString();
    }

    public String GetTotalViewsByTopicID(int topicID)
    {
        return TopicBLL.GetTotalViewsByTopicID(topicID).ToString();
    }

    public Post GetLastPostOfTopicByTopicID(int topicID)
    {
        Post p = PostBLL.GetLastPostOfTopicByTopicID(topicID);
        if (p == null)
        {
            return new Post();
        }
        else
        {
            return p;
        }
    }

    public Member GetLastMemberPostByTopicID(int topicID)
    {
        Member mem = MemberBLL.GetLastMemberPostByTopicID(topicID);
        if (mem == null)
        {
            return new Member();
        }
        else
        {
            return mem;
        }

    }

    public String CountDaysOldOfTopicByTopicID(int topicID)
    {
        String result = "";
        int dayOld = TopicBLL.CountDaysOldOfTopicByTopicID(topicID);
        switch (dayOld)
        {
            case 0:
                result = "Today";
                break;
            case 1:
                result = "Yesterday";
                break;
            default:
                result = dayOld.ToString() + " days old";
                break;
        }
        return result;
    }
}
