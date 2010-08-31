using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for PostDA
/// </summary>
namespace DAL
{

    public class PostDA : BaseDAL, IPostDA
    {
        public PostDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private const String tableName = "Posts";
        private const String PostID = "PostID";
        private const String TopicID = "TopicID";
        private const String MemberID = "MemberID";
        private const String Title = "Title";
        private const String Content = "Content";
        private const String DateCreation = "DateCreation";
        private const String DateEdited = "DateEdited";
        private const String Signature = "Signature";
        private const String IPAddress = "IPAddress";
        private const String Quote = "Quote";
        private String[] columnNames = { PostID, TopicID, MemberID, Content, DateCreation, DateEdited, Signature, IPAddress, Quote };
        private String[] columnNamesForInsert = { TopicID, MemberID, Content, DateEdited, Signature, IPAddress, Quote };

        public Post[] GetAllPostByTopicID(int topicID)
        {
            Post[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableName, TopicID, topicID);
                result = SelectCollection<Post>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Post GetNewPostBySubForumID(int subForumID)
        {
            Post[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetNewPostBySubForumID {0}", subForumID);
                result = SelectCollection<Post>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            return null;
        }

        public int GetCountPostBySubForumID(int subForumID)
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("SELECT  count(Posts.PostID) FROM Posts INNER JOIN  Topics ON Posts.TopicID = Topics.TopicID INNER JOIN  SubForums ON Topics.SubForumID = SubForums.SubForumID WHERE SubForums.SubForumID = {0}", subForumID);
                DataSet ds = ExecuteDataset(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result = (int)ds.Tables[0].Rows[0][0];
                }

            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int GetCountPostsByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetCountPostsByTopicID {0}", topicID);
                DataSet ds = ExecuteDataset(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result = (int)ds.Tables[0].Rows[0][0];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public Post GetLastPostOfTopicByTopicID(int topicID)
        {
            Post[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetLastPostOfTopicByTopicID {0}", topicID);
                result = SelectCollection<Post>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }

        public int InsertPost(Post post)
        {
            int result = 0;
            try
            {
                Object[] values ={ post.TopicID, post.MemberID, post.Content, post.DateEdited, post.Signature, post.IPAddress, post.Quote };
                result = ProcessTableTypeStore("InsertPost", columnNamesForInsert, values);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Post GetPostByPostID(int postID)
        {
            Post[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetPostByPostID {0}", postID);
                result = SelectCollection<Post>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }
    }
}