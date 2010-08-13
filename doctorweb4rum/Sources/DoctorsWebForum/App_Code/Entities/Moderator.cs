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
/// Summary description for Moderator
/// </summary>
public class Moderator
{
	public Moderator()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int subForumID;
    private int memberID;

    public int SubForumID
    {
        get { return subForumID; }
        set { subForumID = value; }
    }

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }
}
