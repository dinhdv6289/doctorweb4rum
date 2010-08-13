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
/// Summary description for RatingTopic
/// </summary>
public class RatingTopic
{
	public RatingTopic()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int rateTopicID;
    private int fromMember;
    private int topicID;
    private int ratePoint;
    private DateTime rateDate;

    public int RateTopicID
    {
        get { return rateTopicID; }
        set { rateTopicID = value; }
    }

    public int FromMember
    {
        get { return fromMember; }
        set { fromMember = value; }
    }

    public int TopicID
    {
        get { return topicID; }
        set { topicID = value; }
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
