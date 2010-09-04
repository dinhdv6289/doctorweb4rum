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
public partial class GUI_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Category[] categories = CategoryBLL.GetAllCategory();
            if (categories.Length > 0)
            {
                repeaterForums.DataSource = categories;
                repeaterForums.DataBind();
            }
        }
    }

    public SubForum[] GetAllSubForumsByCategoryID(int CategoryID)
    {
        return SubForumBLL.GetAllSubForumsByCategoryID(CategoryID);
    }

    public DataTable FillFunctionsForumToDropDownList()
    {
        DataTable table = new DataTable();
        table.Columns.Add("FunctionID");
        table.Columns.Add("FunctionName");
        DataRow row = table.NewRow();
        DataRow row2 = table.NewRow();
        DataRow row3 = table.NewRow();
        DataRow row4 = table.NewRow();
        row["FunctionID"] = 1;
        row["FunctionName"] = "EditForum";
        table.Rows.Add(row);
        row2["FunctionID"] = 2;
        row2["FunctionName"] = "DeleteForum";
        table.Rows.Add(row2);
        row3["FunctionID"] = 3;
        row3["FunctionName"] = "ViewForum";
        table.Rows.Add(row3);
        row4["FunctionID"] = 4;
        row4["FunctionName"] = "AddSubFoum";
        table.Rows.Add(row4);
        return table;
    }


    public DataTable FillFunctionsSubForumToDropDownList()
    {
        DataTable table = new DataTable();
        table.Columns.Add("FunctionID");
        table.Columns.Add("FunctionName");
        DataRow row = table.NewRow();
        DataRow row2 = table.NewRow();
        DataRow row3 = table.NewRow();
        row["FunctionID"] = 1;
        row["FunctionName"] = "EditSubForum";
        table.Rows.Add(row);
        row2["FunctionID"] = 2;
        row2["FunctionName"] = "DeleteSubForum";
        table.Rows.Add(row2);
        row3["FunctionID"] = 3;
        row3["FunctionName"] = "ViewSubForum";
        table.Rows.Add(row3);
        return table;
    }

    protected void repeaterForums_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DropDownList dropDownListSubForum = (DropDownList)e.Item.FindControl("ddlFunctionsSubForum");
        if (dropDownListSubForum != null)
        {
            dropDownListSubForum.DataSource = FillFunctionsSubForumToDropDownList();
            dropDownListSubForum.DataValueField = "FunctionID";
            dropDownListSubForum.DataTextField = "FunctionName";
            dropDownListSubForum.DataBind();
        }
    }

    protected void repeaterForums_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        Repeater r = ((Repeater)e.Item.FindControl("repeaterSubForums"));
        r.ItemCommand += new RepeaterCommandEventHandler(this.repeaterSubForums_ItemCommand);
    }

    protected void repeaterForums_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ForumContinue")
        {
            DropDownList ddlFunctionsForum = (DropDownList)e.Item.FindControl("ddlFunctionForum");
            if (ddlFunctionsForum != null)
            {
                int functionForumID = Convert.ToInt32(ddlFunctionsForum.SelectedItem.Value);
                if (functionForumID == 1)
                {
                    Response.Redirect("EditForum.aspx?functionForumID=" + functionForumID.ToString());
                }
                if (functionForumID == 2)
                {
                    Response.Redirect("DeleteForum.aspx?functionForumID=" + functionForumID.ToString());
                }
                if (functionForumID == 3)
                {
                    Response.Redirect("ViewForum.aspx?functionForumID=" + functionForumID.ToString()); ;
                }
                if (functionForumID == 4)
                {
                    Response.Redirect("AddSubFoum.aspx?functionForumID=" + functionForumID.ToString());
                }
            }
        }
    }


    protected void repeaterSubForums_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Continue")
        {
            DropDownList ddlFunctionSubForum = (DropDownList)e.Item.FindControl("ddlFunctionSubForum");
            if (ddlFunctionSubForum != null)
            {
                int functionID = Convert.ToInt32(ddlFunctionSubForum.SelectedItem.Value);
                if (functionID == 1)
                {
                    Response.Redirect("EditSubForum.aspx?functionID=" + functionID.ToString());
                }
                if (functionID == 2)
                {
                    Response.Redirect("DeleteSubForum.aspx?functionID=" + functionID.ToString());
                }
                if (functionID == 3)
                {
                    Response.Redirect("ViewSubForum.aspx?functionID=" + functionID.ToString());
                }
            }
        }
    }

}
