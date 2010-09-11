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
        private const String DateCreate = "DateCreate";
        private const String MoveTo = "MoveTo";
        private const String tableNameRating = "RatingTopic";
        private const String RateTopicID = "RateTopicID";
        private const String FromMember = "FromMember";
        private const String RatePoint = "RatePoint";
        private const String RateDate = "RateDate";
        private const String DateEdited = "DateEdited";
        private String[] columnNamesRating = { RateTopicID, FromMember, TopicID, RatePoint, RateDate };
        private String[] columnNamesRatingForInsert = { FromMember, TopicID, RatePoint, RateDate };
        private String[] columnNames = { TopicID, SubForumID, MemberID, Title, Content, IsLocked, TotalViews, TotalMessages, DateCreate, MoveTo, DateEdited };
        private String[] columnNamesForInsert = { SubForumID, MemberID, Title, Content, IsLocked, TotalViews, TotalMessages, MoveTo };
        private String[] columnNamesForEditTopic ={ Title, Content, TopicID };

        public Topic[] SearchTopic(String KeySearch, String CategoryID, String SubForumID, String UserName, String FromDateCreate, String ToDateCreate)
        {
            Topic[] result;
            if (FromDateCreate.Length == 0 || FromDateCreate.Equals(""))
            {
                FromDateCreate = "null";
            }
            else
            {
                FromDateCreate = "'" + FromDateCreate + "'";
            }
            if (ToDateCreate.Length == 0 || ToDateCreate.Equals(""))
            {
                ToDateCreate = "null";
            }
            else
            {
                ToDateCreate = "'" + ToDateCreate + "'";
            }
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("SearchTopic '{0}', {1}, {2}, '{3}', {4}, {5}", KeySearch, CategoryID, SubForumID, UserName, FromDateCreate, ToDateCreate);
                result = SelectCollection<Topic>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

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
        public int CountTopicsInSubForumBySubForumID(int subForumID)
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("SELECT COUNT (*) FROM {0} WHERE {1} = {2}", tableName, SubForumID, subForumID);
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

        public int GetTotalViewsByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetTotalViewsByTopicID {0}", topicID);
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

        public int CountDaysOldOfTopicByTopicID(int topicID)
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("CountDaysOldOfTopicByTopicID {0}", topicID);
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

        public int InsertTopic(Topic topic, out int resultStatus)
        {
            int result = 0;
            resultStatus = 0;
            try
            {
                Object[] values = { topic.SubForumID, topic.MemberID, topic.Title, topic.Content, topic.IsLocked, topic.TotalViews, topic.TotalMessages, topic.MoveTo };
                result = InsertIntoTableTypeStoreReturnID("InsertTopic", columnNamesForInsert, values, out resultStatus);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public DataSet TopicDetailsByTopicID(int topicID)
        {
            DataSet dataSetTopicDetails = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("TopicDetailsByTopicID {0}", topicID);
                dataSetTopicDetails = ExecuteDataset(cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (dataSetTopicDetails.Tables[0].Rows.Count > 0)
            {
                return dataSetTopicDetails;
            }
            else
            {
                return null;
            }

        }

        public int[] GetRatingPoint(int topicID)
        {
            DataSet ds = null;
            int[] result = { 0, 0 };
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("select count(*) as TotalRate, avg(RatePoint) as RatingPoint from RatingTopic where {0} = {1} group by TopicID", TopicID, topicID);
                ds = ExecuteDataset(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result[0] = (int)ds.Tables[0].Rows[0]["TotalRate"];
                    result[1] = (int)ds.Tables[0].Rows[0]["RatingPoint"];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int InsertRateTopic(RatingTopic rateTopic)
        {
            int result = 0;
            try
            {
                object[] values = { rateTopic.FromMember, rateTopic.TopicID, rateTopic.RatePoint, rateTopic.RateDate };
                result = InsertTable(tableNameRating, columnNamesRatingForInsert, values);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int ThankTopic(int memberID, int topicID)
        {
            int result = 0;
            try
            {
                object[] values = { memberID, topicID, DateTime.Now };
                String[] columnNamesThanks = { "FromMember", "TopicID", "ThankDate" };
                result = InsertTable("ThankTopic", columnNamesThanks, values);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Boolean isThanked(int topicID, int memberID)
        {
            Boolean result = false;
            try
            {
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = string.Format("select count(*) as IsThanked from ThankTopic where FromMember = {0} and TopicID = {1}", memberID, topicID);
                ds = ExecuteDataset(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int a = (int)ds.Tables[0].Rows[0][0];
                    if (a > 0)
                    {
                        result = true;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int EditTopic(Topic topicEdit)
        {
            int result = 0;
            try
            {
                Object[] values = { topicEdit.Title, topicEdit.Content, topicEdit.TopicID };
                result = ProcessTableTypeStore("EditTopic", columnNamesForEditTopic, values);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int CountSubForumInTopicsBySubForumIDToDelete(int subForumID)
        {
            int result = 0;
            try
            {
                result = RecordExisted(tableName, SubForumID, subForumID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Topic[] WhatNew()
        {
            Topic[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("WhatNew");
                result = SelectCollection<Topic>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public DataSet GetAllThanksOfTopicByTopicID(int topicID)
        {
            DataSet dataTableAllThanks = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetAllThanksOfTopicByTopicID {0}", topicID);
                dataTableAllThanks = ExecuteDataset(cmd);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return dataTableAllThanks;
        }

        public Topic[] ViewAllTopicsByMemberID(int memberID)
        {
            Topic[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("ViewAllTopicsByMemberID {0}", memberID);
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