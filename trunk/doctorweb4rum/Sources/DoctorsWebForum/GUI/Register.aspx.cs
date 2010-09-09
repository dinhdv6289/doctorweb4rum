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
        String address = txtAddress.Text;
        String country = txtCountry.Text;
        String birthDay = txtBirthDay.Text;
        int gender = DropDownList1.SelectedIndex;
        String yahoo = txtYahoo.Text;
        String phone = txtPhone.Text;
        String hospital = txtHospital.Text;
        String aboutMe = txtAboutMe.Text;
        Boolean isPublic = cbPublicProfile.Checked;
        Boolean haveRead = cbHaveread.Checked;
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
            memProfile.Country = country;
            memProfile.BirthDay = Convert.ToDateTime(birthDay);
            memProfile.Gender = true;
            if (gender == 1)
            {
                memProfile.Gender = false;
            }
            memProfile.Yahoo = yahoo;
            memProfile.Phone = phone;
            memProfile.Hospital = hospital;
            memProfile.AboutMe = aboutMe;
            memProfile.LastLogin = DateTime.Now;
            memProfile.Avatar = null;
            memProfile.Blast = null;
            memProfile.Blog = null;
            memProfile.RoleID = 1;
            memProfile.Signature = null;
            memProfile.TotalPosts = 0;
            memProfile.TotalThanked = 0;
            memProfile.TotalThanks = 0;
            memProfile.Experience = "";
            memProfile.Professional = "";
            if (Page.IsValid)
            {
                int resultStatus = 0;
                int result = 0;
                result = MemberBLL.InsertMemberInfo(mem, memProfile, out resultStatus);
                if (resultStatus == 1)
                {
                    //OK
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
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !(MemberBLL.EmailIsExist(txtEmail.Text));
    }
}
