using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SubForumDA
/// </summary>
namespace DAL
{

    public class SubForumDA : BaseDAL, ISubForumDA
    {
        public SubForumDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private const String tableName = "SubForums";
        private const String SubForumID = "SubForumID";
        private const String CategoryID = "CategoryID";
        private const String SubForumName = "SubForumName";
        private const String Description = "Description";
        private const String DateCreation = "DateCreation";
        private const String Priority = "Priority";
        private const String TotalTopics = "TotalTopics";
        private const String TotalMessages = "TotalMessages";
        private String[] columnNames = { SubForumID, CategoryID, SubForumName, Description, Priority, TotalTopics, TotalMessages };


        public SubForum[] GetAllSubForumsByCategoryID(int CategoryID)
        {
            SubForum[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where CategoryID = {1}", tableName, CategoryID);
                result = SelectCollection<SubForum>(columnNames, columnNames, cmd);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public DateTime GetDateLastPostBySubForumID(int SubForumID)
        {
            DateTime result = DateTime.Now.AddDays(-5);
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select top(1) t.DateCreate from Topics t inner join SubForums s on t.SubForumID = s.SubForumID where t.SubForumID = {0} order by t.TopicID", SubForumID);
                DataSet ds = ExecuteDataset(cmd);
                if(ds.Tables[0].Rows.Count >0)
                {
                    result = (DateTime)ds.Tables[0].Rows[0]["DateCreate"];
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public SubForum GetSubForumBySubForumID(int subForumID)
        {
            SubForum[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableName, SubForumID, subForumID);
                result = SelectCollection<SubForum>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result[0];
        }
    }
}