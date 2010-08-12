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


        public SubForum[] getlAllSubForumsByCategoryID(int CategoryID)
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
    }
}