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

public partial class GUI_TopicDetails : System.Web.UI.Page
{
    protected int topicID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string TopicID = Request["topicID"];
        if (!string.IsNullOrEmpty(TopicID))
        {
            topicID = Convert.ToInt32(TopicID);
            if (!IsPostBack)
            {
                Topic tp = TopicBLL.GetTopicByTopicID(topicID);
                SubForum sf = SubForumBLL.GetSubForumBySubForumID(tp.SubForumID);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, new Uri(Request.Url, string.Format("ShowTopics.aspx?subForumID={0}", sf.SubForumID))));
                nodes.Add(new KeyValuePair<string, Uri>(tp.Title, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                DataSet dataSetTopicDetails = TopicBLL.TopicDetailsByTopicID(Convert.ToInt32(TopicID));
                if(dataSetTopicDetails != null)
                {
                    repeaterPosts.DataSource = dataSetTopicDetails.Tables[0];
                    repeaterPosts.DataBind();
                }
                this.Page.Title = tp.Title;
            }
        }
    }


    public Topic GetTopic()
    {
        Topic topic = TopicBLL.GetTopicByTopicID(Convert.ToInt32(Request["topicID"]));
        if (topic == null)
        {
            topic = new Topic();
        }
        return topic;
    }

    public Member GetMemberByMemberID(int memberID)
    {
        Member mem = MemberBLL.GetMemberByMemberID(memberID);
        if (mem == null)
        {
            mem = new Member();
        }
        return mem;
    }


    public MemberProfile GetMemberProfileByMemberID(int memberID)
    {
        MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(memberID);
        if (memberProfile == null)
        {
            memberProfile = new MemberProfile();
        }
        return memberProfile;
    }

    //public Member GetMemberByMemberID(int memberID)
    //{
    //    Member mem = MemberBLL.GetMemberByMemberID(memberID);
    //    if (mem == null)
    //    {
    //        mem = new Member();
    //    }
    //    return mem;
    //}
}
