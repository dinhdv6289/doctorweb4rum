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
/// Summary description for ICategoryDA
/// </summary>
namespace DAL
{
    public interface ICategoryDA
    {
        Category[] GetAllCategory();
        DataSet GetStatistics();
        int InsertCategory(Category cat, out int resultStatus);
        int DeleteCategory(String id);
        int UpdateCategory(Category cat);
    }
}