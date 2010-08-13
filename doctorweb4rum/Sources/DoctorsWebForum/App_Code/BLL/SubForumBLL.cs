using System;
using System.Data;
using System.Configuration;
using DAL;
/// <summary>
/// Summary description for SubForumBLL
/// </summary>
namespace BLL
{
    public class SubForumBLL
    {
        public SubForumBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static SubForum[] GetlAllSubForumsByCategoryID(int CategoryID)
        {
            SubForum[] result = null;
            try
            {
                result = DataHelper.GetSubForumDA().GetlAllSubForumsByCategoryID(CategoryID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;

        }

        public static Boolean GetImageStatus(int SubForumID)
        {
            Boolean result = false;
            try
            {
                DateTime nowDate = DateTime.Now;
                DateTime temp = DataHelper.GetSubForumDA().GetDateLastPostBySubForumID(SubForumID);
                if (temp.Date == nowDate.Date)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}