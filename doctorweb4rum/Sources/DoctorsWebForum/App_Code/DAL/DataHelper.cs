using System;
using System.Configuration;
namespace DAL
{
    public class DataHelper
    {
        public static String dataAccessStringType = ConfigurationManager.AppSettings["DataAccessLayerType"];
        public DataHelper()
        {

        }

        public static ICategoryDA GetCategoryDA()
        {
            ICategoryDA dc = null;
            if (String.IsNullOrEmpty(dataAccessStringType))
            {
                throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
            }
            else
            {
                if (dataAccessStringType.Equals("SQLSERVER"))
                {
                    Type t = Type.GetType("DAL.CategoryDA");
                    dc = (CategoryDA)Activator.CreateInstance(t);
                }
            }
            return dc;
        }

        //public static IRateDA GetRateDA()
        //{
        //    IRateDA dc = null;
        //    if (String.IsNullOrEmpty(dataAccessStringType))
        //    {
        //        throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
        //    }
        //    else
        //    {
        //        if (dataAccessStringType.Equals("SQLSERVER"))
        //        {
        //            Type t = Type.GetType("DAL.RateDA");
        //            dc = (RateDA)Activator.CreateInstance(t);
        //        }
        //    }
        //    return dc;
        //}


        //public static ICategoryDA GetCategoryDA()
        //{
        //    ICategoryDA dc = null;
        //    if (String.IsNullOrEmpty(dataAccessStringType))
        //    {
        //        throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
        //    }
        //    else
        //    {
        //        if (dataAccessStringType.Equals("SQLSERVER"))
        //        {
        //            Type t = Type.GetType("DAL.CategoryDA");
        //            dc = (CategoryDA)Activator.CreateInstance(t);
        //        }
        //    }
        //    return dc;
        //}

        //public static IArticlesDA GetArticlesDA()
        //{
        //    IArticlesDA dc = null;
        //    if (String.IsNullOrEmpty(dataAccessStringType))
        //    {
        //        throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
        //    }
        //    else
        //    {
        //        if (dataAccessStringType.Equals("SQLSERVER"))
        //        {
        //            Type t = Type.GetType("DAL.ArticlesDA");
        //            dc = (ArticlesDA)Activator.CreateInstance(t);
        //        }
        //    }
        //    return dc;
        //}

        //public static ICustomersDA GetCustomersDA()
        //{
        //    ICustomersDA dc = null;
        //    if (String.IsNullOrEmpty(dataAccessStringType))
        //    {
        //        throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
        //    }
        //    else
        //    {
        //        if (dataAccessStringType.Equals("SQLSERVER"))
        //        {
        //            Type t = Type.GetType("DAL.CustomerDA");
        //            dc = (CustomerDA)Activator.CreateInstance(t);
        //        }
        //    }
        //    return dc;
        //}
    }
}
