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
            Post[] result = null;
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

        public static Post GetNewPostBySubForumID(int subForumID)
        {
            Post result = null;
            try
            {
                result = DataHelper.GetPostDA().GetNewPostBySubForumID(subForumID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int GetCountPostBySubForumID(int subForumID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetPostDA().GetCountPostBySubForumID(subForumID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int GetCountPostsByTopicID(int topicID)
         {
             int result = 0;
             try
             {
                 result = DataHelper.GetPostDA().GetCountPostsByTopicID(topicID);
             }
             catch (Exception ex)
             {
                 throw ex;
             }
             return result;
         }

        public static Post GetLastPostOfTopicByTopicID(int topicID)
        {
            Post result = null;
            try
            {
                result = DataHelper.GetPostDA().GetLastPostOfTopicByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static  int InsertPost(Post post)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetPostDA().InsertPost(post);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Post GetPostByPostID(int postID)
        {
            Post result = null;
            try
            {
                result = DataHelper.GetPostDA().GetPostByPostID(postID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int[] GetRatingPoint(int postID)
        {
            int[] result = { 0, 0 };
            try
            {
                result = DataHelper.GetPostDA().GetRatingPoint(postID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int InsertRatePost(RatingPost ratePost)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetPostDA().InsertRatePost(ratePost);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int ThankPost(int memberID, int postID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetPostDA().ThankPost(memberID, postID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Boolean isThanked(int postID, int memberID)
        {
            Boolean result = false;
            try
            {
                result = DataHelper.GetPostDA().isThanked(postID, memberID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}