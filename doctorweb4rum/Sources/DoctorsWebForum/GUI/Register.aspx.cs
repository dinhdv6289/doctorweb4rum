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
using System.Collections.Generic;
using TuyenPV;
using BLL;

public partial class GUI_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
            nodes.Add(new KeyValuePair<string, Uri>("Register", Request.Url));
            ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
            this.Page.Title = "Register at Doctors WebForum";
        }

    }
    protected void btnResetRegister_Click(object sender, EventArgs e)
    {
        resetText();
    }

    private void resetText()
    {
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtConfirmPassword.Text = "";
        txtEmail.Text = "";
        txtConfirmEmail.Text = "";
    }
    protected void btnCompleteRegister_Click(object sender, EventArgs e)
    {
        
        String userName = txtUserName.Text;
        String password = txtConfirmPassword.Text;
        String email = txtConfirmEmail.Text;
        String fullName = txtFullName.Text;
        String address = drLocation.SelectedValue;
        String birthDay = txtBirthDay.Text;
        int gender = DropDownList1.SelectedIndex;
        String yahoo = txtYahoo.Text;
        String phone = txtPhone.Text;
        String hospital = txtHospital.Text;
        String aboutMe = txtAboutMe.Text;
        Boolean isPublic = cbPublicProfile.Checked;
        Boolean haveRead = cbHaveread.Checked;
        String professional = drProfessional.SelectedValue;
        String experience = drExperience.SelectedValue;
        if (haveRead)
        {
            Member mem = new Member();
            mem.UserName = userName;
            mem.Password = password;
            mem.Email = email;
            mem.FullName = fullName;
            mem.DateCreation = DateTime.Now;
            mem.IsOnline = false;
            mem.IsPublic = isPublic;
            mem.AllowLogin = true;
            MemberProfile memProfile = new MemberProfile();
            memProfile.Address = address;
            memProfile.Country = address;
            if(birthDay.Length>0)
            {
                memProfile.BirthDay = Convert.ToDateTime(birthDay);
            }
            memProfile.Gender = true;
            if (gender == 1)
            {
                memProfile.Gender = false;
            }
            memProfile.Yahoo = yahoo;
            memProfile.Phone = phone;
            memProfile.AboutMe = aboutMe;
            memProfile.LastLogin = DateTime.Now;
            memProfile.Avatar = "Images/MemberProfiles/Avatar/noavatar.jpg";
            memProfile.Blast = null;
            memProfile.Blog = null;
            memProfile.RoleID = 1;
            memProfile.Signature = null;
            memProfile.TotalPosts = 0;
            memProfile.TotalThanked = 0;
            memProfile.TotalThanks = 0;
            if (Doctor.Items[0].Selected)
            {
                mem.IsDoctor = true;
                memProfile.Hospital = hospital;
                memProfile.Experience = experience;
                memProfile.Professional = professional;
            }
            else
            {
                mem.IsDoctor = false;
                memProfile.Hospital = "N/A";
                memProfile.Experience = "N/A";
                memProfile.Professional = "N/A";
            }
            if (Page.IsValid)
            {
                int resultStatus = 0;
                int result = 0;
                result = MemberBLL.InsertMemberInfo(mem, memProfile, out resultStatus);
                if (resultStatus == 1)
                {
                    String contents = "Thank you for registering," + userName + ". Now you  have permission to post.";
                    Response.Redirect("ForumMessage.aspx?typeMessage=" + contents);
                }
                else if (resultStatus == -1)
                {
                    //UserName is exist
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('UserName is Exist !');window.location.href='Register.aspx';</script>");
                }
                else if (resultStatus == -2)
                {
                    //Email is exist
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('Email is Exist !');window.location.href='Register.aspx';</script>");
                }
                else
                {
                    //Error
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('Error !');window.location.href='Register.aspx';</script>");
                }
            }
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !(MemberBLL.UserNameIsExist(txtUserName.Text));
        CustomValidator1.ErrorMessage ="UserName " + txtUserName.Text + " is used !";
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !(MemberBLL.EmailIsExist(txtEmail.Text));
        CustomValidator2.ErrorMessage ="Email " + txtEmail.Text + " is used !";
    }

    //protected void cbIsDoctor_CheckedChanged(object sender, EventArgs e)
    //{
    //    panelIsDoctorToShow.Visible = cbIsDoctor.Checked;
    //}

    //protected void rbList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (rbList.SelectedIndex == 1)
    //        panelIsDoctorToShow.Visible = true;
    //    else
    //        panelIsDoctorToShow.Visible = false;
    //}

    //protected void btnIsDoctor_Click(object sender, EventArgs e)
    //{
    //    statusIsDoctor = true;
    //    panelSubmitIsDoctor.Visible = false;
    //    panelIsDoctorToShow.Visible = true;
    //    panelSubmitNotIsDoctor.Visible = true;
    //}

    //protected void btnNotIsDoctor_Click(object sender, EventArgs e)
    //{
    //    statusIsDoctor = false;
    //    panelSubmitNotIsDoctor.Visible = false;
    //    panelIsDoctorToShow.Visible = false;
    //    panelSubmitIsDoctor.Visible = true;
    //}

    protected void RadioButtonList2_PreRender(object sender, EventArgs e)
    {
        foreach (ListItem item in Doctor.Items)
        {
            item.Attributes.Add("OnClick", "javascript: showControl('" + item.Value + "');");
        }
    }
}
