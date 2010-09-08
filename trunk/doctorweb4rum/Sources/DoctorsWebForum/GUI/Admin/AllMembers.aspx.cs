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
        row2["FunctionID"] = 2;
        row2["FunctionName"] = "Delete Member";
        table.Rows.Add(row2);
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
                    Response.Redirect("ViewEditMember.aspx?memberID="+e.CommandArgument.ToString());
                }
                if (functionID == 2)
                {

                }
            }
        }
    }
}
