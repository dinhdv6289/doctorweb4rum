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
public partial class GUI_Admin_AllMembers : System.Web.UI.Page
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
                    HiddenAllPanel();
                    panelAllMembers.Visible = true;
                    Role[] roles = RoleBLL.GetAllRoles();
                    if (roles.Length > 0)
                    {

                        dropDownListRole.DataSource = roles;
                        dropDownListRole.DataValueField = "RoleID";
                        dropDownListRole.DataTextField = "RoleName";
                        dropDownListRole.DataBind();
                    }
                    Member[] members = MemberBLL.GetAllMember();
                    if (members.Length > 0)
                    {
                        repeaterMembers.DataSource = members;
                        repeaterMembers.DataBind();
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

    private void HiddenAllPanel()
    {
        panelAllMembers.Visible = false;
        panelUpdateFailure.Visible = false;
        panelUpdateSuccessfully.Visible = false;
        panelViewAndEditMember.Visible = false;
    }

    public DataTable FillFunctionsToDropDownList()
    {
        DataTable table = new DataTable();
        table.Columns.Add("FunctionID");
        table.Columns.Add("FunctionName");
        DataRow row = table.NewRow();
        DataRow row2 = table.NewRow();
        row["FunctionID"] = 1;
        row["FunctionName"] = "View / Edit Member";
        table.Rows.Add(row);
        //row2["FunctionID"] = 2;
        //row2["FunctionName"] = "Delete Member";
        //table.Rows.Add(row2);
        return table;
    }

    protected void repeaterMembers_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Continue")
        {
            DropDownList ddlFunctionMember = (DropDownList)e.Item.FindControl("ddlFunctionMember");
            if (ddlFunctionMember != null)
            {
                int functionID = Convert.ToInt32(ddlFunctionMember.SelectedItem.Value);
                if (functionID == 1)
                {
                    int memberID = Convert.ToInt32(e.CommandArgument.ToString());
                    DataSet dataInfo = MemberBLL.GetAllInfoOfMemberByMemberID(memberID);
                    if (dataInfo != null)
                    {
                        memberIDHiddend.Value = memberID.ToString();
                        DataTable dataInfoDetails = dataInfo.Tables[0];
                        int roleID = Convert.ToInt32(dataInfoDetails.Rows[0]["RoleID"].ToString());
                        Role role = RoleBLL.GetRoleByRoleID(roleID);
                        lblRoleGroup.Text = role.RoleName;
                        dropDownListRole.SelectedValue = roleID.ToString();
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
                        panelAllMembers.Visible = false;
                        panelViewAndEditMember.Visible = true;
                    }
                }
                //if (functionID == 2)
                //{

                //}
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
            int roleID = Convert.ToInt32(dropDownListRole.SelectedValue);
            MemberProfile memberProfile = new MemberProfile();
            memberProfile.RoleID = roleID;
            memberProfile.Blast = dataInfo.Tables[0].Rows[0]["Blast"].ToString();
            memberProfile.Avatar = dataInfo.Tables[0].Rows[0]["Avatar"].ToString();
            memberProfile.Address = txtAddress.Text;
            memberProfile.Signature = txtSignature.Text;
            memberProfile.AboutMe = txtAboutMe.Text;
            memberProfile.Professional = txtProfessional.Text;
            memberProfile.Experience = txtExperience.Text;
            memberProfile.Blog = txtBlog.Text;
            memberProfile.BirthDay = Convert.ToDateTime(dataInfo.Tables[0].Rows[0]["BirthDay"].ToString());
            memberProfile.Yahoo = txtYahoo.Text;
            memberProfile.Hospital = txtHospital.Text;
            memberProfile.Phone = txtPhone.Text;
            memberProfile.Country = txtCountry.Text;
            member.FullName = txtFullName.Text;
            member.Email = txtEmail.Text;
            int result = MemberBLL.UpdateMemberInfoByAdmin(member, memberProfile);
            if (result > 0)
            {
                panelAllMembers.Visible = false;
                panelUpdateSuccessfully.Visible = true;
                panelAllMembers.Visible = true;
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
        panelAllMembers.Visible = true;
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
        panelAllMembers.Visible = true;
    }
}
