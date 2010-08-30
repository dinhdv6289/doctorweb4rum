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

public partial class GUI_Search : System.Web.UI.Page
{
    private string searchString = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblErrors.Text = "";
            Category[] categories = CategoryBLL.GetAllCategory();
            DropDownList1.Items.Add(new ListItem("--Select Category--", "0"));
            foreach (Category c in categories)
            {
                DropDownList1.Items.Add(new ListItem(c.CategoryName, c.CategoryID.ToString()));
            }
            DropDownList2.Items.Add(new ListItem("--Select SubForum--", "0"));
            DropDownList2.Enabled = false;
            try
            {
                searchString = Request.QueryString["searchString"];
                if (searchString == null || searchString == "")
                {
                    lblErrors.Text = "Please add more constraints to your search. Searches that return all or most of the database are a bad idea.";

                }
                else
                {
                    InitialValuesToSearch();
                }
            }
            catch (Exception ex)
            {
                lblErrors.Text = "Please add more constraints to your search. Searches that return all or most of the database are a bad idea.";
            }

        }
        List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
        nodes.Add(new KeyValuePair<string, Uri>("Search", Request.Url));
        ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
        this.Page.Title = "Search";
        
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
            SubForum[] subForums = SubForumBLL.GetAllSubForumsByCategoryID(Convert.ToInt32(DropDownList1.SelectedValue));
            foreach (SubForum s in subForums)
            {
                DropDownList2.Items.Add(new ListItem(s.SubForumName, s.SubForumID.ToString()));
            }
            DropDownList2.Enabled = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtKeySearch.Text == "" || txtKeySearch.Text == null)
        {
            lblErrors.Text = "Please add more constraints to your search. Searches that return all or most of the database are a bad idea.";
        }
        else
        {
            
            InitialValuesToSearch2();
        }
    }

    private void InitialValuesToSearch()
    {
        Session.Remove("keysSearch");
        lblErrors.Text = "";
        NameValueCollection myCol = new NameValueCollection();
        myCol.Add("keySearchString", searchString);
        myCol.Add("Categories", DropDownList1.SelectedValue);
        myCol.Add("SubForums", DropDownList2.SelectedValue);
        myCol.Add("txtKeyUserName", txtKeyUserName.Text);
        myCol.Add("txtFromDateCreate", txtFromDateCreate.Text);
        myCol.Add("txtToDateCreate", txtToDateCreate.Text);
        Session.Add("keysSearch", myCol);
        Response.Redirect("SearchResults.aspx");
    }

    private void InitialValuesToSearch2()
    {
        Session.Remove("keysSearch");
        lblErrors.Text = "";
        NameValueCollection myCol = new NameValueCollection();
        myCol.Add("keySearchString", txtKeySearch.Text);
        myCol.Add("Categories", DropDownList1.SelectedValue);
        myCol.Add("SubForums", DropDownList2.SelectedValue);
        myCol.Add("txtKeyUserName", txtKeyUserName.Text);
        myCol.Add("txtFromDateCreate", txtFromDateCreate.Text);
        myCol.Add("txtToDateCreate", txtToDateCreate.Text);
        Session.Add("keysSearch", myCol);
        Response.Redirect("SearchResults.aspx");
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
