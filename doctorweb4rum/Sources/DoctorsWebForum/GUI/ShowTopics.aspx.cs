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
                this.Page.Title = sf.SubForumName;
            }
        }
        else
        {
            Response.Redirect("Index.aspx");
        }
    }

    private void LoadData(int subForumID)
    {
        CollectionPager1.DataSource = TopicBLL.GetAllTopicBySubForumID(subForumID);
        CollectionPager1.BindToControl = repeaterTopics;
        repeaterTopics.DataSource = CollectionPager1.DataSourcePaged;
        //repeaterTopics.DataSource = TopicBLL.GetAllTopicBySubForumID(subForumID);
        //repeaterTopics.DataBind();

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

    public String GetRating(int topicID)
    {
        int[] result = TopicBLL.GetRatingPoint(topicID);
        return "rating" + result[1].ToString();
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
}
