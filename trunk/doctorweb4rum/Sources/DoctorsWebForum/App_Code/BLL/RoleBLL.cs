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
    }
}