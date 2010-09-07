<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true" CodeFile="BannedUsers.aspx.cs" Inherits="GUI_Admin_BannedUsers" Title="Banned Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <contenttemplate>
<asp:Panel id="panelBanedUsers" runat="server">
    <h2 class="blocksubhead" align="center" id="ForumManager">
        Banned Users</h2>
    <div class="threadlist" id="threadlist">
        <div class="threadlisthead table">
            <div>
                <span class="threadinfo">UserName </span><span class="threadstats td">Ban Lift</span>
            </div>
        </div>
        <asp:Repeater ID="repeaterBannedUser" runat="server" OnItemCommand="repeaterBannedUser_ItemCommand" >
            <ItemTemplate>
                <ol class="threads" id="threads">
                    <li class="threadbit new">
                        <div class="sticky">
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("UserName") %>
                                </li>
                            </ul>
                            <dl class="threadlastpost td">
                                <dd>
                                    <div class="popupmenu memberaction">
                                        <asp:Button ID="btnBanLift" runat="server" Text="Ban Lift" CssClass="button" CommandName="BanLift"
                                            CommandArgument='<%# Eval("MemberID") %>' />
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </li>
                </ol>
            </ItemTemplate>
        </asp:Repeater>
        <%--end repeater 1--%>
    </div>
    </asp:Panel> <asp:Panel id="panelMessage" runat="server"><H2 id="H2_2" class="blocksubhead" align=center>Message from Forum</H2><DIV class="section"><DIV class="blockrow"><LABEL for="showbirthday">Are you sure you want to lift the ban on <asp:Label ID="lblUserName" runat="server"></asp:Label>? </LABEL></DIV><FIELDSET class="blockrow"><UL class="group"><LI><asp:Button id="btnOk" runat="server" CssClass="button" Text="Ok" OnClick="btnOk_Click"></asp:Button> </LI><LI><asp:Button id="btnCanccel" runat="server" CssClass="button" Text="Cancel" OnClick="btnCanccel_Click"></asp:Button> </LI></UL></FIELDSET> </DIV></asp:Panel> 
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>


