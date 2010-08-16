using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for TopicDA
/// </summary>
namespace DAL
{

    public class TopicDA : BaseDAL, ITopicDA
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
        private const String tableNameRating = "RatingTopic";
        private const String RateTopicID = "RateTopicID";
        private const String FromMember = "FromMember";
        private const String RatePoint = "RatePoint";
        private const String RateDate = "RateDate";

        private String[] columnNamesRating = { RateTopicID, FromMember, TopicID, RatePoint, RateDate };
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

        public Topic GetTopicByTopicID(int topicID)
        {
            Topic[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableName, TopicID, topicID);
                result = SelectCollection<Topic>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result[0];
        }

        public Topic GetNewTopicBySubForumID(int subForumID)
        {
            Topic[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select top(1) * from {0} where {1} = {2} order by {3} desc", tableName, SubForumID, subForumID, TopicID);
                result = SelectCollection<Topic>(columnNames, columnNames, cmd);

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

        public RatingTopic[] GetAllRatingByTopicID(int topicID)
        {
            RatingTopic[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableNameRating, TopicID, topicID);
                result = SelectCollection<RatingTopic>(columnNamesRating, columnNamesRating, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int GetRatingPointByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("select avg({0}) as Rate, count(*) as Rated from {1} where {2} = {3} group by {4}", RatePoint, tableNameRating, TopicID, topicID);
                DataSet ds = ExecuteDataset(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result = (int)ds.Tables[0].Rows[0]["Rate"];
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int CountAmountTopicInSubForumBySubForumID(int subForumID)
        {
            int result = 0;
            try
            {
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = String.Format("SELECT COUNT (*) FROM {0} WHERE {1} = {2}", tableName, SubForumID, subForumID);
                DataSet ds = ExecuteDataset(command);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result = (int)ds.Tables[0].Rows[0][0];
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return result;
        }

    }
}