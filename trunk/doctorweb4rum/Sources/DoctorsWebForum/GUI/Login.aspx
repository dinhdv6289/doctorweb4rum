<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="GUI_Login" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="standard_error">
<h2 class="blockhead">Message</h2>

<form class="block vbform" method="post" action="login.php?do=login" onsubmit="md5hash(vb_login_password, vb_login_md5password, vb_login_md5password_utf, 0)">
<input name="do" value="login" type="hidden">
<input name="vb_login_md5password" value="" type="hidden">
<input name="vb_login_md5password_utf" value="" type="hidden">
<input name="s" value="506f6795e84fdcce515a19b4738de819" type="hidden">
<input name="securitytoken" value="guest" type="hidden">




<input name="url" value="/member.php?u=427084" type="hidden">

<div class="blockbody formcontrols">

<h3 class="blocksubhead">You are not logged in or you do not have permission to access this page. This could be due to one of several reasons:</h3>

<div class="blockrow restore">
<ol>
<li>You are not logged in. Fill in the form at the bottom of this page and try again.</li>
<li>You may not have sufficient privileges to access this page. Are you trying to edit someone else's post, access administrative features or some other privileged system?</li>
<li>If you are trying to post, the administrator may have disabled your account, or it may be awaiting activation.</li>
</ol>
</div>


<p class="blockrow">The administrator may have required you to <a href="register.php?s=506f6795e84fdcce515a19b4738de819&amp;" rel="nofollow">register</a> before you can view this page.</p>

<h3 class="blocksubhead">Log in</h3>
<div class="blockrow">
<label for="vb_login_username">User Name:</label>
<input class="primary textbox" id="vb_login_username" name="vb_login_username" accesskey="u" tabindex="1" type="text">
</div>
<div class="blockrow">
<label for="vb_login_password">Password:</label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="primary textbox"></asp:TextBox>

</div>
<div class="blockrow singlecheck">
<label for="cb_cookieuser"><input name="cookieuser" id="cb_cookieuser" value="1" tabindex="1" type="checkbox"> Remember Me?</label>
</div>

</div>
<div class="blockfoot actionbuttons">
<div class="group">
<input class="button" value="Log in" accesskey="s" tabindex="1" type="submit">
<input class="button" value="Reset Fields" accesskey="r" tabindex="1" type="reset">
</div>
</div>

</form>

</div>
</asp:Content>

