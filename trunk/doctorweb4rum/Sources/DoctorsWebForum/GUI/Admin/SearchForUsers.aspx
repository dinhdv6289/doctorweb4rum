<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="SearchForUsers.aspx.cs" Inherits="GUI_Admin_SearchForUsers" Title="Search for Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2 class="blocksubhead" align="center" id="ForumManager">
            Quick Search</h2>
        <div class="section">
            <div class="blockrow">
                <label for="bd_month">
                    <a href="AllMembers.aspx">All Members</a></label>
                <label for="bd_month">
                    All Authors</label>
            </div>
        </div>
    </div>
    <br />
    <h2 class="blocksubhead" align="center" id="H2_1">
        Search Details</h2>
    <div class="section">
        <div class="blockrow">
            <label for="showbirthday">
                UserName:</label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="primary textbox"></asp:TextBox>
        </div>
        <div class="blockrow">
            <label for="tb_homepage">
                Role:</label>
            <asp:DropDownList ID="dropdownlistRoles" runat="server">
            </asp:DropDownList>
        </div>
        <fieldset class="blockrow">
            <legend>Instant Messaging</legend>
            <ul class="group">
                <li>
                    <label for="icq">
                        Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="primary textbox"></asp:TextBox>
                </li>
                <li>
                    <label for="aim">
                        Yahoo:</label>
                    <asp:TextBox ID="txtYahoo" runat="server" CssClass="primary textbox"></asp:TextBox>
                </li>
                <li>
                    <label for="aim">
                        .</label>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" />
                </li>
            </ul>
        </fieldset>
    </div>
    <div>
    </div>
</asp:Content>
