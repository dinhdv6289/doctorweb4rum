using System;
using System.Data;
using System.Configuration;
using DAL;
/// <summary>
/// Summary description for TopicBLL
/// </summary>
namespace BLL
{

    public class TopicBLL
    {
        public TopicBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static Topic[] SearchTopic(String KeySearch, String CategoryID, String SubForumID, String UserName, String FromDateCreate, String ToDateCreate)
        {
            Topic[] result = null;
            try
            {
                result = DataHelper.GetTopicDA().SearchTopic(KeySearch, CategoryID, SubForumID, UserName, FromDateCreate, ToDateCreate);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Topic[] GetAllTopicBySubForumID(int subForumID)
        {
            Topic[] result = null;
            try
            {
                result = DataHelper.GetTopicDA().GetAllTopicBySubForumID(subForumID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Topic GetTopicByTopicID(int topicID)
        {
            Topic result = null;
            try
            {
                result = DataHelper.GetTopicDA().GetTopicByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Topic GetNewTopicBySubForumID(int subForumID)
        {
            Topic result = null;
            try
            {
                result = DataHelper.GetTopicDA().GetNewTopicBySubForumID(subForumID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int GetRatingPointByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().GetRatingPointByTopicID(topicID);
            }
            catch (Exception ex)
            {
            	throw ex;
            }
            return result;
        }

        public static int CountTopicsInSubForumBySubForumID(int subForumID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().CountTopicsInSubForumBySubForumID(subForumID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int GetTotalViewsByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().GetTotalViewsByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int CountDaysOldOfTopicByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().CountDaysOldOfTopicByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int InsertTopic(Topic topic, out int resultStatus)
        {
            int result = 0;
            resultStatus = 0;
            try
            {
                result = DataHelper.GetTopicDA().InsertTopic(topic, out resultStatus);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

         public static DataSet TopicDetailsByTopicID(int topicID)
         {
             DataSet dataSetTopicDetails = null;
             try
             {
                 dataSetTopicDetails = DataHelper.GetTopicDA().TopicDetailsByTopicID(topicID);
             }
             catch (Exception ex)
             {
                 throw ex;
             }
             return dataSetTopicDetails;
         }
    }
}