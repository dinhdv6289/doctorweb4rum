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
/// Summary description for RatingPost
/// </summary>
public class RatingPost
{
	public RatingPost()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int ratingPostID;
    private int fromMember;
    private int postID;
    private int ratePoint;
    private DateTime rateDate;

    public int RatingPostID
    {
        get { return ratingPostID; }
        set { ratingPostID = value; }
    }

    public int FromMember
    {
        get { return fromMember; }
        set { fromMember = value; }
    }

    public int PostID
    {
        get { return postID; }
        set { postID = value; }
    }

    public int RatePoint
    {
        get { return ratePoint; }
        set { ratePoint = value; }
    }

    public DateTime RateDate
    {
        get { return rateDate; }
        set { rateDate = value; }
    }

}
