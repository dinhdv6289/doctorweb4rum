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
public partial class GUI_Admin_SearchForUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserLoged"] != null)
            {
                Member memberloged = (Member)Session["UserLoged"];
                MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(memberloged.MemberID);
                Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                if (role.RoleName.Equals("Admin"))
                {
                    Role[] roles = RoleBLL.GetAllRoles();
                    if (roles.Length > 0)
                    {
                        HiddenAllPanels();
                        panelQuickSearch.Visible = true;
                        dropDownListRole.DataSource = roles;
                        dropDownListRole.DataValueField = "RoleID";
                        dropDownListRole.DataTextField = "RoleName";
                        dropDownListRole.DataBind();
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


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable tableInfo = MemberBLL.SearchForUserByUserName(txtUserNameSearch.Text);
        if (tableInfo != null)
        {
            panelQuickSearch.Visible = false;
            int roleID = Convert.ToInt32(tableInfo.Rows[0]["RoleID"].ToString());
            Role role = RoleBLL.GetRoleByRoleID(roleID);
            lblRoleGroup.Text = role.RoleName;
            txtUserName.Text = tableInfo.Rows[0]["UserName"].ToString();
            txtBirthday.Text = tableInfo.Rows[0]["BirthDay"].ToString();
            txtEmail.Text = tableInfo.Rows[0]["Email"].ToString();
            txtFullName.Text = tableInfo.Rows[0]["FullName"].ToString();
            lblGender.Text = tableInfo.Rows[0]["Gender"].ToString();
            txtDateCreation.Text = tableInfo.Rows[0]["DateCreation"].ToString();
            txtProfessional.Text = tableInfo.Rows[0]["Professional"].ToString();
            txtExperience.Text = tableInfo.Rows[0]["Experience"].ToString();
            txtCountry.Text = tableInfo.Rows[0]["Country"].ToString();
            txtAddress.Text = tableInfo.Rows[0]["Address"].ToString();
            txtYahoo.Text = tableInfo.Rows[0]["Yahoo"].ToString();
            txtPhone.Text = tableInfo.Rows[0]["Phone"].ToString();
            txtHospital.Text = tableInfo.Rows[0]["Hospital"].ToString();
            txtBlog.Text = tableInfo.Rows[0]["Blog"].ToString();
            txtSignature.Text = tableInfo.Rows[0]["Signature"].ToString();
            txtAboutMe.Text = tableInfo.Rows[0]["AboutMe"].ToString();
            panelSearchResult.Visible = true;
        }
        else
        {
            lblUserNameNotFound.Text = "<strong>" + txtUserNameSearch.Text + "</strong>";
            panelQuickSearch.Visible = false;
            panelMessage.Visible = true;
        }

    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        txtUserNameSearch.Text = "";
        panelMessage.Visible = false;
        panelQuickSearch.Visible = true;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTable tableInfo = MemberBLL.SearchForUserByUserName(txtUserName.Text);
        if (tableInfo != null)
        {
            Member member = new Member();
            member.MemberID = Convert.ToInt32(tableInfo.Rows[0]["MemberID"].ToString());
            int roleID = Convert.ToInt32(dropDownListRole.SelectedValue);
            MemberProfile memberProfile = new MemberProfile();
            memberProfile.RoleID = roleID;
            memberProfile.Blast = tableInfo.Rows[0]["Blast"].ToString();
            memberProfile.Avatar = tableInfo.Rows[0]["Avatar"].ToString();
            memberProfile.Address = txtAddress.Text;
            memberProfile.Signature = txtSignature.Text;
            memberProfile.AboutMe = txtAboutMe.Text;
            memberProfile.Professional = txtProfessional.Text;
            memberProfile.Experience = txtExperience.Text;
            memberProfile.Blog = txtBlog.Text;
            memberProfile.BirthDay = Convert.ToDateTime(tableInfo.Rows[0]["BirthDay"].ToString());
            memberProfile.Yahoo = txtYahoo.Text;
            memberProfile.Hospital = txtHospital.Text;
            memberProfile.Phone = txtPhone.Text;
            memberProfile.Country = txtCountry.Text;
            member.FullName = txtFullName.Text;
            member.Email = txtEmail.Text;
            int result = MemberBLL.UpdateMemberInfoByAdmin(member, memberProfile);
            if(result >0)
            {
                panelSearchResult.Visible = false;
                Response.Redirect("AllMembers.aspx");
            }else
            {
                panelUpdateFailure.Visible = true;
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtUserNameSearch.Text = "";
        panelSearchResult.Visible = false;
        panelQuickSearch.Visible = true;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        panelUpdateFailure.Visible = false;
        panelSearchResult.Visible = true;
    }

    private void HiddenAllPanels()
    {
        panelUpdateFailure.Visible = false;
        panelSearchResult.Visible = false;
        panelQuickSearch.Visible = false;
        panelMessage.Visible = false;
    }
}
