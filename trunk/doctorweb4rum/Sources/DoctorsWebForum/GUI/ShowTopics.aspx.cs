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
public partial class GUI_ShowTopics : System.Web.UI.Page
{
    private int subID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        String subForumID = Request.QueryString["subForumID"];
        if (subForumID != null)
        {
            if (!IsPostBack)
            {
                subID = Convert.ToInt32(subForumID);
                LoadData(subID);
                SubForum sf = SubForumBLL.GetSubForumBySubForumID(subID);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
            }
        }
        else
        {
            Response.Redirect("Index.aspx");
        }
    }

    private void LoadData(int subForumID)
    {
        repeaterTopics.DataSource = TopicBLL.GetAllTopicBySubForumID(subForumID);
        repeaterTopics.DataBind();

    }

    public SubForum GetSubForumBySubForumID()
    {
        return SubForumBLL.GetSubForumBySubForumID(subID);
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
        return TopicBLL.CountDaysOldOfTopicByTopicID(topicID).ToString();
    }

}
