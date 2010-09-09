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
        int CountTopicsInSubForumBySubForumID(int subForumID);
        int GetTotalViewsByTopicID(int topicID);
        int CountDaysOldOfTopicByTopicID(int topicID);
        int InsertTopic(Topic topic, out int resultStatus);
        DataSet TopicDetailsByTopicID(int topicID);
        Topic[] SearchTopic(String KeySearch, String CategoryID, String SubForumID, String UserName, String FromDateCreate, String ToDateCreate);
        int[] GetRatingPoint(int topicID);
        int InsertRateTopic(RatingTopic rateTopic);
        int ThankTopic(int memberID, int topicID);
        Boolean isThanked(int topicID, int memberID);
        int EditTopic(Topic topicEdit);
        int CountSubForumInTopicsBySubForumIDToDelete(int subForumID);

    }
}