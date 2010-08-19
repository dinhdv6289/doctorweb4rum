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
        private const String tableName2 = "MemberProfiles";
        private const String MemberID = "MemberID";
        private const String UserName = "UserName";
        private const String Password = "Password";
        private const String FullName = "FullName";
        private const String DateCreation = "DateCreation";
        private const String AllowLogin = "AllowLogin";
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
        private const String IPAddress = "IPAddress";
        private const String LastLogin = "LastLogin";
        private const String MyRss = "MyRss";
        private const String Signature = "Signature";
        private const String AboutMe = "AboutMe";


        private String[] columnNames = { MemberID, UserName, Password, FullName, DateCreation, AllowLogin, IsOnline };
        private String[] memberProfileColumnNames ={ MemberID, RoleID, Blast, Avatar, Country, Address, BirthDay, Gender, Yahoo, 
                                                    Phone, Hospital, Blog, TotalPosts, TotalThanks, TotalThanked, CurrentExperience,
                                                    MemberLevel, IPAddress, LastLogin, MyRss, Signature, AboutMe};
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

        //public Member GetMemberByUserNamePassword(string userName, string password)
        //{
        //    Member[] result = null;
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = String.Format("Select * from {0} where {1} = {2} and {3} = {4}", tableName, UserName, userName, Password, password);
        //        result = SelectCollection<Member>(columnNames, columnNames, cmd);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return result[0];
        //}

        //public Member InsertMember()
        //{
        //    //Member[] result = null;
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = String.Format("InsertMembers");
        //        //result = SelectCollection<Member>(columnNames, columnNames, cmd);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    if (result.Length > 0)
        //    {
        //        return 
        //          //result[0];
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //}


        //public Member InsertMemberProfile()
        //{
        //    //Member[] result = null;
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = String.Format("InsertMemberProfiles");
        //        //result = SelectCollection<Member>(columnNames, columnNames, cmd);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    if (result.Length > 0)
        //    {
        //        return 
        //          //result[0];
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //}

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
                cmd.CommandText = String.Format("Select * from {0} where {1} = {2}", tableName2, MemberID, memberID);
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
    }
}