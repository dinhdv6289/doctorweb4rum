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
                    collectionpager1.DataSource = dataSetTopicDetails.Tables[0].DefaultView;
                    collectionpager1.BindToControl = repeaterPosts;
                    repeaterPosts.DataSource = collectionpager1.DataSourcePaged;
                }
                DataSet dataThanksOfTopic = TopicBLL.GetAllThanksOfTopicByTopicID(topicID);
                if (dataThanksOfTopic != null)
                {
                    repeaterThanksOfTopic.DataSource = dataThanksOfTopic.Tables[0];
                    repeaterThanksOfTopic.DataBind();
                }
                this.Page.Title = tp.Title;
                int[] result = TopicBLL.GetRatingPoint(topicID);
                topicRating.CurrentRating = result[1];
            }// chuyen den trang thong bao No Thread specified. If you followed a valid link, please notify the administrator
        }

    }

    public String GetQuote(int quoteID)
    {
        String quote = null;
        if (quoteID != 0)
        {
            Post p = PostBLL.GetPostByPostID(Convert.ToInt32(quoteID));
            Member mem = MemberBLL.GetMemberByMemberID(p.MemberID);
            quote = Quote(p.Content, mem.UserName);
        }
        return quote;
    }

    private string Quote(string content, string userNamePosted)
    {
        return "<div class=\"bbcode_container\"><div class=\"bbcode_quote\"><div class=\"quote_container\"><div class=\"bbcode_quote_container\"></div><div class=\"bbcode_postedby\"><img alt=\"Quote\" src=\"Images/quote_icon.png\" title=\"Quote\">" +
                                "Originally Posted by <strong> " + userNamePosted + "</strong>" + "</div><div class=\"message\">" + content + "</div></div></div></div>";
    }

    protected void loadData()
    {
        string TopicID = Request["topicID"];
        if (!string.IsNullOrEmpty(TopicID))
        {
            DataSet dataSetTopicDetails = TopicBLL.TopicDetailsByTopicID(Convert.ToInt32(TopicID));
            if (dataSetTopicDetails != null)
            {
                collectionpager1.DataSource = dataSetTopicDetails.Tables[0].DefaultView;
                collectionpager1.BindToControl = repeaterPosts;
                repeaterPosts.DataSource = collectionpager1.DataSourcePaged;
                repeaterPosts.DataBind();
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

    public DataTable GetAllThanksOfPostByPostID(int postID)
    {
        DataTable allThanks = PostBLL.GetAllThanksOfPostByPostID(postID);
        if (allThanks == null)
        {
            allThanks = new DataTable();
        }
        return allThanks;
        //
    }
    //

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
            int result = TopicBLL.ThankTopic(memberLogin.MemberID, Convert.ToInt32(TopicID));
            if (result > 0)
            {
                LinkButton1.Visible = false;
                DataSet dataThanksOfTopic = TopicBLL.GetAllThanksOfTopicByTopicID(Convert.ToInt32(TopicID));
                if (dataThanksOfTopic != null)
                {
                    repeaterThanksOfTopic.DataSource = dataThanksOfTopic.Tables[0];
                    repeaterThanksOfTopic.DataBind();
                }
                panelThanksOfTopic.Visible = true;
                UpdatePanelRepeaterThanksOfTopic.Update();
            }
        }
    }

    public Boolean isThanked()
    {
        Boolean result = true;
        Member memberLogin = (Member)Session["UserLoged"];
        string TopicID = Request["topicID"];
        topicID = Convert.ToInt32(TopicID);
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
                LinkButton lbt = (LinkButton)repeaterPosts.Items[e.Item.ItemIndex].FindControl("btThank");
                if (lbt != null)
                {
                    lbt.Visible = false;
                }

                UpdatePanel3.Update();
                loadData();
            }
        }
        if (e.CommandName.Equals("ReplyWithQuote"))
        {
            string TopicID = Request["topicID"];
            if (Session["UserLoged"] != null)
            {
                Response.Redirect("NewReplyWithQuote.aspx?topicID=" + TopicID + "&postID=" + e.CommandArgument);
            }
            else
            {
                Response.Redirect("Login.aspx?ReturnURL=NewReplyWithQuote.aspx?topicID=" + TopicID + "&postID=" + e.CommandArgument);
            }
        }
        if (e.CommandName.Equals("QuickReply"))
        {
            string TopicID = Request["topicID"];
            if (Session["UserLoged"] != null)
            {
                Response.Redirect("NewReplyToPost.aspx?topicID=" + TopicID + "&postID=" + e.CommandArgument);
            }
            else
            {
                Response.Redirect("Login.aspx?ReturnURL=NewReplyToPost.aspx?topicID=" + TopicID + "&postID=" + e.CommandArgument);
            }
        }
        if (e.CommandName.Equals("EditPost"))
        {
            if (Session["UserLoged"] != null)
            {
                Response.Redirect("EditPost.aspx?postID=" + e.CommandArgument);
            }
            else
            {
                Response.Redirect("Login.aspx?ReturnURL=EditPost.aspx?postID=" + e.CommandArgument);
            }
        }

    }

    public Boolean isPostThanked(int postID)
    {
        Boolean result = true;
        Member memberLogin = (Member)Session["UserLoged"];
        if (memberLogin != null && !IsMyPost(postID))
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
    protected void CheckLoginToNewReply(object sender, EventArgs e)
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

    protected void CheckLoginToQuickEdit(object sender, EventArgs e)
    {
        string TopicID = Request["topicID"];
        if (Session["UserLoged"] != null)
        {
            Response.Redirect("EditTopic.aspx?topicID=" + TopicID);
        }
        else
        {
            Response.Redirect("Login.aspx?ReturnURL=EditTopic.aspx?topicID=" + TopicID);
        }
    }

    public Boolean IsMyTopic()
    {
        Boolean result = false;
        string TopicID = Request["topicID"];
        if (Session["UserLoged"] != null)
        {
            Member m = (Member)Session["UserLoged"];
            Topic tp = TopicBLL.GetTopicByTopicID(Convert.ToInt32(TopicID));
            if (tp.MemberID == m.MemberID)
            {
                result = true;
            }
        }
        return result;
    }
    public Boolean IsMyPost(int postID)
    {
        Boolean result = false;
        if (Session["UserLoged"] != null)
        {
            Member m = (Member)Session["UserLoged"];
            Post p = PostBLL.GetPostByPostID(postID);
            if (p.MemberID == m.MemberID)
            {
                result = true;
            }
        }
        return result;
    }

    public String ShowStatusOnlineOrOffline(int postID)
    {
        String result = "";
        if (Session["UserLoged"] != null)
        {
            Member m = (Member)Session["UserLoged"];
            Post p = PostBLL.GetPostByPostID(postID);
            if (p.MemberID == m.MemberID)
            {
                result = m.UserName + " is online";
            }
            else
            {
                Member member = MemberBLL.GetMemberByMemberID(p.MemberID);
                if (member != null)
                {
                    result = member.UserName + " is offline";
                }
            }

        }
        else
        {
            Post p = PostBLL.GetPostByPostID(postID);
            if (p != null)
            {
                Member member = MemberBLL.GetMemberByMemberID(p.MemberID);
                if (member != null)
                {
                    result = member.UserName + " is offline";
                }
            }
        }
        return result;
    }

    public String ShowImageStatusOnlineOrOffline(int postID)
    {
        String result = "";

        Post p = PostBLL.GetPostByPostID(postID);
        Member mem = MemberBLL.GetMemberByMemberID(p.MemberID);
        if (mem.IsOnline)
        {
            result = "Images/user-online.png";
        }
        else
        {
            result = "Images/user-offline.png";
        }
        return result;
    }
}
