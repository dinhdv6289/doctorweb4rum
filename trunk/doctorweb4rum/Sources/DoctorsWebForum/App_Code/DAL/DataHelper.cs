﻿using System;
using System.Configuration;
namespace DAL
{
    public class DataHelper
    {
        public static String dataAccessStringType = ConfigurationManager.AppSettings["DataAccessLayerType"];
        public DataHelper()
        {

        }

        public static ICategoryDA getCategoryDA()
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

        public static ISubForumDA getSubForumDA()
        {
            ISubForumDA dc = null;
            if (String.IsNullOrEmpty(dataAccessStringType))
            {
                throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
            }
            else
            {
                if (dataAccessStringType.Equals("SQLSERVER"))
                {
                    Type t = Type.GetType("DAL.SubForumDA");
                    dc = (SubForumDA)Activator.CreateInstance(t);
                }
            }
            return dc;
        }


        public static ITopicDA GetTopicDA()
        {
            ITopicDA dc = null;
            if (String.IsNullOrEmpty(dataAccessStringType))
            {
                throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
            }
            else
            {
                if (dataAccessStringType.Equals("SQLSERVER"))
                {
                    Type t = Type.GetType("DAL.TopicDA");
                    dc = (TopicDA)Activator.CreateInstance(t);
                }
            }
            return dc;
        }

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
