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
        if(!IsPostBack)
        {
            List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
            nodes.Add(new KeyValuePair<string, Uri>("Registration", Request.Url));
            ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
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
    }
}
