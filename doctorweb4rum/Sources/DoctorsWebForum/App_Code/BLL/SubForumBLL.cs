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
        public static SubForum[] getlAllSubForumsByCategoryID(int CategoryID)
        {
            SubForum[] result = null;
            try
            {
                result = DataHelper.getSubForumDA().getlAllSubForumsByCategoryID(CategoryID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;

        }
    }
}