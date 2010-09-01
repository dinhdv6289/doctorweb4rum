using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using TuyenPV;
using BLL;

public partial class GUI_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
        this.Title = "Doctors WebForum";
    }

    private void LoadData()
    {
        repeaterCategories.DataSource = CategoryBLL.GetAllCategory();
        repeaterCategories.DataBind();
    }

    public SubForum[] GetAllSubForumsByCategoryID(int CategoryID)
    {
        return SubForumBLL.GetAllSubForumsByCategoryID(CategoryID);
    }

    public String GetImageStatus(int SubForumID)
    {
        if (SubForumBLL.GetImageStatus(SubForumID))
        {
            return @"Images/forum_new-48.png";
        }
        else
        {
            return @"Images/forum_old-48.png";
        }
    }
    public String CountTopicsInSubForumBySubForumID(int subForumID)
    {
        return TopicBLL.CountTopicsInSubForumBySubForumID(subForumID).ToString();
    }

     public String GetCountPostBySubForumID(int subForumID)
     {
         return PostBLL.GetCountPostBySubForumID(subForumID).ToString();
     }

    public String GetLastPostInformationBySubForumID(int subForumID)
    {
        String result;
        String s1 = "<div class=\"forumlastpost td\">" +
            " <h4 class=\"lastpostlabel\"> Last Post:</h4><div><p class=\"lastposttitle\">" +
          "<a class=\"threadtitle\" href=\"TopicDetails.aspx?TopicID=";
        String s2 = "</a></p><div class=\"lastpostby\"> by: ";
        String s3 = "<div class=\"popupmenu memberaction\" id=\"yui-gen11\"><a href=\"MemberProfile.aspx?MemberID=";
        String s4 = "\" class=\"username offline popupctrl\" id=\"yui-gen13\"><strong>";
        String s5 = "</strong></a></div></div><p class=\"lastpostdate\"><span class=\"time\">";
        Topic topic = TopicBLL.GetNewTopicBySubForumID(subForumID);
        if(topic!= null)
        {
            Member member = MemberBLL.GetMemberByMemberID(topic.MemberID);
            result = s1 + topic.TopicID + "\">" + topic.Title + s2 + s3 + member.MemberID
                + s4 + member.UserName + s5 +topic.DateCreate + "</span></p>";
        }else
        {
            result = "<p>No Topics</p>";
        }
        return result;
    }
   
}
