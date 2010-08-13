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
/// Summary description for Member
/// </summary>
public class Member
{
	public Member()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int memberID;
    private string userName;
    private string password;
    private string email;
    private string fullName;
    private DateTime dateCreation;
    private Boolean allowLogin;
    private Boolean isOnline;

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }

    public string UserName
    {
        get { return userName; }
        set { userName = value; }
    }

    public string Password
    {
        get { return password; }
        set { password = value; }
    }

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    public string FullName
    {
        get { return fullName; }
        set { fullName = value; }
    }

    public DateTime DateCreation
    {
        get { return dateCreation; }
        set { dateCreation = value; }
    }

    public Boolean AllowLogin
    {
        get { return allowLogin; }
        set { allowLogin = value; }
    }

    public Boolean IsOnline
    {
        get { return isOnline; }
        set { isOnline = value; }
    }
}
