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
    }
}