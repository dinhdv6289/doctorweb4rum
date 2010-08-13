using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CategoryDA
/// </summary>
namespace DAL
{
    public class CategoryDA:BaseDAL,ICategoryDA
    {
        public CategoryDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private const String tableName = "Categories";
        private const String CategoryID = "CategoryID";
        private const String CategoryName = "CategoryName";
        private const String Priority = "Priority";
        private const String DateCreation = "DateCreation";
        private String[] columnNames = { CategoryID, CategoryName, Priority, DateCreation };


        public Category[] GetAllCategory()
        {
            Category[] result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0}", tableName);
                result = SelectCollection<Category>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}