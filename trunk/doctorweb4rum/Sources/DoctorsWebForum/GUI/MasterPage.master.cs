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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Member[] membersOnline = MemberBLL.GetMembersIsOnline();
            if (membersOnline.Length > 0)
            {
                repeaterMembersIsOnline.DataSource = membersOnline;
                repeaterMembersIsOnline.DataBind();
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            ModalPopupExtenderLogin.Enabled = true;
            ModalPopupExtenderLogin.Show();
        }
        if (Page.IsValid)
        {
            ModalPopupExtenderLogin.Hide();
            string userName = txtUserName.Text;
            string password = txtPassword.Text;
            if (userName.Length > 0 || userName != null || password.Length > 0 || password != null)
            {
                Member member = MemberBLL.GetMemberByUserNamePassword(userName, password);
                if (member != null)
                {
                    Session["id"] = member.MemberID;
                    member.IsOnline = true;
                    MemberBLL.UpdateMember(member);
                    if (member.AllowLogin)
                    {
                        MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
                        if (memberProfile != null)
                        {
                            string origin = Request.QueryString["ReturnURL"];
                            if (origin == null)
                            {
                                origin = "Index.aspx";
                            }
                            Session.Add("UserLoged", member);
                            Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                            if (role != null)
                            {
                                Response.Redirect(origin);
                                //if (role.RoleName.Equals("Member"))
                                //{
                                //    Response.Redirect(origin);
                                //}
                                //if (role.RoleName.Equals("Moderator"))
                                //{
                                //    Response.Redirect(origin);
                                //}
                                //if (role.RoleName.Equals("Super Moderator"))
                                //{
                                //    Response.Redirect(origin);
                                //}
                                //if (role.RoleName.Equals("Admin"))
                                //{
                                //    Response.Redirect(origin);
                                //}
                            }
                        }
                    }
                    else
                    {
                        String contentMessage = "You have been banned forever!";
                        Response.Redirect("ForumMessage.aspx?typeMessage=" + contentMessage);
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string userName = txtUserName.Text;
        string password = txtPassword.Text;
        Member member = MemberBLL.GetMemberByUserNamePassword(userName, password);
        if (member == null)
        {
            args.IsValid = false;
        }
    }

    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Search.aspx?searchString=" + txtSearch.Text);
    }
    protected void Logoutlnk_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLoged");
        if (Session["id"] != null)
        {
            Member member = BLL.MemberBLL.GetMemberByMemberID(Convert.ToInt32(Session["id"].ToString()));
            member.IsOnline = false;
            BLL.MemberBLL.UpdateMember(member);
            String contentMessage = "All cookies cleared!";
            Response.Redirect("ForumMessage.aspx?typeMessage=" + contentMessage);
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

    public String FunctionByRoles()
    {
        String function = "";
        if (Session["UserLoged"] != null)
        {
            Member member = (Member)Session["UserLoged"];
            MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
            if (memberProfile != null)
            {
                Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                if (role != null)
                {
                    if (role.RoleName.Equals("Member"))
                    {
                        function = "<li><a href=\"#\" target=\"_blank\" rel=\"nofollow\" accesskey=\"9\"></a></li>";
                    }
                    if (role.RoleName.Equals("Admin"))
                    {
                        function = "<li><a href=\"Admin/Login.aspx\" target=\"_blank\" rel=\"nofollow\" accesskey=\"9\">Admin</a></li>";
                    }
                }
            }

        }
        return function;
    }
}

