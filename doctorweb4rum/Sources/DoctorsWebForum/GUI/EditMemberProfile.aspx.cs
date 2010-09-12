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
                        //memberProfile.Avatar = txtAvatar.Text;
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
        panelViewAndEditMember.Visible = true;
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        panelUpdateSuccessfully.Visible = false;
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
                            String SaveDir = @"~\GUI\Images\MemberProfiles\Avatar\";
                            String oSaveDir = @"~\GUI\Images\";
                            String appPath = Request.PhysicalApplicationPath;
                            String savePath = appPath + SaveDir + Server.HtmlEncode(uploadAvatar.FileName);
                            String osavePath = appPath + oSaveDir + Server.HtmlEncode(uploadAvatar.FileName);
                            Bitmap OldBMP = new Bitmap(uploadAvatar.FileContent);
                            int newHeight = 120;
                            int newWidth = 100;
                            int oHeight = OldBMP.Height;
                            int oWidth = OldBMP.Width;
                            int ratio = oWidth / oHeight;

                            // Neu kich thuoc hinh nho hon kich thuoc can resize thi
                            //khong can resize nua ma luu vao luon
                            if (oHeight <= 120 && oWidth <= 100)
                            {
                                uploadAvatar.SaveAs(savePath);
                                uploadAvatar.SaveAs(osavePath);
                                //messages.Text = “Upload successed111″;
                                return;
                            }

                            Bitmap newBMP = new Bitmap(OldBMP, newWidth, newHeight);
                            Graphics gr = Graphics.FromImage(newBMP);

                            gr.SmoothingMode = SmoothingMode.AntiAlias;
                            gr.InterpolationMode = InterpolationMode.HighQualityBicubic;

                            newBMP.Save(savePath);
                            avatar = savePath;
                            OldBMP.Dispose();
                            gr.Dispose();
                            newBMP.Dispose();
                            //sucess
                        }
                        memberProfile.Avatar = avatar;
                        MemberBLL.UpdateMemberInfo(member, memberProfile);
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

        if (fu.PostedFile.ContentLength > 102400)
        {
            file_size = false;
            mess += "Your file is larger than 1MB";
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
    }
    protected void linkButtonEditProfile_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        panelViewAndEditMember.Visible = true;
    }
}
