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
    }
}