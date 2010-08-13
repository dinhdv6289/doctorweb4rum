using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for Topic
/// </summary>
public class Topic
{
	public Topic()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int topicID;
    private int subForumID;
    private int memberID;
    private Boolean isLocked;
    private int totalViews;
    private int totalMessages;
    private DateTime dateLastPost;
    private int moveTo;

    public int MoveTo
    {
        get { return moveTo; }
        set { moveTo = value; }
    }
	

    public DateTime DateLastPost
    {
        get { return dateLastPost; }
        set { dateLastPost = value; }
    }
	

    public int TotalMessages
    {
        get { return totalMessages; }
        set { totalMessages = value; }
    }
	

    public int TotalViews
    {
        get { return totalViews; }
        set { totalViews = value; }
    }
	

    public Boolean IsLocked
    {
        get { return isLocked; }
        set { isLocked = value; }
    }
	

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }
	

    public int SubForumID
    {
        get { return subForumID; }
        set { subForumID = value; }
    }
	
    public int TopicID
    {
        get { return topicID; }
        set { topicID = value; }
    }

}
