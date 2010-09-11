using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TuyenPV;

public partial class GUI_ForumMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            List<KeyValuePair<string, Uri>> nodes = new List<KeyValuePair<string, Uri>>();
            nodes.Add(new KeyValuePair<string, Uri>("Message Forum ", Request.Url));
            ((SiteMapDataProvider)SiteMap.Provider).Stack(nodes);
            this.Page.Title = "Search Results";
        }
        this.Title = "Doctors WebForum";
    }

    public String ContentsMessage()
    {
        String contents = "";
        String typeMessage = Request.QueryString["typeMessage"];
        if (typeMessage != null || typeMessage.Length > 0)
        {
            contents = typeMessage +
                      "<ul>" +
                        "<li><a href=\"Index.aspx\">Go to forums index</a></li>" +
                      "</ul>";
        }
        return contents;
    }
}
