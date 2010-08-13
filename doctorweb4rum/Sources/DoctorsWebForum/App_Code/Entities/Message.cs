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
/// Summary description for Message
/// </summary>
public class Message
{
	public Message()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int messageID;
    private int fromMember;
    private int toMember;
    private string title;
    private string messageContent;
    private DateTime dateSend;
    private Boolean isView;
    private Boolean isRead;

    public int MessageID
    {
        get { return messageID; }
        set { messageID = value; }
    }

    public int FromMember
    {
        get { return fromMember; }
        set { fromMember = value; }
    }

    public int ToMember
    {
        get { return toMember; }
        set { toMember = value; }
    }

    public string Title
    {
        get { return title; }
        set { title = value; }
    }

    public string MessageContent
    {
        get { return messageContent; }
        set { messageContent = value; }
    }

    public DateTime DateSend
    {
        get { return dateSend; }
        set { dateSend = value; }
    }

    public Boolean IsView
    {
        get { return isView; }
        set { isView = value; }
    }

    public Boolean IsRead
    {
        get { return isRead; }
        set { isRead = value; }
    }



   
	
}
