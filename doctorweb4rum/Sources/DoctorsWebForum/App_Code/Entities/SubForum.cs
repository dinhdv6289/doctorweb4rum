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
/// Summary description for SubForum
/// </summary>
public class SubForum
{
	public SubForum()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int subForumID;
    private int categoryID;
    private String subForumName;         
    private String description;
    private DateTime dateCreation;
    private int priority;
    private int totalTopics;
    private int totalMessages;


    public int TotalMessages
    {
        get { return totalMessages; }
        set { totalMessages = value; }
    }
	

    public int TotalTopics
    {
        get { return totalTopics; }
        set { totalTopics = value; }
    }
	

    public int Priority
    {
        get { return priority; }
        set { priority = value; }
    }
	

    public DateTime DateCreation
    {
        get { return dateCreation; }
        set { dateCreation = value; }
    }
	

    public String Description
    {
        get { return description; }
        set { description = value; }
    }
	

    public String SubForumName
    {
        get { return subForumName; }
        set { subForumName = value; }
    }
	
    public int CategoryID
    {
        get { return categoryID; }
        set { categoryID = value; }
    }

    public int SubForumID
    {
        get { return subForumID; }
        set { subForumID = value; }
    }
	
}
