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
using System.Collections.Generic;
using TuyenPV;

public partial class GUI_MemberProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String memberID = Request.QueryString["memberID"];

            if (memberID != null)
            {
               Member member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));
                if(!member.IsPublic)
                {
                    String contents = "Profile member is prevent.";
                    Response.Redirect("ForumMessage.aspx?typeMessage="+contents);
                }
            }
            List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
            nodes.Add(new KeyValuePair<string, Uri>("MemberProfile", Request.Url));
            ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
        }
    }

    public Member GetMember()
    {
        Member member = null;
        String memberID = Request.QueryString["memberID"];

        if (memberID != null)
        {
            member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));
            if (member == null)
            {
                member = new Member();
            }
        }
        return member;
    }



    public MemberProfile GetMemberProfileByMemberID()
    {
        Member member;
        MemberProfile memberProfile = null;
        String memberID = Request.QueryString["memberID"];

        if (memberID != null)
        {
            member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));

            if (member != null)
            {
                memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
                if (memberProfile == null)
                {
                    memberProfile = new MemberProfile();
                }
            }
        }
        return memberProfile;
    }
}
