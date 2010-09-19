<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditMemberProfile.aspx.cs" Inherits="GUI_EditMemberProfile" Title="Edit Member Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
    $(function() {
		$("#<%= txtBirthday.ClientID %>").datepicker({
            changeMonth: true,
			changeYear: true
		});
	});
    </script>

    <script language="javascript">
        function showControl(value) {
            if (value == 0) {
                document.getElementById('divShowHide').style.visibility = 'hidden';
            } else {
                document.getElementById('divShowHide').style.visibility = 'visible';
            }
        }

        function GetVal() {
            var e = document.getElementById('<%= Doctor.ClientID %>'+'_0');
            if (e.checked)
                return '0';
            else return '1';
        }
    </script>

    <div id="usercp_nav">
        <div class="block">
            <h2 class="blockhead">
                My Settings</h2>
            <div class="blockbody">
                <ul>
                    <li>
                        <h3 class="blocksubhead profile">
                            <img class="usercpimage" title="My Profile" alt="My Profile" src="Images/profile.png"
                                border="0" />
                            My Profile</h3>
                        <ul class="blockrow">
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditProfile" OnClick="linkButtonEditProfile_Click"
                                    runat="server">Edit Profile</asp:LinkButton>
                            </li>
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditAvatar" OnClick="linkButtonEditAvatar_Click" runat="server">Edit Avatar</asp:LinkButton>
                            </li>
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonProfilePrivacy" OnClick="linkButtonProfilePrivacy_Click"
                                    runat="server">Profile Privacy</asp:LinkButton>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="blocksubhead">
                            <img class="usercpimage" title="My Account" alt="My Account" src="Images/account.png" />
                            My Account</h3>
                        <ul class="blockrow">
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditEmailPassword" OnClick="linkButtonEditEmailPassword_Click"
                                    runat="server">Edit Email &amp; Password</asp:LinkButton>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <h4 class="blocksubhead">
                        </h4>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="usercp_content">
        <div class="cp_content">
            <asp:Panel ID="panelViewAndEditMember" runat="server">
                <h2 class="blockhead">
                    Edit Profile</h2>
                <div class="blockbody formcontrols settings_form_border">
                    <!-- start if customfields -->
                    <h3 class="blocksubhead">
                        Role</h3>
                    <div class="section">
                        <div class="blockrow">
                            <label>
                                User Group forum:</label>
                            <div class="rightcol">
                                <asp:Label ID="lblRoleGroup" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <h3 class="blocksubhead">
                        Profile</h3>
                    <div class="section">
                        <div class="blockrow">
                            <label>
                                UserName:</label>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox>
                        </div>
                        <div class="blockrow">
                            <label>
                                Birthday:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtBirthday" runat="server" CssClass="primary textbox"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Full Name:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="primary textbox"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Gender:</label>
                            <div class="rightcol">
                                <asp:Label ID="lblGender" runat="server" Enabled="False"></asp:Label>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
                            <contenttemplate>
                        <asp:Panel ID="panelIsDoctorToShow" runat="server">
						<div class="blockrow">
                            <label>
                                Are you the Doctor ?</label>
                           <asp:RadioButtonList ID="Doctor" runat="server"  OnPreRender="RadioButtonList2_PreRender">
                                        <asp:ListItem Selected="True" Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem  Value="0" Text="No"></asp:ListItem>
                                </asp:RadioButtonList>
                        </div>
                            <div id="divShowHide">
                        <div class="blockrow">
                            <label>
                                Hospital:</label>
                            <asp:TextBox ID="txtHospital" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>			
                        <div class="blockrow">
                            <label>
                                Professional:</label>
                                    <asp:DropDownList ID="drProfessional" runat="server" Width="248px">
                                    <asp:ListItem>Pre-Medical</asp:ListItem>
                                    <asp:ListItem>Veterinarian</asp:ListItem>
                                    <asp:ListItem>Dentist</asp:ListItem>
                                    <asp:ListItem>Pre-Pharmacy</asp:ListItem>
                                    <asp:ListItem>Psychology </asp:ListItem>
                                    <asp:ListItem>Optometrist</asp:ListItem>
                                    <asp:ListItem>Other Health Professions</asp:ListItem>
                                </asp:DropDownList>
                        </div>
                        <div class="blockrow">
                            <label>
                                Experience:</label>
                                <asp:DropDownList ID="drExperience" runat="server" Width="248px">
                                    <asp:ListItem>1 Year</asp:ListItem>
                                    <asp:ListItem>3 Year</asp:ListItem>
                                    <asp:ListItem>5 Year</asp:ListItem>
                                    <asp:ListItem>10 Year</asp:ListItem>
                                    <asp:ListItem>More than</asp:ListItem>
                                </asp:DropDownList>
                        </div>						
                            </div>
                        </asp:Panel>
                        </contenttemplate>
                        </asp:UpdatePanel>
						
						                                               
                        <div class="blockrow">
                            <label>
                                Date Creation:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtDateCreation" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Location:</label>
                            <div class="rightcol">
                                <asp:DropDownList ID="drLocation" runat="server" Width="248px">
                                    <asp:ListItem>Viet Nam</asp:ListItem>
                                    <asp:ListItem>England</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                    <asp:ListItem>China</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Yahoo:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtYahoo" runat="server" CssClass="primary textbox"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Phone:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="primary textbox"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Blog:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtBlog" runat="server" CssClass="primary textbox"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Signature:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtSignature" runat="server" CssClass="primary textbox" TextMode="MultiLine"
                                    Height="55px" Width="434px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                AboutMe:</label>
                            <div class="rightcol">
                                <asp:TextBox ID="txtAboutMe" runat="server" CssClass="primary textbox" TextMode="MultiLine"
                                    Height="55px" Width="434px"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="button"
                            Text="Save"></asp:Button>
                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" CssClass="button"
                            Text="Cancel"></asp:Button>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelUpdateFailure" runat="server">
                <h2 id="h2_3" class="blocksubhead" align="center">
                    Message Forum</h2>
                <asp:Timer id="TimerUpdateFailure" runat="server" OnTick="Timer1_Tick" Interval="1500">
                </asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update Information user failure!<asp:Label ID="lblErrors" runat="server"></asp:Label>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelUpdateSuccessfully" runat="server">
                <h2 id="h2_2" class="blocksubhead" align="center">
                    Message Forum</h2>
                <asp:Timer id="TimerUpdateSuccessfully" runat="server" OnTick="Timer2_Tick" Interval="1000">
                </asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update user <strong>
                            <asp:Label ID="lblUserUpdate" runat="server"></asp:Label>
                        </strong>successfully.
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelAvatar" runat="server">
                <h2 class="blockhead">
                    Edit Avatar</h2>
                <div class="blockbody formcontrols settings_form_border">
                    <h3 class="blocksubhead">
                        Your Current Avatar</h3>
                    <div class="section">
                        <div class="blockrow">
                            <div class="primary">
                                <img title="My Avatar" alt="My Avatar" src="<%=GetAvatar() %>" width="128px" height="128px" />
                            </div>
                        </div>
                    </div>
                    <h3 class="blocksubhead">
                        Custom Avatar</h3>
                    <div class="section">
                        <div id="avatar_yes_deps">
                            <div class="blockrow">
                                <label for="avatarupload">
                                    Upload Image From Your Computer:</label>
                                <div class="rightcol">
                                    <asp:FileUpload ID="uploadAvatar" runat="server"></asp:FileUpload>
                                </div>
                                <p class="description">
                                    Note: The maximum size of your custom image is 1 MB (whichever is smaller).</p>
                                <asp:Label ID="lbnMess" runat="server" Text="" ForeColor="red"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="blockfoot actionbuttons settings_form_border">
                        <div class="group">
                            <asp:Button ID="btnSaveAvater" OnClick="btnSaveAvater_Click" runat="server" CssClass="button"
                                Text="Save"></asp:Button>
                            <asp:Button ID="btnCancelAvatar" OnClick="btnCancelAvater_Click" runat="server" CssClass="button"
                                Text="Cancel"></asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelEditEmailPassword" runat="server">
                <h2 class="blockhead">
                    Edit Email & Password</h2>
                <div class="blockbody formcontrols settings_form_border">
                    <h3 class="blocksubhead">
                        Old Password</h3>
                    <div class="section">
                        <label>
                            Enter your present password to continue:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="primary textbox" TextMode="Password"></asp:TextBox>
                            </div>
                            <p class="description">
                                You must enter your current password if you wish to change your password or email
                                address.</p>
                        </div>
                    </div>
                    <h3 class="blocksubhead">
                        Edit Password (Optional)</h3>
                    <div class="section">
                        <label>
                            New Password:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="primary textbox" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewPassword"
                                    Display="Static" ErrorMessage="The password is not null."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNewPassword"
                                    Display="Static" ErrorMessage="The password is more 6 characters.." ValidationExpression=".{6,}">*</asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="section">
                        <label>
                            Confirm New Password:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="primary textbox"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmNewPassword"
                                    Display="Static" ErrorMessage="The confirm password is not null."></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtNewPassword"
                                    ControlToValidate="txtConfirmNewPassword" Display="Static" ErrorMessage="Password do not match."></asp:CompareValidator>
                            </div>
                            <p class="description">
                                Enter a new password for your user account. Note that passwords are case-sensitive.</p>
                            <asp:Label ID="Label2" runat="server" Text="" ForeColor="red"></asp:Label>
                        </div>
                    </div>
                    <%--begin edit email--%>
                    <h3 class="blocksubhead">
                        Edit Email Address (Optional)</h3>
                    <div class="section">
                        <label>
                            New Email Address:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:TextBox ID="txtNewEmail" runat="server" CssClass="primary textbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The Email is not null."
                                    ControlToValidate="txtNewEmail" Display="Static"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email address is invalid."
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtNewEmail"
                                    Display="Static"></asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtNewEmail"
                                    Display="Static" ErrorMessage="The Email is used." OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                            </div>
                            <asp:Label ID="Label3" runat="server" Text="" ForeColor="red"></asp:Label>
                        </div>
                    </div>
                    <div class="section">
                        <label>
                            Confirm New Email Address:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:TextBox ID="txtConfirmNewEmailAddress" runat="server" CssClass="primary textbox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmNewEmailAddress"
                                    Display="Static" ErrorMessage="The confirm email  is not null."></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewEmail"
                                    ControlToValidate="txtConfirmNewEmailAddress" Display="Static" ErrorMessage="Email is not match."
                                    ToolTip="Email is not match."></asp:CompareValidator>
                            </div>
                            <p class="description">
                                Enter your new email address here. You must be able to receive email sent to this
                                address.</p>
                            <asp:Label ID="Label4" runat="server" Text="" ForeColor="red"></asp:Label>
                        </div>
                    </div>
                    <%--end edit email--%>
                    <div class="blockfoot actionbuttons settings_form_border">
                        <div class="group">
                            <asp:Button ID="btnSaveChangePasswordEmail" OnClick="btnSaveChangePasswordEmail_Click"
                                runat="server" CssClass="button" Text="Save"></asp:Button>
                            <asp:Button ID="btnCancelChangePasswordEmail" OnClick="btnCancelChangePasswordEmail_Click"
                                runat="server" CssClass="button" Text="Cancel"></asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <%--begin profile privacy--%>
            <asp:Panel ID="panelProfilePrivacy" runat="server">
                <h2 class="blockhead">
                    Profile privacy</h2>
                <div class="blockbody formcontrols settings_form_border">
                    <h3 class="blocksubhead">
                        If you would like to restrict the display of some of the blocks on your profile
                        page.</h3>
                    <div class="section">
                        <label>
                            Current:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:Label ID="lblPrivacyStatus" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="section">
                        <label>
                            Change profile privacy:</label>
                        <div class="blockrow">
                            <div class="rightcol">
                                <asp:CheckBox ID="checkBoxPrivate" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="blockfoot actionbuttons settings_form_border">
                        <div class="group">
                            <asp:Button ID="btnChangeProfilePrivacy" OnClick="btnChangeProfilePrivacy_Click"
                                runat="server" CssClass="button" Text="Save"></asp:Button>
                            <asp:Button ID="btnCancelChangeProfilePrivacy" OnClick="btnCancelChangeProfilePrivacy_Click"
                                runat="server" CssClass="button" Text="Cancel"></asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <%--end profile privacy--%>
        </div>
    </div>
</asp:Content>
