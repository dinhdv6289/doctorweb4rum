using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ISubForumDA
/// </summary>
namespace DAL
{

    public interface ISubForumDA
    {
        SubForum[] GetAllSubForumsByCategoryID(int CategoryID);
        DateTime GetDateLastPostBySubForumID(int SubForumID);
        SubForum GetSubForumBySubForumID(int subForumID);
        int InsertSubForum(SubForum sub, out int resultStatus);
        //int UpdateSubForum(SubForum sub);
    }

}