using System;
using System.Data;
using System.Configuration;


/// <summary>
/// Summary description for Posts
/// </summary>
public class Post
{
	public Post()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int postID;
    private int topicID;
    private int memberID;
    private string title;
    private string content;
    private DateTime dateCreation;
    private DateTime dateEdited;
    private Boolean signature;
    private string ipAddress;


    public int PostID
    {
        get { return postID; }
        set { postID = value; }
    }

    public int TopicID
    {
        get { return topicID; }
        set { topicID = value; }
    }

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }

    public string Title
    {
        get { return title; }
        set { title = value; }
    }

    public string Content
    {
        get { return content; }
        set { content = value; }
    }


    public DateTime DateCreation
    {
        get { return dateCreation; }
        set { dateCreation = value; }
    }

    public DateTime DateEdited
    {
        get { return dateEdited; }
        set { dateEdited = value; }
    }

    public Boolean Signature
    {
        get { return signature; }
        set { signature = value; }
    }

    public string IPAddress
    {
        get { return ipAddress; }
        set { ipAddress = value; }
    }
}
