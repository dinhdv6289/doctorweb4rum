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

        public static int UpdateMember(Member member)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().UpdateMember(member);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int MembersOnline()
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().MembersOnline();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public static int InsertMember(Member member, out int autoID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().InsertMember(member, out autoID);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result;
        }

        public static int InsertMemberProfile(MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().InsertMemberProfile(memberProfile);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

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

        public static MemberProfile GetMemberProfileByMemberID(int memberID)
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

        public static Member GetMemberByUserNamePassword(string userName, string password)
        {
            Member result = null;
            if (userName.Length >0 || userName != null)
            {
                try
                {
                    result = DataHelper.GetMemberDA().GetMemberByUserNamePassword(userName, password);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return result;
        }
        public static int InsertMemberInfo(Member member, MemberProfile memProfile, out int resultStatus)
        {
            int result = 0;
            resultStatus = 0;
            try
            {
                result = DataHelper.GetMemberDA().InsertMemberInfo(member, memProfile, out resultStatus);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Boolean UserNameIsExist(String userName)
        {
            Boolean result = false;
            try
            {
                int a = DataHelper.GetMemberDA().UserNameIsExist(userName);
                if (a>0)
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

        public static Boolean EmailIsExist(String email)
        {
            Boolean result = false;
            try
            {
                int a = DataHelper.GetMemberDA().EmailIsExist(email);
                if (a > 0)
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