using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for Category
/// </summary>
public class Category
{
	public Category()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int categoryID;
    private String categoryName;
    private int priority;
    private DateTime dateCreation;

    public DateTime DateCreation
    {
        get { return dateCreation; }
        set { dateCreation = value; }
    }


    public int Priority
    {
        get { return priority; }
        set { priority = value; }
    }


    public String CategoryName
    {
        get { return categoryName; }
        set { categoryName = value; }
    }


    public int CategoryID
    {
        get { return categoryID; }
        set { categoryID = value; }
    }

}
