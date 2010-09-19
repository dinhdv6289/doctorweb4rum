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
        public static Topic[] SearchTopic(String KeySearch, String CategoryID, String SubForumID,
            String UserName, String FromDateCreate, String ToDateCreate, String professional, String experience, String location)
        {
            Topic[] result = null;
            try
            {
                result = DataHelper.GetTopicDA().SearchTopic(KeySearch, CategoryID, SubForumID, UserName, FromDateCreate, ToDateCreate,professional,experience,location);
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

        public static int[] GetRatingPoint(int topicID)
        {
            int[] result = { 0, 0 };
            try
            {
                result = DataHelper.GetTopicDA().GetRatingPoint(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int InsertRatingTopic(RatingTopic rating)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().InsertRateTopic(rating);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int ThankTopic(int memberID, int topicID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().ThankTopic(memberID, topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

         public static Boolean isThanked(int topicID, int memberID)
         {
             Boolean result = false;
             try
             {
                 result = DataHelper.GetTopicDA().isThanked(topicID, memberID);
             }
             catch (Exception ex)
             {
                 throw ex;
             }
             return result;
         }

        public static int EditTopic(Topic topicEdit)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetTopicDA().EditTopic(topicEdit);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

         public static int CountSubForumInTopicsBySubForumIDToDelete(int subForumID)
         {
             int result = 0;
             try
             {
                 result = DataHelper.GetTopicDA().CountSubForumInTopicsBySubForumIDToDelete(subForumID);
             }
             catch (System.Exception ex)
             {
                 throw ex;
             }
             return result;

         }

        public static Topic[] WhatNew()
        {
            Topic[] result = null;
            try
            {
                result = DataHelper.GetTopicDA().WhatNew();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static DataSet GetAllThanksOfTopicByTopicID(int topicID)
        {
            DataSet dataTableAllThanks = null;
            try
            {
                dataTableAllThanks = DataHelper.GetTopicDA().GetAllThanksOfTopicByTopicID(topicID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return dataTableAllThanks;
        }

        public static Topic[] ViewAllTopicsByMemberID(int memberID)
        {
            Topic[] result = null;
            try
            {
                result = DataHelper.GetTopicDA().ViewAllTopicsByMemberID(memberID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static DataSet NewestFirstPost(int topicID)
        {
            DataSet dataSetTopicDetails = null;
            try
            {
                dataSetTopicDetails = DataHelper.GetTopicDA().NewestFirstPost(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataSetTopicDetails;
        }
    }
}