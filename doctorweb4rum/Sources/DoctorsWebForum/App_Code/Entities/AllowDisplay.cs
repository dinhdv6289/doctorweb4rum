using System;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for AllowDisplay
/// </summary>
public class AllowDisplay
{
	public AllowDisplay()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int memberID;
    private Boolean disFullName;
    private Boolean disEmail;
    private Boolean disBirthDay;
    private Boolean disAddress;
    private Boolean disYahoo;
    private Boolean disPhone;
    private Boolean disHospital;
    private Boolean disBlog;
    private Boolean disSignature;

    public int MemberID
    {
        get { return memberID; }
        set { memberID = value; }
    }

    public Boolean DisFullName
    {
        get { return disFullName; }
        set { disFullName = value; }
    }

    public Boolean DisEmail
    {
        get { return disEmail; }
        set { disEmail = value; }
    }

    public Boolean DisBirthDay
    {
        get { return disBirthDay; }
        set { disBirthDay = value; }
    }

    public Boolean DisAddress
    {
        get { return disAddress; }
        set { disAddress = value; }
    }

    public Boolean DisYahoo
    {
        get { return disYahoo; }
        set { disYahoo = value; }
    }

    public Boolean DisPhone
    {
        get { return disPhone; }
        set { disPhone = value; }
    }

    public Boolean DisHospital
    {
        get { return disHospital; }
        set { disHospital = value; }
    }

    public Boolean DisBlog
    {
        get { return disBlog; }
        set { disBlog = value; }
    }

    public Boolean DisSignature
    {
        get { return disSignature; }
        set { disSignature = value; }
    }
   
	

}
