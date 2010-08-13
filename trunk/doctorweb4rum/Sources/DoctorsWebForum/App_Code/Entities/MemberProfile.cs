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
/// Summary description for MemberProfile
/// </summary>
public class MemberProfile
{
	public MemberProfile()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int memberID;
    private int roleID;
    private string blast;
    private string avatar;
    private string country;
    private string address;
    private DateTime birthDay;
    private Boolean gender;
    private string yahoo;
    private string phone;
    private string hospital;
    private string blog;
    private int totalPosts;
    private int totalThanks;
    private int totalThanked;
    private float currentExperience;
    private int memberLevel;
    private string ipAddress;
    private DateTime lastLogin;
    private string myRss;
    private string signature;
    private string aboutMe;

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }

    public int RoleID
    {
        get { return roleID; }
        set { roleID = value; }
    }

    public string Blast
    {
        get { return blast; }
        set { blast = value; }
    }

    public string Avatar
    {
        get { return avatar; }
        set { avatar = value; }
    }

    public string Country
    {
        get { return country; }
        set { country = value; }
    }

    public string Address
    {
        get { return address; }
        set { address = value; }
    }

    public DateTime BirthDay
    {
        get { return birthDay; }
        set { birthDay = value; }
    }

    public Boolean Gender
    {
        get { return gender; }
        set { gender = value; }
    }

    public string Yahoo
    {
        get { return yahoo; }
        set { yahoo = value; }
    }

    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }

    public string Hospital
    {
        get { return hospital; }
        set { hospital = value; }
    }

    public string Blog
    {
        get { return blog; }
        set { blog = value; }
    }

    public int TotalPosts
    {
        get { return totalPosts; }
        set { totalPosts = value; }
    }

    public int TotalThanks
    {
        get { return totalThanks; }
        set { totalThanks = value; }
    }

    public int TotalThanked
    {
        get { return totalThanked; }
        set { totalThanked = value; }
    }

    public float CurrentExperience
    {
        get { return currentExperience; }
        set { currentExperience = value; }
    }

    public int MemberLevel
    {
        get { return memberLevel; }
        set { memberLevel = value; }
    }

    public string IPAddress
    {
        get { return ipAddress; }
        set { ipAddress = value; }
    }

    public DateTime LastLogin
    {
        get { return lastLogin; }
        set { lastLogin = value; }
    }

    public string MyRss
    {
        get { return myRss; }
        set { myRss = value; }
    }

    public string Signature
    {
        get { return signature; }
        set { signature = value; }
    }

    public string AboutMe
    {
        get { return aboutMe; }
        set { aboutMe = value; }
    }

}
