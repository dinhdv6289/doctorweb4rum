using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for RoleDA
/// </summary>
///
namespace DAL
{
    public class RoleDA : BaseDAL, IRoleDA
    {
        public RoleDA()
        {
            //
            // TODO: Add constructor logic here
            //

        }

        private const String tableName = "Roles";
        private const String RoleID = "RoleID";
        private const String RoleName = "RoleName";
        private const String Description = "Description";
        private const String TotalPosts = "TotalPosts";
        private const String RankImage = "RankImage";

        private String[] columnNames = { RoleID, RoleName, Description, TotalPosts, RankImage };
        private String[] columnNamesToInsert = { RoleName, Description, TotalPosts, RankImage };


        public Role GetRoleByRoleID(int roleID)
        {
            Role[] result = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = String.Format("GetRoleByRoleID {0}", roleID);
                result = SelectCollection<Role>(columnNames, columnNames, cmd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (result.Length > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }

        }

        public int InsertTest()
        {
            int k = 0;
            try
            {
                Object[] values ={ "roleName", "Description", 1, "test.jpg" };
                k = ProcessTableTypeStore("InsertTest", columnNamesToInsert, values);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            return k;

        }


    }
}
