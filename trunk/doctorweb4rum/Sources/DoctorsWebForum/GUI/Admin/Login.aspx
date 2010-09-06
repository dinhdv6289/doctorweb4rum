<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="GUI_Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../../GUI/Admin/datas/controlpanel.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <table cellspacing="0" cellpadding="0" border="0" align="center" width="450" class="tborder">
            <tbody>
                <tr>
                    <td>
                        <!-- header -->
                        <div style="padding: 4px; text-align: center;" class="tcat">
                            <b>Login</b></div>
                        <!-- /header -->
                        <!-- logo and version -->
                        <table cellspacing="0" cellpadding="4" border="0" width="100%" class="navbody">
                            <tbody>
                                <tr valign="bottom">
                                    <td>
                                        <img border="0" title="" alt="" src="datas/RunControl.png"></td>
                                    <td>
                                        <b><a href="#">Doctors WebForum</a></b><br>
                                        Admin Control Panel<br>
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- /logo and version -->
                        <table cellspacing="0" cellpadding="4" border="0" width="100%" class="logincontrols">
                            <col width="50%" style="text-align: right; white-space: nowrap;">
                            <col>
                            <col width="50%">
                            <!-- login fields -->
                            <tbody>
                                <tr>
                                    <td>
                                        UserName:</td>
                                    <td>
                                        <asp:TextBox ID="txtUserName" runat="server" Style="padding-left: 5px; font-weight: bold;
                                            width: 250px;"></asp:TextBox></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Password:</td>
                                    <td>
                                        <asp:TextBox ID="txtPassword" runat="server" Style="padding-left: 5px; font-weight: bold;
                                            width: 250px;" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr id="cap_lock_alert" style="display: none;">
                                    <td>
                                        &nbsp;</td>
                                    <td class="tborder">
                                        <strong>Caps Lock is on!</strong><br>
                                        <br>
                                        Having Caps Lock on may cause you to enter your password incorrectly. You should
                                        press Caps Lock to turn it off before entering your password.</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </tbody>
                            <!-- /login fields -->
                            <!-- submit row -->
                            <tbody>
                                <tr>
                                    <td align="center" colspan="3">
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="button" OnClick="btnLogin_Click" />
                                    </td>
                                </tr>
                            </tbody>
                            <!-- /submit row -->
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
