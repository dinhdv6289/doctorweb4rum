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


public partial class GUI_Admin_MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {

    }

    
    protected void Logoutlnk_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLoged");
        if (Session["id"] != null)
        {
            Member member = BLL.MemberBLL.GetMemberByMemberID(Convert.ToInt32(Session["id"].ToString()));
            member.IsOnline = false;
            BLL.MemberBLL.UpdateMember(member);
            Response.Redirect("Login.aspx");
        };
    }

    public int MembersOnline()
    {
        return MemberBLL.MembersOnline();
    }

    public String GetStatistics()
    {
        DataSet ds = CategoryBLL.GetStatistics();
        return "<dl><dt>Topics</dt><dd> " + (int)ds.Tables[0].Rows[0]["TotalTopic"] +
            "</dd><dt>Posts</dt><dd> " + (int)ds.Tables[0].Rows[0]["TotalPost"] +
        "</dd><dt>Members</dt><dd> " + (int)ds.Tables[0].Rows[0]["TotalMember"] +
        "</dd></dl><p>Welcome to our newest member, <a href=\"MemberProfile.aspx?memberID=" + (int)ds.Tables[0].Rows[0]["MemberID"] +
        "\">" + (String)ds.Tables[0].Rows[0]["NewestMember"] + "</a></p>";
    }
}
