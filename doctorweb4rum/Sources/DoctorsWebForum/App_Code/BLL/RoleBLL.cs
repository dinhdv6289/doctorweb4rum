using System;
using System.Data;
using System.Configuration;
using DAL;
/// <summary>
/// Summary description for RoleBLL
/// </summary>
///
namespace BLL
{

    public class RoleBLL
    {
        public RoleBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static Role GetRoleByRoleID(int roleID)
        {
            Role result = null;
            try
            {
                result = DataHelper.GetRoleDA().GetRoleByRoleID(roleID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static int InsertTest()
        {
            int result = 0;
            try
            {
                result = DataHelper.GetRoleDA().InsertTest();
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public static Role[] GetAllRoles()
        {
            Role[] result;
            try
            {
                result = DataHelper.GetRoleDA().GetAllRoles();
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}