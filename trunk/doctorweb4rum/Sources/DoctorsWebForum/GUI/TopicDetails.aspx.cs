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
        if (!IsPostBack)
        {
            string TopicID = Request["topicID"];
            topicID = Convert.ToInt32(TopicID);
            if (!string.IsNullOrEmpty(TopicID))
            {
                Topic tp = TopicBLL.GetTopicByTopicID(topicID);
                SubForum sf = SubForumBLL.GetSubForumBySubForumID(tp.SubForumID);
                List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
                nodes.Add(new KeyValuePair<string, Uri>(sf.SubForumName, new Uri(Request.Url, string.Format("ShowTopics.aspx?subForumID={0}", sf.SubForumID))));
                nodes.Add(new KeyValuePair<string, Uri>(tp.Title, Request.Url));
                ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
                DataSet dataSetTopicDetails = TopicBLL.TopicDetailsByTopicID(Convert.ToInt32(TopicID));
                if (dataSetTopicDetails != null)
                {
                    CollectionPager1.DataSource = dataSetTopicDetails.Tables[0].DefaultView;
                    CollectionPager1.BindToControl = repeaterPosts;
                    repeaterPosts.DataSource = CollectionPager1.DataSourcePaged;
                }
                this.Page.Title = tp.Title;
                int[] result = TopicBLL.GetRatingPoint(topicID);
                topicRating.CurrentRating = result[1];
            }// chuyen den trang thong bao No Thread specified. If you followed a valid link, please notify the administrator
        }

    }


    protected void loadData()
    {
        string TopicID = Request["topicID"];
        if (!string.IsNullOrEmpty(TopicID))
        {
            DataSet dataSetTopicDetails = TopicBLL.TopicDetailsByTopicID(Convert.ToInt32(TopicID));
            if (dataSetTopicDetails != null)
            {
                CollectionPager1.DataSource = dataSetTopicDetails.Tables[0].DefaultView;
                CollectionPager1.BindToControl = repeaterPosts;
                repeaterPosts.DataSource = CollectionPager1.DataSourcePaged;
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
    protected void topicRating_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        Member memberLogin = (Member)Session["UserLoged"];
        if (memberLogin != null)
        {
            string TopicID = Request["topicID"];
            int rate = Convert.ToInt32(e.Value);
            RatingTopic rt = new RatingTopic();
            rt.RateDate = DateTime.Now;
            rt.RatePoint = rate;
            rt.FromMember = memberLogin.MemberID;
            rt.TopicID = Convert.ToInt32(TopicID);
            TopicBLL.InsertRatingTopic(rt);
            topicRating.CurrentRating = TopicBLL.GetRatingPoint(topicID)[1];
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Member memberLogin = (Member)Session["UserLoged"];
        if (memberLogin != null)
        {
            string TopicID = Request["topicID"];
            TopicBLL.ThankTopic(memberLogin.MemberID, Convert.ToInt32(TopicID));
            loadData();
        }
    }

    public Boolean isThanked()
    {
        Boolean result = true;
        Member memberLogin = (Member)Session["UserLoged"];
        if (memberLogin != null)
        {
            result = TopicBLL.isThanked(topicID, memberLogin.MemberID);
        }
        else
        {
            result = true;
        }
        return result;
    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {

    }
    #endregion
    protected void repeaterPosts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("ThankClick"))
        {
            int postID = Convert.ToInt32(e.CommandArgument);
            Member memberLogin = (Member)Session["UserLoged"];
            if (memberLogin != null)
            {
                PostBLL.ThankPost(memberLogin.MemberID, postID);
                loadData();
            }
        }
    }

    public Boolean isPostThanked(int postID)
    {
        Boolean result = true;
        Member memberLogin = (Member)Session["UserLoged"];
        if (memberLogin != null)
        {
            result = !PostBLL.isThanked(postID, memberLogin.MemberID);
        }
        else
        {
            result = false;
        }
        return result;
    }
    protected void Rating_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        Member memberLogin = (Member)Session["UserLoged"];
        if (memberLogin != null)
        {
            int rate = Convert.ToInt32(e.Value);
            RatingPost rp = new RatingPost();
            rp.RateDate = DateTime.Now;
            rp.RatePoint = rate;
            rp.FromMember = memberLogin.MemberID;
            rp.PostID = Convert.ToInt32(e.Tag);
            PostBLL.InsertRatePost(rp);
            loadData();
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        CheckLoginToNewReply();
    }

    private void CheckLoginToNewReply()
    {
        string TopicID = Request["topicID"];
        if (Session["UserLoged"] != null)
        {
            Response.Redirect("NewReply.aspx?topicID=" + TopicID);
        }
        else
        {
            Response.Redirect("Login.aspx?ReturnURL=NewReply.aspx?topicID=" + TopicID);
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        CheckLoginToNewReply();
    }
}
