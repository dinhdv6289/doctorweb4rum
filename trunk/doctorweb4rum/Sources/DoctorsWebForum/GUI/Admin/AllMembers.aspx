<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="AllMembers.aspx.cs" Inherits="GUI_Admin_AllMembers" Title="All Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="blocksubhead" align="center" id="ForumManager">
        All Members</h2>
    <div class="threadlist" id="threadlist">
        <div class="threadlisthead table">
            <div>
                <span class="threadstats td">UserName </span><span class="threadstats td">Email</span><span
                    class="threadlastpost td">Date Join</span> <span class="threadstats td">Options</span>
                    <span class="threadstats td">  </span>
            </div>
        </div>
        <asp:Repeater ID="repeaterMembers" runat="server" OnItemCommand="repeaterMembers_ItemCommand">
            <ItemTemplate>
                <ol class="threads" id="threads">
                    <li class="threadbit new">
                        <div class="sticky">
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("UserName") %>
                                </li>
                            </ul>
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("Email") %>
                                </li>
                            </ul>
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("DateCreation") %>
                                </li>
                            </ul>
                            <dl class="threadlastpost td">
                                <dd>
                                    <div class="popupmenu memberaction">
                                        <asp:DropDownList ID="ddlFunctionMember" DataValueField="FunctionID" DataTextField="FunctionName"
                                            DataSource='<%# FillFunctionsToDropDownList() %>' Width="150px" runat="server">
                                        </asp:DropDownList>
                                        <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="button" CommandName="Continue"
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
</asp:Content>
