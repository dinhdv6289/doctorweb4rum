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
    }
}