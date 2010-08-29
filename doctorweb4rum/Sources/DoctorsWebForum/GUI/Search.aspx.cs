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

public partial class GUI_Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Category[] categories = CategoryBLL.GetAllCategory();
            DropDownList1.Items.Add(new ListItem("--Select Category--", "0"));
            foreach (Category c in categories)
            {
                DropDownList1.Items.Add(new ListItem(c.CategoryName, c.CategoryID.ToString()));
            }
            DropDownList2.Items.Add(new ListItem("--Select SubForum--", "0"));
            DropDownList2.Enabled = false;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("0"))
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add(new ListItem("--Select SubForum--", "0"));
            DropDownList2.Enabled = false;
        }
        else
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add(new ListItem("--Select SubForum--", "0"));
            SubForum[] subForums = SubForumBLL.GetlAllSubForumsByCategoryID(Convert.ToInt32(DropDownList1.SelectedValue));
            foreach (SubForum s in subForums)
            {
                DropDownList2.Items.Add(new ListItem(s.SubForumName, s.SubForumID.ToString()));
            }
            DropDownList2.Enabled = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        repeaterTopics.DataSource = TopicBLL.SearchTopic(txtKeySearch.Text, DropDownList1.SelectedValue,
            DropDownList2.SelectedValue, txtKeyUserName.Text, txtFromDateCreate.Text, txtToDateCreate.Text);
        repeaterTopics.DataBind();

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
