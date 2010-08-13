using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Role
/// </summary>
public class Role
{
	public Role()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int roleID;
    private string roleName;
    private string description;
    private int totalPosts;
    private string rankImage;

    public int RoleID
    {
        get { return roleID; }
        set { roleID = value; }
    }

    public string RoleName
    {
        get { return roleName; }
        set { roleName = value; }
    }

    public string Description
    {
        get { return description; }
        set { description = value; }
    }

    public int TotalPosts
    {
        get { return totalPosts; }
        set { totalPosts = value; }
    }

    public string RankImage
    {
        get { return rankImage; }
        set { rankImage = value; }
    }
}
