<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="BanUser.aspx.cs" Inherits="GUI_Admin_BanUser" Title="Ban User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <contenttemplate>
<asp:Panel id="panelBanUser" runat="server">
                <h2 class="blocksubhead" align="center" id="H2_1">
                    Ban User</h2>
                <div class="section">
                    <div class="blockrow">
                        <label for="showbirthday">
                            UserName:</label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="primary textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName" ErrorMessage="UserName is required" ></asp:RequiredFieldValidator>
                    </div>
                    <fieldset class="blockrow">
                        <asp:Button ID="btnBan" runat="server" Text="Ban User" CssClass="button" OnClick="btnBan_Click" />
                    </fieldset>
                </div>
            </asp:Panel> <asp:Panel id="panelMessage" runat="server">
                <h2 id="H2_2" class="blocksubhead" align="center">
                    Message Forum</h2>
                    <asp:Timer id="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        User <strong><asp:Label ID="lblUserBan" runat="server"></asp:Label> </strong> has been banned until everlasting.
                    </div>
                    <fieldset class="blockrow">
                       
                    </fieldset>
                </div>
            </asp:Panel> <asp:Panel id="panelError" runat="server"><H2 id="H2_4" class="blocksubhead" align=center>Message Forum</H2><DIV class="section"><DIV class="blockrow">Ban User failure! </DIV><FIELDSET class="blockrow"><asp:Button id="btnErrorGoBack" runat="server" CssClass="button" Text="Go Back" OnClick="btnErrorGoBack_Click">
                        </asp:Button> </FIELDSET> </DIV></asp:Panel> <asp:Panel id="panelInvalidUserSpecified" runat="server">
            <H2 id="H2_3" class="blocksubhead" align=center>Message Forum</H2><DIV class="section"><DIV class="blockrow">Invalid User Specified </DIV><FIELDSET class="blockrow"><asp:Button id="btnBack" runat="server" CssClass="button" Text="Go Back" OnClick="btnBack_Click">
                        </asp:Button> </FIELDSET> </DIV></asp:Panel> 
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
