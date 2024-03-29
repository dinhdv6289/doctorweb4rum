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
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using BLL;
using System.Collections.Generic;
using TuyenPV;
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
                            txtNewEmail.Text = member.Email;
                            txtConfirmNewEmailAddress.Text = member.Email;
                            txtFullName.Text = member.FullName;
                            if (memberProfile.Gender)
                            {
                                lblGender.Text = "Male";
                            }
                            lblGender.Text = "Female";
                            txtDateCreation.Text = member.DateCreation.ToShortDateString();
                            if (member.IsPublic)
                            {
                                lblPrivacyStatus.Text = "public";
                                checkBoxPrivate.Checked = true;
                            }
                            checkBoxPrivate.Checked = false;
                            lblPrivacyStatus.Text = "private";
                            if (member.IsDoctor)
                            {
                                Doctor.Items[0].Selected = true;
                                drProfessional.SelectedValue = memberProfile.Professional;
                                drExperience.SelectedValue = memberProfile.Experience;
                                txtHospital.Text = memberProfile.Hospital;
                            }else
                            {
                                Doctor.Items[1].Selected = true;
                                drProfessional.SelectedIndex = 0;
                                drExperience.SelectedIndex = 0;
                                txtHospital.Text = "";
                            }
                            drLocation.SelectedValue = memberProfile.Address;
                            txtYahoo.Text = memberProfile.Yahoo;
                            txtPhone.Text = memberProfile.Phone;
                            txtBlog.Text = memberProfile.Blog;
                            txtSignature.Text = memberProfile.Signature;
                            txtAboutMe.Text = memberProfile.AboutMe;
                            HiddenAllPanel();
                            panelViewAndEditMember.Visible = true;

                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
            List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
            nodes.Add(new KeyValuePair<string, Uri>("Edit Profile", Request.Url));
            ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
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
                        memberProfile.Address = drLocation.SelectedValue;
                        memberProfile.Signature = txtSignature.Text;
                        memberProfile.AboutMe = txtAboutMe.Text;
                        if (Doctor.Items[0].Selected)
                        {
                            member.IsDoctor = true;
                            memberProfile.Professional = drProfessional.SelectedValue;
                            memberProfile.Experience = drExperience.SelectedValue;
                            memberProfile.Hospital = txtHospital.Text;
                        }else
                        {
                            member.IsDoctor = false;
                            memberProfile.Professional = "N/A";
                            memberProfile.Experience = "N/A";
                            memberProfile.Hospital = "N/A"; 
                        }
                        memberProfile.Blog = txtBlog.Text;
                        memberProfile.BirthDay = Convert.ToDateTime(txtBirthday.Text);
                        memberProfile.Yahoo = txtYahoo.Text;
                        memberProfile.Phone = txtPhone.Text;
                        member.FullName = txtFullName.Text;
                        member.Email = member.Email;
                        int result = MemberBLL.UpdateMemberInfo(member, memberProfile);
                        if (result > 0)
                        {
                            panelViewAndEditMember.Visible = false;
                            panelUpdateSuccessfully.Visible = true;
                        }
                        else
                        {
                            lblErrors.Text = "Update Information user failure!";
                            panelViewAndEditMember.Visible = false;
                            panelUpdateFailure.Visible = true;
                        }
                    }
                }
            }

        }
        else
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
        HiddenAllPanel();
        panelViewAndEditMember.Visible = true;
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        panelUpdateSuccessfully.Visible = false;
        HiddenAllPanel();
        panelViewAndEditMember.Visible = true;
    }

    public String GetAvatar()
    {
        String result = "";
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
                        result = memberProfile.Avatar;
                    }
                }
            }
        }
        return result;
    }

    protected void btnCancelAvater_Click(object sender, EventArgs e)
    {

    }
    protected void btnSaveAvater_Click(object sender, EventArgs e)
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
                        String avatar = "";
                        String mess = uploadAvatar.FileName;

                        if (checkFile(uploadAvatar, ref mess))
                        {
                            String filename = Server.MapPath("~/GUI/Images/MemberProfiles/Avatar/") + uploadAvatar.FileName;
                            uploadAvatar.SaveAs(filename);
                            avatar = @"Images/MemberProfiles/Avatar/" + uploadAvatar.FileName;
                            memberProfile.Avatar = avatar;
                            MemberBLL.UpdateMemberInfo(member, memberProfile);
                        }
                        lbnMess.Text = mess;
                    }
                }
            }
        }
    }
    protected Boolean checkFile(FileUpload fu, ref String mess)
    {

        if (!fu.HasFile)
        {
            mess = "No file selected.";
            return false;

        }
        // Kiem tra dinh dang
        String ex = Path.GetExtension(fu.FileName);

        Boolean file_ex = false;
        Boolean file_size = true;

        switch (ex.ToLower())
        {
            case ".gif":
                file_ex = true;
                break;
            case ".jpg":
                file_ex = true;
                break;
            case ".bmp":
                file_ex = true;
                break;
            case ".png":
                file_ex = true;
                break;

        }
        if (!file_ex)
        {
            mess = "File format extension is not accepted.";
        }

        if (fu.PostedFile.ContentLength > 1024000)
        {
            file_size = false;
            mess += ", Your file is larger than 1MB";
        }
        return (file_size && file_ex);
    }

    protected void linkButtonEditAvatar_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelAvatar.Visible = true;
    }

    protected void HiddenAllPanel()
    {
        panelAvatar.Visible = false;
        panelUpdateFailure.Visible = false;
        panelUpdateSuccessfully.Visible = false;
        panelViewAndEditMember.Visible = false;
        panelEditEmailPassword.Visible = false;
        panelProfilePrivacy.Visible = false;
    }
    protected void linkButtonEditProfile_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelViewAndEditMember.Visible = true;
    }

    protected void btnSaveChangePasswordEmail_Click(object sender, EventArgs e)
    {
        if (Session["UserLoged"] != null)
        {
            String memberID = Request.QueryString["memberID"];
            if (memberID != null)
            {
                Member member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));
                if (member != null)
                {
                    if (txtOldPassword.Text.Equals(member.Password))
                    {
                        if (txtNewPassword.Text.Equals(txtConfirmNewPassword.Text))
                        {
                            if (txtNewEmail.Text.Equals(txtConfirmNewEmailAddress.Text))
                            {
                                member.Password = txtNewEmail.Text;
                                member.Email = txtNewEmail.Text;
                                int result = MemberBLL.UpdateMember(member);
                                if (result > 0)
                                {
                                    lblUserUpdate.Text = "<b>" + member.UserName + "</b>";
                                    panelUpdateSuccessfully.Visible = true;
                                }
                                else
                                {
                                    lblErrors.Text = "Update Email & Password failure!";
                                    panelEditEmailPassword.Visible = false;
                                    panelUpdateFailure.Visible = true;
                                }
                            }
                            else
                            {
                                lblErrors.Text = "The two email addresses that you entered do not match.";
                                panelEditEmailPassword.Visible = false;
                                panelUpdateFailure.Visible = true;
                            }
                        }
                        else
                        {
                            lblErrors.Text = "The two passwords that you entered do not match.";
                            panelEditEmailPassword.Visible = false;
                            panelUpdateFailure.Visible = true;
                        }
                    }
                    else
                    {
                        lblErrors.Text = "The password you have entered does not match your current one." +
                        "Enter the correct details and try again. Don't forget that the password is case sensitive.";
                        panelEditEmailPassword.Visible = false;
                        panelUpdateFailure.Visible = true;
                    }
                }
            }
        }
    }

    protected void btnCancelChangePasswordEmail_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelViewAndEditMember.Visible = true;

    }

    protected void linkButtonEditEmailPassword_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelEditEmailPassword.Visible = true;
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !(MemberBLL.EmailIsExist(txtNewEmail.Text));
    }


    protected void linkButtonProfilePrivacy_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelProfilePrivacy.Visible = true;
    }

    protected void btnChangeProfilePrivacy_Click(object sender, EventArgs e)
    {
        if (Session["UserLoged"] != null)
        {
            String memberID = Request.QueryString["memberID"];
            if (memberID != null)
            {
                Member member = MemberBLL.GetMemberByMemberID(Convert.ToInt32(memberID));
                if (member != null)
                {
                    if (checkBoxPrivate.Checked)
                    {
                        member.IsPublic = true;
                    }
                    member.IsPublic = false;
                    int result = MemberBLL.UpdateMember(member);
                    if (result > 0)
                    {
                        lblUserUpdate.Text = "Change Profile Privacy successfully!";
                        panelUpdateSuccessfully.Visible = true;
                        panelProfilePrivacy.Visible = false;
                    }
                    else
                    {
                        lblErrors.Text = "Change Profile Privacy failure!";
                        panelProfilePrivacy.Visible = false;
                        panelUpdateFailure.Visible = true;
                    }
                }
            }
        }
    }

    protected void btnCancelChangeProfilePrivacy_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelViewAndEditMember.Visible = true;

    }

    protected void RadioButtonList2_PreRender(object sender, EventArgs e)
    {
        foreach (ListItem item in Doctor.Items)
        {
            item.Attributes.Add("OnClick", "javascript: showControl('" + item.Value + "');");
        }
    }
}
