<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="GUI_Register" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="pagetitle">
<h1>Registration</h1>

</div>

<script type="text/javascript" src="http://s.dpstatic.com/s/vbulletin_md5.js?v=406"></script>
<script type="text/javascript">
function verify_passwords(password1, password2)
{
// do various checks, this will save people noticing mistakes on next page
if (password1.value == '' || password2.value == '')
{
alert('Please fill out both password fields.');
return false;
}
else if (password1.value != password2.value)
{
alert('The entered passwords do not match.');
return false;
}
else
{


var junk_output;

md5hash(password1, document.forms.register.password_md5, junk_output, 0);
md5hash(password2, document.forms.register.passwordconfirm_md5, junk_output, 0);



return true;
}
return false;
}
</script>

<form id="registerform" action="register.php?do=addmember" name="register" method="post" onsubmit="return verify_passwords(password, passwordconfirm);" class="vbform block">



<h2 class="blockhead">Register at Digital Point Forums</h2>
<div class="blockbody formcontrols">



<h3 class="blocksubhead">
    &nbsp;</h3>




<h3 class="blocksubhead">Required Information</h3>

<div class="section">
<div class="blockrow">
<label for="regusername">User Name:</label>
<div class="rightcol">
    <asp:TextBox ID="TextBox1" runat="server" CssClass="primary textbox" ></asp:TextBox>
<!--<input autocomplete="off" class="primary textbox" id="regusername" name="username" maxlength="25" value="" tabindex="1" type="text">-->
<!--<img src="clear.gif" id="reg_verif_image" alt="" />-->
<div id="reg_verif_div" class="primary" style="display: none;"></div>
<script type="text/javascript" src="http://s.dpstatic.com/s/vbulletin_ajax_nameverif.js?v=406"></script>
<script type="text/javascript">
<!--
regname_verif = new vB_AJAX_NameVerify('regname_verif', 'regusername');
//-->
</script>
<p class="description">Please enter the name by which you would like to log-in and be known on this site.</p>

</div>
</div>

<div class="blockrow">
<ul class="group">
<li>
<label for="password">Password:</label>
    <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" ></asp:TextBox>
<!--<input class="textbox" name="password" id="password" maxlength="50" value="" tabindex="1" type="password">-->
</li>
<li>
<label for="passwordconfirm">Confirm Password:</label>
    <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox" ></asp:TextBox>
<!--<input class="textbox" name="passwordconfirm" id="passwordconfirm" maxlength="50" value="" tabindex="1" type="password">-->
</li>
</ul>
<p class="description">Please enter a password for your user account. Note that passwords are case-sensitive.</p>

</div>

<div class="blockrow">
<ul class="group">
<li>
<label for="email">Email Address:</label>
    <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
<!--<input class="textbox" name="email" id="email" maxlength="50" value="" dir="ltr" tabindex="1" type="text">-->
</li> 
<li>
<label for="emailconfirm">Confirm Email Address:</label>
    <asp:TextBox ID="TextBox5" runat="server" CssClass="textbox" ></asp:TextBox>
<!--<input class="textbox" name="emailconfirm" id="emailconfirm" maxlength="50" value="" dir="ltr" tabindex="1" type="text">-->
</li>
</ul>
<p class="description">Please enter a valid email address for yourself.</p>

</div>

</div>





<h3 class="blocksubhead">Additional Information</h3>
<div class="section">

<div class="blockrow">

<label for="referrerfield_ctrl">Referrer:</label>
<div class="rightcol">
<div id="referrerfield" class="popupmenu nomouseover noclick nohovermenu">
    <asp:TextBox ID="TextBox6" runat="server" CssClass="primary textbox popupctrl" ></asp:TextBox>
<!--<input autocomplete="off" id="referrerfield_ctrl" class="primary textbox popupctrl" name="referrername" value="" tabindex="1" maxlength="25" type="text">-->
<div id="referrerfield_body" class="popupbody"></div>
</div>
<script type="text/javascript" src="http://s.dpstatic.com/s/vbulletin_ajax_suggest.js?v=406"></script>
<script type="text/javascript">
<!--
rnc = new vB_AJAX_NameSuggest('rnc', 'referrerfield_ctrl', 'referrerfield');
rnc.allow_multiple = false;
//-->
</script>
<p class="description">If you were referred to this site by an existing member of Doctor Forums, enter their username here.</p>
</div>
</div>

<div class="blockrow">
<label>Receive Email...</label>

<div class="rightcol">
<ul class="checkradio group">
<li>
<label for="cb_adminemail">
    <asp:CheckBox ID="CheckBox1" runat="server" /> <!--<input name="options[adminemail]" value="1" id="cb_adminemail" tabindex="1" checked="checked" type="checkbox">--> Receive Infraction Notifications</label>
</li>

<li>
<label for="cb_showemail">
    <asp:CheckBox ID="CheckBox2" runat="server" /> <!--<input name="options[showemail]" value="1" id="cb_showemail" tabindex="1" checked="checked" type="checkbox">--> Receive Email from Other Members</label>
</li>

</ul>
<p class="description">This option allows you to be notified if you receive an infraction.<br><br>If you do not want to receive these notices, disable this option (but please don't complain about not knowing why you received an infraction).</p>

</div>
</div>


</div>
</div>


<h2 class="blockhead">Forum Rules</h2>
<div class="blockbody formcontrols">
<div class="section">
<div class="blockrow">
<p class="label">In order to proceed, you must agree with the following rules:</p>
<div id="forumrules" class="restore">
    <asp:TextBox ID="TextBox7" runat="server" Enabled="False" TextMode="MultiLine" Height="86px" Width="558px">
    <p><strong>Forum Rules</strong></p>

<p>Registration to this forum is free! We do insist that you abide by the rules and policies detailed
below. If you agree to the terms, please check the 'I agree' checkbox and press the 'Complete Registration' button below.
If you would like to cancel the registration, click <a href="./">here</a>
to return to the forums index.</p>
<p>Although the administrators and moderators of Digital Point Forums will attempt to keep all objectionable
messages off this site, it is impossible for us to review all messages.  All messages express the views of
the author, and neither the owners of Digital Point Forums, nor vBulletin Solutions, Inc. (developers of vBulletin)
will be held responsible for the content of any message.</p>

<p>By agreeing to these rules, you warrant that you will not post any messages that are obscene, vulgar,
sexually-oriented, hateful, threatening, or otherwise violative of any laws.  By agreeing to these rules,
you grant Digital Point Forums non-exclusive rights to publish content (posts, visitor messages, etc.) you create here.</p>

<p>The owners of Digital Point Forums reserve the right to remove, edit, move or close any content item for any reason.</p>
    </asp:TextBox>
<%--
<p><strong>Forum Rules</strong></p>

<p>Registration to this forum is free! We do insist that you abide by the rules and policies detailed
below. If you agree to the terms, please check the 'I agree' checkbox and press the 'Complete Registration' button below.
If you would like to cancel the registration, click <a href="./">here</a>
to return to the forums index.</p>
<p>Although the administrators and moderators of Digital Point Forums will attempt to keep all objectionable
messages off this site, it is impossible for us to review all messages.  All messages express the views of
the author, and neither the owners of Digital Point Forums, nor vBulletin Solutions, Inc. (developers of vBulletin)
will be held responsible for the content of any message.</p>

<p>By agreeing to these rules, you warrant that you will not post any messages that are obscene, vulgar,
sexually-oriented, hateful, threatening, or otherwise violative of any laws.  By agreeing to these rules,
you grant Digital Point Forums non-exclusive rights to publish content (posts, visitor messages, etc.) you create here.</p>

<p>The owners of Digital Point Forums reserve the right to remove, edit, move or close any content item for any reason.</p>
--%>
</div>
</div>
<div class="blockrow singlecheck">
<label for="cb_rules_agree" class="full">
    <asp:CheckBox ID="CheckBox3" runat="server" /> <!--<input name="agree" id="cb_rules_agree" tabindex="1" value="1" type="checkbox">--> <strong>I have read, and agree to abide by the Digital Point Forums rules.</strong></label>
</div>
<div class="blockrow singlecheck">
<label for="cb_rules_duplicate" class="full">
    <asp:CheckBox ID="CheckBox4" runat="server" /> <!--<input name="duplicate" id="cb_rules_duplicate" tabindex="1" value="1" type="checkbox">--> <strong>I have never registered under a different username.</strong></label>
</div>
</div>
</div>

<div class="blockfoot actionbuttons">

<div class="group">
<%--<input name="s" value="" type="hidden">
<input name="securitytoken" value="guest" type="hidden">
<input name="do" value="addmember" type="hidden">
<input name="url" value="http://forums.digitalpoint.com/forumdisplay.php?f=69" type="hidden">
<input name="password_md5" type="hidden">
<input name="passwordconfirm_md5" type="hidden">

<input name="day" value="" type="hidden">
<input name="month" value="" type="hidden">
<input name="year" value="" type="hidden">--%>

    <asp:Button ID="Button1" runat="server" Text="Complete Registration" CssClass="button" />
<!--<input class="button" value="Complete Registration" tabindex="1" accesskey="s" type="submit">-->
    <asp:Button ID="Button2" runat="server" Text="Reset Fields" CssClass="button" />
<!--<input class="button" name="Reset" tabindex="1" value="Reset Fields" type="reset">-->
</div>

</asp:Content>

