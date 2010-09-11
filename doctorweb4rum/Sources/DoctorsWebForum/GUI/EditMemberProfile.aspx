<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditMemberProfile.aspx.cs" Inherits="GUI_EditMemberProfile" Title="Edit Member Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="usercp_nav">
        <div class="block">
            <h2 class="blockhead">
                My Settings</h2>
            <div class="blockbody">
                <ul>
                    <li>
                        <h3 class="blocksubhead profile">
                            <img border="0" alt="My Profile" src="Images/profile.png" class="usercpimage" title="My Profile">
                            My Profile</h3>
                        <ul class="blockrow">
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditProfile" runat="server">Edit Profile</asp:LinkButton></li>
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditAvatar" runat="server">Edit Avatar</asp:LinkButton></li>
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditSignature" runat="server">Edit Signature</asp:LinkButton></li>
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonProfilePrivacy" runat="server">Profile Privacy</asp:LinkButton></li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="blocksubhead">
                            <img border="0" alt="My Account" src="Images/account.png" class="usercpimage" title="My Account">
                            My Account</h3>
                        <ul class="blockrow">
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonEditEmailPassword" runat="server">Edit Email &amp; Password</asp:LinkButton></li>
                            <li class="inactive">
                                <asp:LinkButton ID="linkButtonGeneralSetting" runat="server">General Settings</asp:LinkButton></li>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
                <contenttemplate>
            <asp:Panel ID="panelViewAndEditMember" runat="server">
                <h2 class="blockhead">Edit Profile</h2>
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
                        <br />
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
                            Avatar:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtAvatar" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>
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
                            Email:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="primary textbox"></asp:TextBox>
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
                    <div class="blockrow">
                        <label>
                            Date Creation:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtDateCreation" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                    <div class="blockrow">
                        <label>
                            Professional:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtProfessional" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>
                    </div>
                    <div class="blockrow">
                        <label>
                            Experience:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtExperience" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>
                    </div>
                    <div class="blockrow">
                        <label>
                            Country:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtCountry" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>
                    </div>
                    <div class="blockrow">
                        <label>
                            Address:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="primary textbox"></asp:TextBox>
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
                            Hospital:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtHospital" runat="server" CssClass="primary textbox"></asp:TextBox>
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
                            <asp:TextBox ID="txtSignature" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>
                    </div>
                    <div class="blockrow">
                        <label>
                            AboutMe:</label>
                        <div class="rightcol">
                            <asp:TextBox ID="txtAboutMe" runat="server" CssClass="primary textbox"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Save" OnClick="btnSave_Click">
                    </asp:Button>
                    <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel" OnClick="btnCancel_Click">
                    </asp:Button>
                </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelUpdateFailure" runat="server">
                <h2 id="H2_3" class="blocksubhead" align="center">
                    Message Forum</h2>
                <asp:Timer ID="TimerUpdateFailure" runat="server" Interval="1500" OnTick="Timer1_Tick">
                </asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update Information user failure!
                    </div>
                    <fieldset class="blockrow">
                    </fieldset>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelUpdateSuccessfully" runat="server">
                <h2 id="H2_2" class="blocksubhead" align="center">
                    Message Forum</h2>
                <asp:Timer ID="TimerUpdateSuccessfully" runat="server" Interval="1000" OnTick="Timer2_Tick">
                </asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update user <strong>
                            <asp:Label ID="lblUserUpdate" runat="server"></asp:Label>
                        </strong>successfully.
                    </div>
                    <fieldset class="blockrow">
                    </fieldset>
                </div>
                
            </asp:Panel>
        </contenttemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
