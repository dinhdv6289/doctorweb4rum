using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MemberDA
/// </summary>
namespace DAL
{

    public class MemberDA : BaseDAL, IMemberDA
    {
        public MemberDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private const String tableName = "Members";
        private const String tableNameMemberProfiles = "MemberProfiles";
        private const String MemberID = "MemberID";
        private const String UserName = "UserName";
        private const String Password = "Password";
        private const String Email = "Email";
        private const String FullName = "FullName";
        private const String DateCreation = "DateCreation";
        private const String AllowLogin = "AllowLogin";
        private const String IsPublic = "IsPublic";
        private const String IsOnline = "IsOnline";
        private const String RoleID = "RoleID";
        private const String Blast = "Blast";
        private const String Avatar = "Avatar";
        private const String Country = "Country";
        private const String Address = "Address";
        private const String BirthDay = "BirthDay";
        private const String Gender = "Gender";
        private const String Yahoo = "Yahoo";
        private const String Phone = "Phone";
        private const String Hospital = "Hospital";
        private const String Blog = "Blog";
        private const String TotalPosts = "TotalPosts";
        private const String TotalThanks = "TotalThanks";
        private const String TotalThanked = "TotalThanked";
        private const String CurrentExperience = "CurrentExperience";
        private const String MemberLevel = "MemberLevel";
        private const String LastLogin = "LastLogin";
        private const String MyRss = "MyRss";
        private const String Signature = "Signature";
        private const String AboutMe = "AboutMe";


        private String[] columnNames = { MemberID, UserName, Password, Email, FullName, DateCreation, AllowLogin, IsPublic, IsOnline };
        private String[] columnNamesInsert1 = { UserName, Password, Email, FullName, DateCreation, AllowLogin, IsPublic, IsOnline };
        private String[] memberProfileColumnNames ={ MemberID, RoleID, Blast, Avatar, Country, Address, BirthDay, Gender, Yahoo, 
                                                    Phone, Hospital, Blog, TotalPosts, TotalThanks, TotalThanked, CurrentExperience,
                                                    MemberLevel, LastLogin, MyRss, Signature, AboutMe};
        public Member[] GetAllMember()
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0}", tableName);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int UpdateMember(Member member)
        {
            int result = 0;
            try
            {
                string[] a = { "MemberID" };
                object[] b = { member.MemberID};
                object[] values = { member.UserName, member.Password, member.Email, member.FullName, member.DateCreation, member.AllowLogin, member.IsPublic, member.IsOnline };
                result = UpdateTable(tableName, columnNamesInsert1, values, a, b);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int MembersOnline()
        {
            int result = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select count(*) as MembersOnline from Members where IsOnline = 'true'";
                DataSet ds = ExecuteDataset(cmd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    result = (int)ds.Tables[0].Rows[0]["MembersOnline"];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int InsertMember(Member member, out int autoID)
        {
            int result = 0;
            try
            {
                Object[] values = { member.UserName, member.Password, member.Email, member.FullName, member.DateCreation, member.AllowLogin,member.IsPublic, member.IsOnline };
                result = InsertTableWithReturnID(tableName, columnNamesInsert1, values, out autoID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }


        public int InsertMemberProfile(MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                Object[] values ={memberProfile.MemberID,memberProfile.RoleID,memberProfile.Blast,memberProfile.Avatar,memberProfile.Country,
                memberProfile.Address,memberProfile.BirthDay,memberProfile.Gender,memberProfile.Yahoo,memberProfile.Phone,memberProfile.Hospital,
                memberProfile.Blog,memberProfile.TotalPosts,memberProfile.TotalThanks,memberProfile.TotalThanked,memberProfile.CurrentExperience,
                memberProfile.MemberLevel,memberProfile.LastLogin,memberProfile.MyRss,memberProfile.Signature,memberProfile.AboutMe};
                result = InsertTable(tableNameMemberProfiles, memberProfileColumnNames, values);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Member GetMemberByMemberID(int memberID)
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableName, MemberID, memberID);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result[0];
        }

        public MemberProfile GetMemberProfileByMemberID(int memberID)
        {
            MemberProfile[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableNameMemberProfiles, MemberID, memberID);
                result = SelectCollection<MemberProfile>(memberProfileColumnNames, memberProfileColumnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result[0];
        }

        public Member GetMemberOfTopicByTopicID(int topicID)
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetMemberOfTopicByTopicID {0}", topicID);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }

        }

        public Member GetLastMemberPostByTopicID(int topicID)
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetLastMemberPostByTopicID {0}", topicID);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }

        public Member GetMemberByUserNamePassword(string userName, string password)
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetMemberByUserNamePassword '{0}' , '{1}'", userName, password);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }

        public int InsertMemberInfo(Member member, MemberProfile memProfile, out int resultStatus)
        {
            resultStatus = 0;
            int result = 0;
            String[] columnNamesInfo = {UserName, Password, Email, FullName, Country, Address, BirthDay, Gender, Yahoo, 
                                                    Phone, Hospital, AboutMe, IsPublic};
            Object[] values = {member.UserName, member.Password, member.Email, member.FullName, memProfile.Country, memProfile.Address, 
                memProfile.BirthDay, memProfile.Gender, memProfile.Yahoo,  memProfile.Phone, memProfile.Hospital, memProfile.AboutMe, member.IsPublic};
            try
            {
              result =  InsertIntoTableTypeStoreReturnID("InsertMemberInfo", columnNamesInfo, values, out resultStatus);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public int UserNameIsExist(String userName)
        {
            int result = 0;
            try
            {
              result =  RecordExisted(tableName, UserName, userName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public int EmailIsExist(String email)
        {
            int result = 0;
            try
            {
                result = RecordExisted(tableName, Email, email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        //public int UpdateMemberAdmin(Member member)
        //{
        //    int result = 0;
        //    try
        //    {
        //        String[] columnNames = {UserName, Password, Email, FullName, Country, Address, BirthDay, Gender, Yahoo, 
        //                                            Phone, Hospital, AboutMe, IsPublic};
        //        Object[] values = {member.UserName, member.Password, member.Email, member.FullName, memProfile.Country, memProfile.Address, 
        //        memProfile.BirthDay, memProfile.Gender, memProfile.Yahoo, memProfile.Phone, memProfile.Hospital, memProfile.AboutMe, member.IsPublic};
        //        result = ProcessTableTypeStore("Udp_MemberProfiles", columnNames, values);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return result;
        //}

        //public int DeleteMember(String id)
        //{
        //    int result = 0;
        //    try
        //    {
        //        String[] keyColumns = (MemberDA.MemberID);
        //        String[] keyValues = { id };
        //        result = ProcessTableTypeStore("MembersDelete", keyColumns, keyValues);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return result;
        //}

        public int UpdateMemberInfoByAdmin(Member member, MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                String[] columnNamesInfo = {MemberID,Email, FullName, RoleID, Blast, Avatar, Country, Address, 
                                                    BirthDay, Yahoo, Phone, Blog,Hospital,Signature,AboutMe};
                Object[] values = {member.MemberID , member.Email, member.FullName ,memberProfile.RoleID, memberProfile.Blast, memberProfile.Avatar, memberProfile.Country, memberProfile.Address,
                memberProfile.BirthDay, memberProfile.Yahoo, memberProfile.Phone,  memberProfile.Blog, memberProfile.Hospital, memberProfile.Signature, memberProfile.AboutMe};
                result = ProcessTableTypeStore("UpdateMemberInfoByAdmin", columnNamesInfo, values);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int UpdateMemberInfo(Member member, MemberProfile memberProfile)
        {
            int result = 0;
            try
            {
                String[] columnNamesInfo = {MemberID,Password,Email, FullName,  Blast, Avatar, Country, Address, 
                                                    BirthDay, Yahoo, Phone, Blog,Hospital,Signature,AboutMe};
                Object[] values = {member.MemberID ,member.Password, member.Email,member.FullName, memberProfile.Blast, memberProfile.Avatar, memberProfile.Country, memberProfile.Address,
                memberProfile.BirthDay, memberProfile.Yahoo, memberProfile.Phone,  memberProfile.Blog, memberProfile.Hospital, memberProfile.Signature, memberProfile.AboutMe};
                result = ProcessTableTypeStore("UpdateMemberInfo", columnNamesInfo, values);
 
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public DataSet GetAllInfoOfMemberByMemberID(int memberID)
        {
            DataSet allMemberInfo = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetAllInfoOfMemberByMemberID {0}", memberID);
                allMemberInfo = ExecuteDataset(cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (allMemberInfo.Tables[0].Rows.Count > 0)
            {
                return allMemberInfo;
            }
            else
            {
                return null;
            }
        }

        public int BanOrUnBanUser(int memberID,Boolean allowLogin)
        {
            int result = 0;
            try
            {
                String[] columnNamesInfo = {MemberID,AllowLogin};
                Object[] values = {memberID,allowLogin};
                result = ProcessTableTypeStore("BanOrUnBanUser", columnNamesInfo, values);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Member GetMemberByUserName(String userName)
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetMemberByUserName {0}", userName);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }

        public Member[] GetBannedUsers()
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetBannedUsers");
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public Member GetBannedUser(int memberID)
        {
            Member[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetBannedUser {0}", memberID);
                result = SelectCollection<Member>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }
    }
}