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
            if (Session["UserLoged"] != null)
            {
                Member memberloged = (Member)Session["UserLoged"];
                MemberProfile memberProfile = MemberBLL.GetMemberProfileByMemberID(memberloged.MemberID);
                Role role = RoleBLL.GetRoleByRoleID(memberProfile.RoleID);
                if (role.RoleName.Equals("Admin"))
                {
                    Category[] categories = CategoryBLL.GetAllCategory();
                    if (categories.Length > 0)
                    {
                        repeaterForums.DataSource = categories;
                        repeaterForums.DataBind();
                        HiddenAllPanel();
                        repeaterForumsPanel.Visible = true;
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
        row3["FunctionName"] = "AddSubFoum";
        table.Rows.Add(row3);
        //row4["FunctionID"] = 4;
        //row4["FunctionName"] = "AddSubFoum";
        //table.Rows.Add(row4);
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
        //row3["FunctionID"] = 3;
        //row3["FunctionName"] = "ViewSubForum";
        //table.Rows.Add(row3);
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
                    HiddenAllPanel();
                    Category[] categories = CategoryBLL.GetCategoryByID(Convert.ToInt32(e.CommandArgument));
                    repeaterEditForum.DataSource = categories;
                    repeaterEditForum.DataBind();
                    editForumPanel.Visible = true;
                }
                if (functionForumID == 2)
                {
                    HiddenAllPanel();
                    Category[] categories = CategoryBLL.GetCategoryByID(Convert.ToInt32(e.CommandArgument));
                    lblMessageConfirm.Text = categories[0].CategoryName;
                    categoryIDForDelete.Value = e.CommandArgument.ToString();
                    panelConfirm.Visible = true;

                }
                if (functionForumID == 3)
                {
                    HiddenAllPanel();
                    Response.Redirect("AddNewSubForum.aspx?categoryID=" + e.CommandArgument.ToString());
                }
            }
        }
    }

    protected void HiddenAllPanel()
    {
        editForumPanel.Visible = false;
        repeaterForumsPanel.Visible = false;
        editSubForumPanel.Visible = false;
        panelMessage.Visible = false;
        panelConfirm.Visible = false;
        panelMessageDeleteForum.Visible = false;
        panelConfirmSubForum.Visible = false;
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
                    HiddenAllPanel();
                    SubForum subForum = SubForumBLL.GetSubForumBySubForumID(Convert.ToInt32(e.CommandArgument));
                    SubForum[] subForums = { subForum };
                    repeaterEditSubForum.DataSource = subForums;
                    repeaterEditSubForum.DataBind();
                    editSubForumPanel.Visible = true;
                    Page.SetFocus("ForumManager");
                }
                if (functionID == 2)
                {
                    HiddenAllPanel();
                    SubForum subForum = SubForumBLL.GetSubForumBySubForumID(Convert.ToInt32(e.CommandArgument));
                    lblMessageSubConfirm.Text = subForum.SubForumName;
                    subForumIDForDelete.Value = e.CommandArgument.ToString();
                    panelConfirmSubForum.Visible = true;


                    //Response.Redirect("DeleteSubForum.aspx?functionID=" + functionID.ToString());
                    // xoa subforum
                }
            }
        }
    }

    protected void repeaterEditForum_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "SaveEdit")
        {
            Category[] categories = CategoryBLL.GetCategoryByID(Convert.ToInt32(e.CommandArgument));
            Category cate = categories[0];
            TextBox txtForumName = (TextBox)repeaterEditForum.Items[e.Item.ItemIndex].FindControl("txtForumName");
            cate.CategoryName = txtForumName.Text;
            CategoryBLL.UpdateCategory(cate);
            Category[] categories1 = CategoryBLL.GetCategoryByID(Convert.ToInt32(e.CommandArgument));
            repeaterEditForum.DataSource = categories1;
            repeaterEditForum.DataBind();
        }
        if (e.CommandName == "ResetEdit")
        {
            Category[] categories = CategoryBLL.GetCategoryByID(Convert.ToInt32(e.CommandArgument));
            repeaterEditForum.DataSource = categories;
            repeaterEditForum.DataBind();
        }
        if (e.CommandName == "btnCancel")
        {
            editSubForumPanel.Visible = false;
            repeaterForumsPanel.Visible = true;
        }
    }

    protected void repeaterEditSubForum_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "SaveEdit")
        {
            SubForum subForum = SubForumBLL.GetSubForumBySubForumID(Convert.ToInt32(e.CommandArgument));
            TextBox txtSubForumName = (TextBox)repeaterEditSubForum.Items[e.Item.ItemIndex].FindControl("txtSubForumName");
            TextBox txtDescription = (TextBox)repeaterEditSubForum.Items[e.Item.ItemIndex].FindControl("txtDescription");
            subForum.SubForumName = txtSubForumName.Text;
            subForum.Description = txtDescription.Text;
            SubForumBLL.UpdateSubForum(subForum);
            SubForum subForum1 = SubForumBLL.GetSubForumBySubForumID(Convert.ToInt32(e.CommandArgument));
            SubForum[] subForums = { subForum1 };
            repeaterEditSubForum.DataSource = subForums;
            repeaterEditSubForum.DataBind();
        }
        if (e.CommandName == "ResetEdit")
        {
            SubForum subForum = SubForumBLL.GetSubForumBySubForumID(Convert.ToInt32(e.CommandArgument));
            SubForum[] subForums = { subForum };
            repeaterEditSubForum.DataSource = subForums;
            repeaterEditSubForum.DataBind();
        }
    }

    protected void btnAddNewForum_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewForum.aspx");
    }

    protected void btnSaveOder_Click(object sender, EventArgs e)
    {
        Category[] categories = CategoryBLL.GetAllCategory();
        for (int i = 0; i < categories.Length; i++)
        {
            TextBox txtPriorityCategory = (TextBox)repeaterForums.Items[i].FindControl("txtPriorityCategory");
            int priority = Convert.ToInt32(txtPriorityCategory.Text);
            Category c = categories[i];
            c.Priority = priority;
            CategoryBLL.UpdateCategory(c);
            Repeater rep = (Repeater)repeaterForums.Items[i].FindControl("repeaterSubForums");
            SubForum[] subForums = GetAllSubForumsByCategoryID(c.CategoryID);
            for (int j = 0; j < subForums.Length; j++)
            {
                TextBox txtPrioritySubForum = (TextBox)rep.Items[j].FindControl("txtPrioritySubForum");
                int prioritySubForum = Convert.ToInt32(txtPrioritySubForum.Text);
                SubForum s = subForums[j];
                s.Priority = prioritySubForum;
                SubForumBLL.UpdateSubForum(s);
            }
        }
        HiddenAllPanel();
        lableMessageStatus.Text = "Saved Display Order Successfully ";
        panelMessage.Visible = true;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Category[] categories1 = CategoryBLL.GetAllCategory();
        if (categories1.Length > 0)
        {
            repeaterForums.DataSource = categories1;
            repeaterForums.DataBind();
            HiddenAllPanel();
            repeaterForumsPanel.Visible = true;
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        SubForum[] result = SubForumBLL.SelectCategoryIDsInSubForumsByCategoryIDToDelete(Convert.ToInt32(categoryIDForDelete.Value));
        if (result.Length > 0)
        {
            Boolean flag = false;
            for (int i = 0; i < result.Length; i++)
            {
                int countTopic = TopicBLL.CountSubForumInTopicsBySubForumIDToDelete(result[i].SubForumID);
                if (countTopic > 0)
                {
                    flag = true;
                }
            }
            if (flag)
            {
                panelConfirm.Visible = false;
                panelMessageDeleteForum.Visible = true;
            }
            else
            {
                int status = CategoryBLL.DeleteCategory(categoryIDForDelete.Value);
                if (status > 0)
                {
                    HiddenAllPanel();
                    lableMessageStatus.Text = "Delete Category successfully!";
                    panelMessage.Visible = true;
                }
                else
                {
                    HiddenAllPanel();
                    lableMessageStatus.Text = "Delete Category failure!";
                    panelMessage.Visible = true;
                }

            }
        }
        else
        {
            int k = CategoryBLL.DeleteCategory(categoryIDForDelete.Value);
            if (k > 0)
            {
                HiddenAllPanel();
                lableMessageStatus.Text = "Delete Category successfully!";
                panelMessage.Visible = true;
            }
            else
            {
                HiddenAllPanel();
                lableMessageStatus.Text = "Delete Category failure!";
                panelMessage.Visible = true;
            }
        }
    }

    //
    protected void btnCanccel_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        repeaterForumsPanel.Visible = true;
    }
    protected void btnGoBack2_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        repeaterForumsPanel.Visible = true;
    }

    protected void btnYesSubForumDelete_Click(object sender, EventArgs e)
    {
        int countTopic = TopicBLL.CountSubForumInTopicsBySubForumIDToDelete(Convert.ToInt32(subForumIDForDelete.Value));
        if (countTopic > 0)
        {
            panelConfirmSubForum.Visible = false;
            panelMessageDeleteForum.Visible = true;
        }
        else
        {
            int result = SubForumBLL.DeleteSubForum(subForumIDForDelete.Value);
            if (result > 0)
            {
                HiddenAllPanel();
                lableMessageStatus.Text = "Delete SubForum successfully!";
                panelMessage.Visible = true;
            }
            else
            {
                HiddenAllPanel();
                lableMessageStatus.Text = "Delete SubForum failure!";
                panelMessage.Visible = true;
            }
        }
    }

    protected void btnCancelDeleteSubForum_Click(object sender, EventArgs e)
    {
        HiddenAllPanel();
        repeaterForumsPanel.Visible = true;
    }


}
