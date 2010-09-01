<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="GUI_Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="standard_error">
        <h2 class="blockhead">
            Message</h2>
        <div class="blockbody formcontrols">
            <h3 class="blocksubhead">
                You are not logged in or you do not have permission to access this page. This could
                be due to one of several reasons:</h3>
            <div class="blockrow restore">
                <ol>
                    <li>You are not logged in. Fill in the form at the bottom of this page and try again.</li><li>
                        You may not have sufficient privileges to access this page. Are you trying to edit
                        someone else's post, access administrative features or some other privileged system?</li><li>
                            If you are trying to post, the administrator may have disabled your account, or
                            it may be awaiting activation.</li></ol>
            </div>
            <p class="blockrow">
                The administrator may have required you to <a href="Register.aspx"
                    rel="nofollow">Register</a> before you can view this page.</p>
            <h3 class="blocksubhead">
                Log in</h3>
            <div class="blockrow">
                <label for="vb_login_username">
                    User Name:</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="primary textbox"></asp:TextBox>
            </div>
            <div class="blockrow">
                <label for="vb_login_password">
                    Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="primary textbox"  TextMode="Password"></asp:TextBox>
            </div>
            <div class="blockrow singlecheck">
                <label for="cb_cookieuser" style="width: 245px">
                    <asp:CheckBox ID="checkBoxRememberMe" runat="server" value="1" />
                    Remember Me?</label>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="button" OnClick="btnLogin_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="button" OnClick="btnReset_Click" />
            </div>
        </div>
    </div>
</asp:Content>
