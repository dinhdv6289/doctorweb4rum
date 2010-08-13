using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

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
