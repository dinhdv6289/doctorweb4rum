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
            if (userName.Length > 0 || userName != null)
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

        public static int UpdateMemberInfoByAdmin(Member member, MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().UpdateMemberInfoByAdmin(member, memberProfile);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int UpdateMemberInfo(Member member, MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().UpdateMemberInfo(member, memberProfile);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static DataSet GetAllInfoOfMemberByMemberID(int memberID)
        {
            DataSet dataSetAllMember = null;
            try
            {
                dataSetAllMember = DataHelper.GetMemberDA().GetAllInfoOfMemberByMemberID(memberID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataSetAllMember;
        }

        public static int BanOrUnBanUser(int memberID, Boolean allowLogin)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().BanOrUnBanUser(memberID, allowLogin);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Member GetMemberByUserName(String userName)
        {
            Member result = null;
            if (userName.Length > 0 || userName != null)
            {
                try
                {
                    result = DataHelper.GetMemberDA().GetMemberByUserName(userName);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return result;
        }

         public static Member[] GetBannedUsers()
         {
             Member[] result;
             try
             {
                 result = DataHelper.GetMemberDA().GetBannedUsers();
             }
             catch (Exception ex)
             {
                 throw ex;
             }
             return result;
         }

        public static Member GetBannedUser(int memberID)
        {
            Member result;
            try
            {
                result = DataHelper.GetMemberDA().GetBannedUser(memberID);
            }
            catch (System.Exception ex)
            {
            	throw ex;
            }
            return result;

        }

        public static DataTable SearchForUserByUserName(String userName)
        {
            DataTable inforMember = null;
            try
            {
                inforMember = DataHelper.GetMemberDA().SearchForUserByUserName(userName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return inforMember;
        }

        public static Member[] GetMembersIsOnline()
        {
            Member[] result;
            try
            {
                result = DataHelper.GetMemberDA().GetMembersIsOnline();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int UpdateTotalPostOfMemberByMemberID(MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().UpdateTotalPostOfMemberByMemberID(memberProfile);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int UpdateRoleByMemberID(int memberID, int roleID)
        {
            int result = 0;
            try
            {
                result = DataHelper.GetMemberDA().UpdateRoleByMemberID(memberID, roleID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}