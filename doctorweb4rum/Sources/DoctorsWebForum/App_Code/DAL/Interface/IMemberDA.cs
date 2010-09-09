using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for IMemberDA
/// </summary>
namespace DAL
{

    public interface IMemberDA
    {
        Member[] GetAllMember();
        Member GetMemberByMemberID(int memberID);
        MemberProfile GetMemberProfileByMemberID(int memberID);
        Member GetMemberOfTopicByTopicID(int memberID);
        Member GetLastMemberPostByTopicID(int topicID);
        Member GetMemberByUserNamePassword(string userName, string password);
        int UpdateMemberInfoByAdmin(Member member, MemberProfile memberProfile);
        int UpdateMemberInfo(Member member, MemberProfile memberProfile);
        int InsertMember(Member member, out int autoID);
        int InsertMemberProfile(MemberProfile memberProfile);
        int InsertMemberInfo(Member member, MemberProfile memProfile,out int resultStatus);
        int UserNameIsExist(String userName);
        int EmailIsExist(String email);
        int UpdateMember(Member member);
        int MembersOnline();
        DataSet GetAllInfoOfMemberByMemberID(int memberID);
        int BanOrUnBanUser(int memberID,Boolean allowLogin);
        Member GetMemberByUserName(String userName);
        Member[] GetBannedUsers();
        Member GetBannedUser(int memberID);
        DataTable SearchForUserByUserName(String userName);
        //int UpdateMemberAdmin(Member member);
        //int DeleteMember(String id);
    }
}