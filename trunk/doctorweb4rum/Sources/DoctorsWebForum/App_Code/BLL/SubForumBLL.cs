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
        public static SubForum[] GetAllSubForumsByCategoryID(int CategoryID)
        {
            SubForum[] result = null;
            try
            {
                result = DataHelper.GetSubForumDA().GetAllSubForumsByCategoryID(CategoryID);
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

        public static SubForum GetSubForumBySubForumID(int subForumID)
        {
            SubForum result = null;
            try
            {
                result = DataHelper.GetSubForumDA().GetSubForumBySubForumID(subForumID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        //public static int InsertSubForum(SubForum subforum, out int resultStatus)
        //{
        //    int result = 0;
        //    resultStatus = 0;
        //    try
        //    {
        //        result = DataHelper.GetSubForumDA().InsertSubForum(subforum, out resultStatus);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return result;
        //}

        public static int InsertSubForum(SubForum subForum)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetSubForumDA().InsertSubForum(subForum);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int UpdateSubForum(SubForum sub)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetSubForumDA().UpdateSubForum(sub);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int DeleteSubForum(String id)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetSubForumDA().DeleteSubForum(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static SubForum[] SelectCategoryIDsInSubForumsByCategoryIDToDelete(int categoryID)
        {
            SubForum[] result;
            try
            {
                result = DataHelper.GetSubForumDA().SelectCategoryIDsInSubForumsByCategoryIDToDelete(categoryID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}