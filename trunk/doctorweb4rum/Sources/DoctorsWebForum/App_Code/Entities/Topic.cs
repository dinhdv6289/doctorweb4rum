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
    private DateTime dateCreate;
    private int moveTo;
    private String title;
    private String content;
    private DateTime dateEdited;

    public DateTime DateEdited
    {
        get { return dateEdited; }
        set { dateEdited = value; }
    }

    public String Content
    {
        get { return content; }
        set { content = value; }
    }
	

    public String Title
    {
        get { return title; }
        set { title = value; }
    }

    public int MoveTo
    {
        get { return moveTo; }
        set { moveTo = value; }
    }


    public DateTime DateCreate
    {
        get { return dateCreate; }
        set { dateCreate = value; }
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
