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

public partial class GUI_MemberProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    Member member = (Member)Session("UserLoged");
        //    if (member != null)
        //    {

        //    }
        //}
    }

    public Member GetMember()
    {
        Member member = (Member)Session["UserLoged"];
        if (member == null)
        {
            member = new Member();
        }
        return member;
    }



    public MemberProfile GetMemberProfileByMemberID()
    {
        Member member = (Member)Session["UserLoged"];
        MemberProfile memberProfile = null;
        if (member != null)
        {
            memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
            if (memberProfile == null)
            {
                memberProfile = new MemberProfile();
            }
        }
        return memberProfile;
    }
}
