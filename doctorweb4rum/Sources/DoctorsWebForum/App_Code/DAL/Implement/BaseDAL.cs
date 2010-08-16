using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Reflection;
using System.Collections.Generic;

/// <summary>
/// Summary description for BaseDAL
/// </summary>
namespace DAL
{
    public class BaseDAL
    {
        public BaseDAL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        protected static String getConnectionString
        {
            get
            {
                return WebConfigurationManager.ConnectionStrings["DWFConnectionString"].ConnectionString;
            }
        }
        protected static int InsertTableWithReturnID(String tableName, String[] columnNames, Object[] values, out int autoID)
        {
            int result = 0;
            autoID = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(getConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.Text;
                    String sql = "Insert into " + tableName + "(";
                    String val = " Values(";
                    for (int i = 0; i < columnNames.Length; i++)
                    {
                        //khong insert nhung truong co gia tri la null
                        if (values[i] != null)
                        {
                            sql += columnNames[i] + ",";
                            val += "@" + columnNames[i] + ",";
                        }
                    }
                    //loai bo ky tu , cuoi cung
                    sql = sql.Remove(sql.Length - 1);
                    val = val.Remove(val.Length - 1);
                    sql += ")" + val + ")";
                    sql += "; SET @AutoID = SCOPE_IDENTITY()";
                    cmd.CommandText = sql;
                    for (int i = 0; i < columnNames.Length; i++)
                    {
                        if (values[i] != null)
                            cmd.Parameters.AddWithValue(columnNames[i], values[i]);

                    }
                    //lay truong tu tang kieu int
                    SqlParameter autoIDParameter = new SqlParameter("@AutoID", SqlDbType.Int);
                    autoIDParameter.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(autoIDParameter);

                    connection.Open();
                    result = cmd.ExecuteNonQuery();
                    try
                    {
                        if (autoIDParameter.Value != null)
                            autoID = (int)autoIDParameter.Value;
                    }
                    catch (Exception ex)
                    {
                        throw ex;

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        protected static int InsertTable(String tableName, String[] colNames, Object[] values)
        {
            int result = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(getConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.Text;
                    String sql = "Insert into " + tableName + " (";
                    String vals = " Values(";
                    for (int i = 0; i < colNames.Length; i++)
                    {
                        if (values[i] != null)
                        {
                            sql += colNames[i] + ",";
                            vals += "@" + colNames[i] + ",";
                        }
                    }
                    sql = sql.Remove(sql.Length - 1);
                    vals = vals.Remove(vals.Length - 1);
                    sql += ")" + vals + ")";
                    cmd.CommandText = sql;
                    for (int i = 0; i < colNames.Length; i++)
                    {
                        cmd.Parameters.AddWithValue(colNames[i], values[i]);
                    }
                    connection.Open();
                    result = cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return result;
        }
        protected static int UpdateTable(String tableName, String[] columnNames, Object[] values, String[] keyColumns, Object[] keyValues)
        {
            int result = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(getConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.Text;
                    String sql = "Update " + tableName + " set ";
                    for (int i = 0; i < columnNames.Length; i++)
                    {
                        sql += columnNames[i] + "=@" + columnNames[i] + ",";

                    }
                    sql = sql.Remove(sql.Length - 1);
                    String whereClause = " Where ";
                    for (int i = 0; i < keyColumns.Length; i++)
                    {
                        whereClause += keyColumns[i] + "=@Original_" + keyColumns[i] + " AND ";

                    }
                    whereClause = whereClause.Remove(whereClause.Length - 4);
                    cmd.CommandText = sql + whereClause;
                    for (int i = 0; i < columnNames.Length; i++)
                    {
                        if (values[i] != null)
                            cmd.Parameters.AddWithValue(columnNames[i], values[i]);
                        else
                            cmd.Parameters.AddWithValue(columnNames[i], DBNull.Value);
                    }
                    for (int i = 0; i < keyColumns.Length; i++)
                    {
                        cmd.Parameters.AddWithValue("@Original_" + keyColumns[i], keyValues[i]);
                    }
                    connection.Open();
                    result = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        protected static int DeleteTable(String tableName, String[] colNames, Object[] values)
        {
            int result = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(getConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    String sql = "Delete " + tableName;
                    String wClause = " where ";
                    for (int i = 0; i < colNames.Length; i++)
                    {
                        wClause += colNames[i] + "=@" + colNames[i] + " and ";
                    }
                    wClause = wClause.Remove(wClause.Length - 4);
                    cmd.CommandText = sql + wClause;
                    for (int i = 0; i < colNames.Length; i++)
                    {
                        cmd.Parameters.AddWithValue(colNames[i], values[i]);
                    }
                    con.Open();
                    result = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
            return result;
        }
        protected static int RecordExisted(String tableName, String primaryColumnName, Object value)
        {
            try
            {
                int result = 0;
                try
                {
                    using (SqlConnection connection = new SqlConnection(getConnectionString))
                    {
                        if (value.GetType().ToString().Equals("System.String"))
                            value = "'" + value + "'";
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = connection;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = String.Format("Select count(*) from {0} where {1}={2}", tableName, primaryColumnName, value);
                        connection.Open();
                        result = (int)cmd.ExecuteScalar();
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected static T[] SelectCollection<T>(String[] collectionNames, String[] columnNames, SqlCommand cmd) where T : new()
        {
            List<T> resultList = new List<T>();
            try
            {
                using (SqlConnection con = new SqlConnection(getConnectionString))
                {
                    cmd.Connection = con;
                    DataTable dt = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        T obj = new T();
                        Type t = obj.GetType();
                        PropertyInfo pInfo;
                        for (int i = 0; i < columnNames.Length; i++)
                        {
                            if (dr[columnNames[i]] != DBNull.Value)
                            {
                                pInfo = t.GetProperty(columnNames[i]);
                                pInfo.SetValue(obj, dr[columnNames[i]], null);
                            }
                        }
                        resultList.Add(obj);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultList.ToArray();
        }

        protected static DataSet ExecuteDataset(SqlCommand cmd)
        {
            DataSet ds = null;
            using (SqlConnection con = new SqlConnection(getConnectionString))
            {
                cmd.Connection = con;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                ds = new DataSet();
                adapter.Fill(ds);
            }
            return ds;
        }

    }
}
