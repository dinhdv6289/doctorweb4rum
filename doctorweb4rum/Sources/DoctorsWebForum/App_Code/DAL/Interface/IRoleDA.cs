using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for IRoleDA
/// </summary>
namespace DAL
{

    public interface IRoleDA
    {
        Role GetRoleByRoleID(int roleID);
    }
}