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

        public static ISubForumDA GetSubForumDA()
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

        public static IPostDA GetPostDA()
        {
            IPostDA dc = null;
            if (String.IsNullOrEmpty(dataAccessStringType))
            {
                throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
            }
            else
            {
                if (dataAccessStringType.Equals("SQLSERVER"))
                {
                    Type t = Type.GetType("DAL.PostDA");
                    dc = (PostDA)Activator.CreateInstance(t);
                }
            }
            return dc;
        }

        public static IMemberDA GetMemberDA()
        {
            IMemberDA dc = null;
            if (String.IsNullOrEmpty(dataAccessStringType))
            {
                throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
            }
            else
            {
                if (dataAccessStringType.Equals("SQLSERVER"))
                {
                    Type t = Type.GetType("DAL.MemberDA");
                    dc = (MemberDA)Activator.CreateInstance(t);
                }
            }
            return dc;
        }

        public static IRoleDA GetRoleDA()
        {
            IRoleDA dc = null;
            if (String.IsNullOrEmpty(dataAccessStringType))
            {
                throw (new NullReferenceException("DataAccessType in Web.config is null or empty"));
            }
            else
            {
                if (dataAccessStringType.Equals("SQLSERVER"))
                {
                    Type t = Type.GetType("DAL.RoleDA");
                    dc = (RoleDA)Activator.CreateInstance(t);
                }
            }
            return dc;
        }
    }
}
