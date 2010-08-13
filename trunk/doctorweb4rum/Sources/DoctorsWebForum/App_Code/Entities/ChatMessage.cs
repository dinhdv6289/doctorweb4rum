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
/// Summary description for ChatMessage
/// </summary>
public class ChatMessage
{
	public ChatMessage()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int chatID;
    private int memberID;
    private string chatContent;
    private DateTime chatDate;

    public int ChatID
    {
        get { return chatID; }
        set { chatID = value; }
    }

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }

    public string ChatContent
    {
        get { return chatContent; }
        set { chatContent = value; }
    }

    public DateTime ChatDate
    {
        get { return chatDate; }
        set { chatDate = value; }
    }
}
