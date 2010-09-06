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

        public DataSet GetStatistics()
        {
            DataSet ds = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "GetStatistics";
                ds = ExecuteDataset(cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }            
        }

        public int InsertCategory(Category cat, out int resultStatus)
        {
            int result = 0;
            resultStatus = 0;
            try
            {
                Object[] values = { cat.CategoryName, cat.Priority, cat.DateCreation };
                result = InsertIntoTableTypeStoreReturnID("CategoriesInsert", columnNames, values, out resultStatus);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int UpdateCategory(Category cat)
        {
            int result = 0;
            try
            {
                String[] columnNames = { CategoryID, CategoryName, Priority, DateCreation };
                Object[] values = { cat.CategoryID, cat.CategoryName, cat.Priority, cat.DateCreation };
                result = ProcessTableTypeStore("CategoriesUpdate", columnNames, values);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int DeleteCategory(String id)
        {
            int result = 0;
            try
            {
                String[] keyColumns = { CategoryDA.CategoryID };
                String[] keyValues = { id };                
                result = ProcessTableTypeStore("CategoriesDelete", keyColumns, keyValues);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}