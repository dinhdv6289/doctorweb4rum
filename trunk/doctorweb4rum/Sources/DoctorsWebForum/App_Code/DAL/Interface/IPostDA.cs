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
        int InsertPost(Post post);
        Post GetPostByPostID(int postID);
        int[] GetRatingPoint(int postID);
        int InsertRatePost(RatingPost ratePost);
        int ThankPost(int memberID, int postID);
        Boolean isThanked(int postID, int memberID);
        int EditPost(Post postEdit);

    }
}