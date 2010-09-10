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
            Member member = (Member)Session["UserLoged"];
            if (member != null)
            {

                DataSet dataInfo = MemberBLL.GetAllInfoOfMemberByMemberID(member.MemberID);
                if (dataInfo != null)
                {
                    memberIDHiddend.Value = member.MemberID.ToString();
                    DataTable dataInfoDetails = dataInfo.Tables[0];
                    int roleID = Convert.ToInt32(dataInfoDetails.Rows[0]["RoleID"].ToString());
                    Role role = RoleBLL.GetRoleByRoleID(roleID);
                    lblRoleGroup.Text = role.RoleName;
                   
                    txtAvatar.Text = dataInfoDetails.Rows[0]["Avatar"].ToString();
                    txtUserName.Text = dataInfoDetails.Rows[0]["UserName"].ToString();
                    txtBirthday.Text = dataInfoDetails.Rows[0]["BirthDay"].ToString();
                    txtEmail.Text = dataInfoDetails.Rows[0]["Email"].ToString();
                    txtFullName.Text = dataInfoDetails.Rows[0]["FullName"].ToString();
                    Boolean gender = Convert.ToBoolean(dataInfoDetails.Rows[0]["Gender"].ToString());
                    if (gender)
                    {
                        lblGender.Text = "Male";
                    }
                    lblGender.Text = "Female";
                    txtDateCreation.Text = dataInfoDetails.Rows[0]["DateCreation"].ToString();
                    txtProfessional.Text = dataInfoDetails.Rows[0]["Professional"].ToString();
                    txtExperience.Text = dataInfoDetails.Rows[0]["Experience"].ToString();
                    txtCountry.Text = dataInfoDetails.Rows[0]["Country"].ToString();
                    txtAddress.Text = dataInfoDetails.Rows[0]["Address"].ToString();
                    txtYahoo.Text = dataInfoDetails.Rows[0]["Yahoo"].ToString();
                    txtPhone.Text = dataInfoDetails.Rows[0]["Phone"].ToString();
                    txtHospital.Text = dataInfoDetails.Rows[0]["Hospital"].ToString();
                    txtBlog.Text = dataInfoDetails.Rows[0]["Blog"].ToString();
                    txtSignature.Text = dataInfoDetails.Rows[0]["Signature"].ToString();
                    txtAboutMe.Text = dataInfoDetails.Rows[0]["AboutMe"].ToString();
                    panelViewAndEditMember.Visible = true;
                }
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataSet dataInfo = MemberBLL.GetAllInfoOfMemberByMemberID(Convert.ToInt32(memberIDHiddend.Value));
        if (dataInfo != null)
        {
            Member member = new Member();
            member.MemberID = Convert.ToInt32(memberIDHiddend.Value);
            MemberProfile memberProfile = new MemberProfile();
            memberProfile.RoleID = Convert.ToInt32(dataInfo.Tables[0].Rows[0]["RoleID"].ToString());
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
                panelUpdateSuccessfully.Visible = true;
                panelViewAndEditMember.Visible = true;
            }
            else
            {
                panelViewAndEditMember.Visible = false;
                panelUpdateFailure.Visible = true;
            }
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
        panelViewAndEditMember.Visible = false;
        panelUpdateSuccessfully.Visible = false;

    }
}
