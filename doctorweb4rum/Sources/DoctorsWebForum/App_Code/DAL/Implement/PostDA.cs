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
        private String[] columnNames = { PostID, TopicID, MemberID, Title, Content, DateCreation, DateEdited, Signature, IPAddress };

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
            if(result.Length >0)
            {
                return result[0];
            }
            return null;
        }
    }
}