<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditMemberProfile.aspx.cs" Inherits="GUI_EditMemberProfile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <ContentTemplate>
            <asp:Panel ID="panelViewAndEditMember" runat="server">
                <asp:HiddenField ID="memberIDHiddend" runat="server" />
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
                            <asp:TextBox ID="txtDateCreation" runat="server" CssClass="primary textbox"></asp:TextBox>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
