using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for TopicDA
/// </summary>
namespace DAL
{

    public class TopicDA:BaseDAL,ITopicDA
    {
        public TopicDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private const String tableName = "Topics";
        private const String TopicID = "TopicID";
        private const String SubForumID = "SubForumID";
        private const String MemberID = "MemberID";
        private const String Title = "Title";
        private const String Content = "Content";
        private const String IsLocked = "IsLocked";
        private const String TotalViews = "TotalViews";
        private const String TotalMessages = "TotalMessages";
        private const String DateLastPost = "DateLastPost";
        private const String MoveTo = "MoveTo";
        private String[] columnNames = { TopicID, SubForumID, MemberID, Title, Content, IsLocked, TotalViews, DateLastPost, MoveTo };

        public Topic[] GetAllTopicBySubForumID(int subForumID)
        {
            Topic[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where SubForumID = {1}", tableName, subForumID);
                result = SelectCollection<Topic>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}