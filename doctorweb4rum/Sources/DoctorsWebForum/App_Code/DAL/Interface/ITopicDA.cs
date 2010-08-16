using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for ITopicDA
/// </summary>
namespace DAL
{

public interface ITopicDA
{
    Topic[] GetAllTopicBySubForumID(int subForumID);
    Topic GetTopicByTopicID(int topicID);
    RatingTopic[] GetAllRatingByTopicID(int topicID);
    int GetRatingPointByTopicID(int topicID);
    Topic GetNewTopicBySubForumID(int subForumID);
}
}