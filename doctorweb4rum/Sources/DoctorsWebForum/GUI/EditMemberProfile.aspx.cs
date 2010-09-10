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
public partial class GUI_EditMemberProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserLoged"] != null)
            {
                String memberID = Request.QueryString["memberID"];
                if (memberID != null)
                {
                    Member member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));
                    if (member != null)
                    {
                        MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
                        if (memberProfile != null)
                        {
                            Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                            lblRoleGroup.Text = role.RoleName;
                            txtUserName.Text = member.UserName;
                            txtBirthday.Text = memberProfile.BirthDay.ToShortDateString();
                            txtEmail.Text = member.Email;
                            txtFullName.Text = member.FullName;
                            if (memberProfile.Gender)
                            {
                                lblGender.Text = "Male";
                            }
                            lblGender.Text = "Female";
                            txtDateCreation.Text = member.DateCreation.ToShortDateString();
                            txtProfessional.Text = memberProfile.Professional;
                            txtExperience.Text = memberProfile.Experience;
                            txtCountry.Text = memberProfile.Country;
                            txtAddress.Text = memberProfile.Address;
                            txtYahoo.Text = memberProfile.Yahoo;
                            txtPhone.Text = memberProfile.Phone;
                            txtHospital.Text = memberProfile.Hospital;
                            txtBlog.Text = memberProfile.Blog;
                            txtSignature.Text = memberProfile.Signature;
                            txtAboutMe.Text = memberProfile.AboutMe;
                            panelViewAndEditMember.Visible = true;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Session["UserLoged"] != null)
        {
            String memberID = Request.QueryString["memberID"];
            if (memberID != null)
            {
                Member member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));
                if (member != null)
                {
                    MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(member.MemberID);
                    if (memberProfile != null)
                    {
                        memberProfile.Avatar = txtAvatar.Text;
                        memberProfile.Address = txtAddress.Text;
                        memberProfile.Signature = txtSignature.Text;
                        memberProfile.AboutMe = txtAboutMe.Text;
                        memberProfile.Professional = txtProfessional.Text;
                        memberProfile.Experience = txtExperience.Text;
                        memberProfile.Blog = txtBlog.Text;
                        memberProfile.BirthDay = Convert.ToDateTime(txtBirthday.Text);
                        memberProfile.Yahoo = txtYahoo.Text;
                        memberProfile.Hospital = txtHospital.Text;
                        memberProfile.Phone = txtPhone.Text;
                        memberProfile.Country = txtCountry.Text;
                        member.FullName = txtFullName.Text;
                        member.Email = txtEmail.Text;
                        int result = MemberBLL.UpdateMemberInfo(member, memberProfile);
                        if (result > 0)
                        {
                            panelViewAndEditMember.Visible = false;
                            panelUpdateSuccessfully.Visible = true;
                        }
                        else
                        {
                            panelViewAndEditMember.Visible = false;
                            panelUpdateFailure.Visible = true;
                        }
                    }
                }
            }

        }else
        {
            Response.Redirect("Index.aspx");
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panelViewAndEditMember.Visible = false;
        Response.Redirect("Index.aspx");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        panelUpdateFailure.Visible = false;
        panelViewAndEditMember.Visible = true;
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        panelUpdateSuccessfully.Visible = false;
        panelViewAndEditMember.Visible = true;
    }
}
