<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="GUI_Register" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <br />
        <hr />
        <br />
    </div>
    <br />
    <div class="vbform block">
        <h2 class="blockhead">
            Register at Doctor Web Forums</h2>
        <div class="blockbody formcontrols">
            <h3 class="blocksubhead">
                Required Information</h3>
            <div class="section">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="registerValidate"
                    CssClass="blockrow" />
                <div class="blockrow">
                    <label for="regusername">
                        User Name:</label>
                    <div class="rightcol">
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="primary textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The UserName is not null."
                            ValidationGroup="registerValidate" ControlToValidate="txtUserName" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="The UserName is string have 6 - 25 characters."
                            ValidationGroup="registerValidate" ValidationExpression="^.{6,25}$" ControlToValidate="txtUserName"
                            Display="Dynamic">*</asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="User Name is used !"
                            ControlToValidate="txtUserName" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"
                            ValidationGroup="registerValidate">*</asp:CustomValidator>
                        <div id="reg_verif_div" class="primary" style="display: none;">
                        </div>
                        <p class="description">
                            Please enter the name by which you would like to log-in and be known on this site.</p>
                    </div>
                </div>
                <div class="blockrow">
                    <ul class="group">
                        <li>
                            <label for="password">
                                Password:</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword"
                                Display="Dynamic" ErrorMessage="The password is not null." ValidationGroup="registerValidate">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword"
                                Display="Dynamic" ErrorMessage="The password is more 6 characters.." ValidationExpression=".{6,}"
                                ValidationGroup="registerValidate">*</asp:RegularExpressionValidator></li><li>
                                    <label for="passwordconfirm">
                                        Confirm Password:</label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmPassword"
                                        Display="Dynamic" ErrorMessage="The confirm password is not null." ValidationGroup="registerValidate">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword"
                                        ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Password do not match."
                                        ValidationGroup="registerValidate">*</asp:CompareValidator></li></ul>
                    <p class="description">
                        Please enter a password for your user account. Note that passwords are case-sensitive.</p>
                </div>
                <div class="blockrow">
                    <ul class="group">
                        <li>
                            <label for="email">
                                Email Address:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The Email is not null."
                                ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="registerValidate">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email address is invalid."
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="registerValidate"
                                ControlToValidate="txtEmail" Display="Dynamic">*</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtEmail"
                                Display="Dynamic" ErrorMessage="The Email is used." OnServerValidate="CustomValidator2_ServerValidate"
                                ValidationGroup="registerValidate">*</asp:CustomValidator></li><li>
                                    <label for="emailconfirm">
                                        Confirm Email Address:</label>
                                    <asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmEmail"
                                        Display="Dynamic" ErrorMessage="The confirm email  is not null." ValidationGroup="registerValidate">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail"
                                        ControlToValidate="txtConfirmEmail" Display="Dynamic" ErrorMessage="Email is not match."
                                        ToolTip="Email is not match." ValidationGroup="registerValidate">*</asp:CompareValidator></li></ul>
                    <p class="description">
                        Please enter a valid email address for yourself.</p>
                </div>
            </div>
            <h3 class="blocksubhead">
                Profile Information</h3>
            <div class="section">
                <div class="blockrow">
                    <ul class="group">
                        <li>
                            <label for="password">
                                Full Name:</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="passwordconfirm">
                                Address:</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="passwordconfirm">
                                Country:</label>
                            <asp:TextBox ID="txtCountry" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="passwordconfirm">
                                BirthDay:</label>
                            <asp:TextBox ID="txtBirthDay" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="passwordconfirm">
                                Gender:</label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
                <div class="blockrow">
                    <ul class="group">
                        <li>
                            <label for="email">
                                Yahoo:</label>
                            <asp:TextBox ID="txtYahoo" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="email">
                                Phone:</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="email">
                                Hospital:</label>
                            <asp:TextBox ID="txtHospital" runat="server" CssClass="textbox"></asp:TextBox>
                        </li>
                        <li>
                            <label for="emailconfirm">
                                About Me:</label>
                            <asp:TextBox ID="txtAboutMe" runat="server" CssClass="textbox" Height="55px" TextMode="MultiLine"
                                Width="434px"></asp:TextBox>
                        </li>
                    </ul>
                </div>
            </div>
            <h3 class="blocksubhead">
                Additional Information</h3>
            <div class="blockrow">
                <label>
                    Viewable Profile...</label>
                <div class="rightcol">
                    <ul class="checkradio group">
                        <li>
                            <label for="cb_showemail">
                                <asp:CheckBox ID="cbPublicProfile" runat="server" />
                                Public Profile To Other Members</label>
                        </li>
                    </ul>
                    <p class="description">
                        This option allows you to be share profile with other members<br>
                        <br>
                        If you do not want to receive these notices, disable this option (but please don't
                        complain about not knowing why you received an infraction).</p>
                </div>
            </div>
            <h3 class="blocksubhead">
                Forum Rules</h3>
            <div class="section">
                <div class="blockrow">
                    <p class="label">
                        In order to proceed, you must agree with the following rules:</p>
                    <div id="forumrules" class="restore">
                        <asp:TextBox ID="forumrule123" runat="server" Width="100%" Height="86px"
                            TextMode="MultiLine" Enabled="False">
    Forum Rules

Registration to this forum is free! We do insist that you abide by the rules and policies detailed
below. If you agree to the terms, please check the 'I agree' checkbox and press the 'Complete Registration' button below.
If you would like to cancel the registration, click &lt;a href=&quot;./&quot;&gt;here&lt;/a&gt;
to return to the forums index.
Although the administrators and moderators of Doctors Web Forums will attempt to keep all objectionable
messages off this site, it is impossible for us to review all messages.  All messages express the views of
the author, and neither the owners of Doctors Web Forums, nor vBulletin Solutions, Inc. (developers of vBulletin)
will be held responsible for the content of any message.

By agreeing to these rules, you warrant that you will not post any messages that are obscene, vulgar,
sexually-oriented, hateful, threatening, or otherwise violative of any laws.  By agreeing to these rules,
you grant Doctors Web Forums non-exclusive rights to publish content (posts, visitor messages, etc.) you create here.

The owners of Doctors Web Forums reserve the right to remove, edit, move or close any content item for any reason.
                        </asp:TextBox>
                    </div>
                    <div class="blockrow singlecheck">
                        <label class="full" for="cb_rules_agree">
                            <asp:CheckBox ID="cbHaveread" runat="server"></asp:CheckBox>
                            <strong>I have read, and agree to abide by the Doctors Web Forums rules.</strong></label>
                    </div>
                </div>
            </div>
            <div class="blockfoot actionbuttons">
                <div class="group">
                    <asp:Button ID="btnCompleteRegister" OnClick="btnCompleteRegister_Click" runat="server"
                        CssClass="button" Text="Complete Registration" ValidationGroup="registerValidate">
                    </asp:Button>
                    <asp:Button ID="btnResetRegister" OnClick="btnResetRegister_Click" runat="server"
                        CssClass="button" Text="Reset Fields"></asp:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
