using System;
using System.Data;
using System.Configuration;
using DAL;
/// <summary>
/// Summary description for PostBLL
/// </summary>
namespace BLL
{

    public class PostBLL
    {
        public PostBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static Post[] GetAllPostByTopicID(int topicID)
        {
            Post[] result =null;
            try
            {
                result = DataHelper.GetPostDA().GetAllPostByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;	
            }
            return result;
        }
    }
}