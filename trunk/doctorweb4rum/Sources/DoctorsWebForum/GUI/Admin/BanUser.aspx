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
        </div>
        <fieldset class="blockrow">
            <ul class="group">
                <li>
                    <label for="aim">
                        .</label>
                    <asp:Button ID="btnBan" runat="server" Text="Ban User" CssClass="button" OnClick="btnBan_Click" />
                </li>
            </ul>
        </fieldset>
    </div>
    </asp:Panel> 
    
    <asp:Panel id="panelMessage" runat="server"><H2 id="H2_2" class="blocksubhead" align=center>Message from Forum</H2><DIV class="section"><DIV class="blockrow"><LABEL for="showbirthday">User has been banned until everlasting. </LABEL></DIV><FIELDSET class="blockrow"><UL class="group"><LI><asp:Button id="btnRediect" runat="server" CssClass="button" Text="Done" OnClick="btnRediect_Click"></asp:Button> </LI></UL></FIELDSET> </DIV></asp:Panel> 
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
