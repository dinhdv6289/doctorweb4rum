using System;
using System.Data;
using System.Configuration;
using DAL;
/// <summary>
/// Summary description for CategoryBLL
/// </summary>
namespace BLL
{
    public class CategoryBLL
    {
        public CategoryBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static Category[] GetAllCategory()
        {
            Category[] result = null;
            try
            {
                result = DataHelper.GetCategoryDA().GetAllCategory();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;

        }
        public static Category[] GetCategoryByID(int categoryID)
        {
            Category[] result = null;
            try
            {
                result = DataHelper.GetCategoryDA().GetCategoryByID(categoryID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public static DataSet GetStatistics()
        {
            DataSet ds = null;
            try
            {
                ds = DataHelper.GetCategoryDA().GetStatistics();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public static int InsertCategory(Category cat, out int resultStatus)
        {
            int result = 0;
            resultStatus = 0;
            try
            {
                result = DataHelper.GetCategoryDA().InsertCategory(cat, out resultStatus);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int DeleteCategory(String id)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetCategoryDA().DeleteCategory(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int UpdateCategory(Category cat)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetCategoryDA().UpdateCategory(cat);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}