using System;
using System.Data;
using System.Configuration;


/// <summary>
/// Summary description for IPostDA
/// </summary>
namespace DAL
{
    public interface IPostDA
    {
        Post[] GetAllPostByTopicID(int topicID);
        Post GetNewPostBySubForumID(int subForumID);
        int GetCountPostBySubForumID(int subForumID);
        int GetCountPostsByTopicID(int topicID);
        Post GetLastPostOfTopicByTopicID(int topicID);
    }
}