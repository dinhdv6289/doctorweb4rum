using System;
using System.Data;
using System.Configuration;
using DAL;
/// <summary>
/// Summary description for MemberBLL
/// </summary>
namespace BLL
{

    public class MemberBLL
    {
        public MemberBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static Member[] GetAllMember()
        {
            Member[] result;
            try
            {
                result = DataHelper.GetMemberDA().GetAllMember();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        //public static Member GetMemberByUserNamePassword(string userName, string password)
        //{
        //    Member result = new Member();
        //    if (userName != "")
        //    {
        //        try
        //        {
        //            result = DataHelper.GetMemberDA().GetMemberByUserNamePassword(userName, password);
        //        }
        //        catch (Exception ex)
        //        {
        //            throw ex;
        //        }
        //    }
        //    return result;
        //}

        //public static Member InsertMember()
        //{
        //    Member result = new Member();
        //    if ()
        //    {
        //        try
        //        {
        //            result = DataHelper.GetMemberDA().InsertMember();
        //        }
        //        catch (Exception ex)
        //        {
        //            throw ex;
        //        }
        //    }
        //    return result;
        //}

        //public static Member InsertMemberProfile()
        //{
        //    Member result = new Member();
        //    if ()
        //    {
        //        try
        //        {
        //            result = DataHelper.GetMemberDA().InsertMemberProfile();
        //        }
        //        catch (Exception ex)
        //        {
        //            throw ex;
        //        }
        //    }
        //    return result;
        //}
        
        public static Member GetMemberByMemberID(int memberID)
        {
            Member result = new Member();
            if (memberID != 0)
            {
                try
                {
                    result = DataHelper.GetMemberDA().GetMemberByMemberID(memberID);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return result;
        }

        public static  MemberProfile GetMemberProfileByMemberID(int memberID)
        {
            MemberProfile result;
            try
            {
                result = DataHelper.GetMemberDA().GetMemberProfileByMemberID(memberID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Member GetMemberOfTopicByTopicID(int topicID)
        {
            Member result;
            try
            {
                result = DataHelper.GetMemberDA().GetMemberOfTopicByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Member GetLastMemberPostByTopicID(int topicID)
        {
            Member result;
            try
            {
                result = DataHelper.GetMemberDA().GetLastMemberPostByTopicID(topicID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}