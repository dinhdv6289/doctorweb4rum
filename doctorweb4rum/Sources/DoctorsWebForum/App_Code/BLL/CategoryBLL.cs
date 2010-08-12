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

        public static Category[] getAllCategory()
        {
            Category[] result = null;
            try
            {
                result = DataHelper.getCategoryDA().getAllCategory();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;

        }
    }
}