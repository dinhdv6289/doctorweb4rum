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
    }
}