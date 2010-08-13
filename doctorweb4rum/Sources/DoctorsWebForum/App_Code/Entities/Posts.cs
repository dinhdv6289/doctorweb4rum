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
/// Summary description for Posts
/// </summary>
public class Posts
{
	public Posts()
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
    private float experience;
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

    public float experience
    {
        get { return experience; }
        set { experience = value; }
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
