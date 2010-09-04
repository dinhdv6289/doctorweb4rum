<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="GUI_Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="threadlist" id="threadlist">
        <div>
            <asp:Repeater ID="repeaterForums" runat="server" OnItemDataBound="repeaterForums_ItemDataBound" OnItemCommand="repeaterForums_ItemCommand" OnItemCreated="repeaterForums_ItemCreated">
                <ItemTemplate>
                    <div class="threadlisthead table">
                        <div>
                            <span class="threadinfo">Forum </span><span class="threadlastpost td">Controls</span>
                        </div>
                    </div>
                    <ol class="threads" id="threads">
                        <li id="thread_1907333" class="threadbit new">
                            <div class="rating4 nonsticky">
                                <div title="" class="threadinfo">
                                    <div class="inner">
                                        <h3>
                                            &nbsp;&nbsp; <a id="thread_title_1907333" href="" class="title threadtitle_unread">
                                                <%#Eval("CategoryName") %>
                                            </a>
                                        </h3>
                                    </div>
                                    <!-- iconinfo -->
                                    <div class="threaddetails td">
                                        <div class="threaddetailicons">
                                        </div>
                                    </div>
                                </div>
                                <dl class="threadlastpost td">
                                    <dd>
                                        <div class="popupmenu memberaction">
                                            <asp:DropDownList ID="ddlFunctionForum"  DataValueField="FunctionID" DataTextField="FunctionName"  DataSource='<%# FillFunctionsForumToDropDownList() %>' CssClass="button"	runat="server" ></asp:DropDownList>
                                            <asp:Button ID="btnInForumContinue" runat="server" Text="Continue" class="button" CommandName="ForumContinue" CommandArgument='<%# Eval("CategoryID") %>' />
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            <asp:Repeater ID="repeaterSubForums" runat="server" DataSource='<%#GetAllSubForumsByCategoryID(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "CategoryID"))) %>'>
                                <ItemTemplate>
                                    <div class="rating4 nonsticky">
                                        <div class="threadinfo" title="">
                                            <div class="inner">
                                                <h3>
                                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;----&nbsp;&nbsp;<a class="title threadtitle_unread"
                                                        href="" ><%# Eval("SubForumName")%>
                                                    </a>
                                                </h3>
                                            </div>
                                            <!-- iconinfo -->
                                            <div class="threaddetails td">
                                                <div class="threaddetailicons">
                                                </div>
                                            </div>
                                        </div>
                                        <dl class="threadlastpost td">
                                            <dd>
                                                <div class="popupmenu memberaction">
                                                <asp:DropDownList ID="ddlFunctionSubForum"  DataValueField="FunctionID" DataTextField="FunctionName"  DataSource='<%# FillFunctionsSubForumToDropDownList() %>' CssClass="button"	runat="server"></asp:DropDownList>
                                                    <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="button" CommandName="Continue" CommandArgument='<%# Eval("SubForumID") %>'/>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </li>
                    </ol>
                </ItemTemplate>
            </asp:Repeater>
            <%--end repeater 1--%>
        </div>
    </div>
    <div class="blockfoot actionbuttons settings_form_border">
        <div class="group">
            <asp:Button ID="btnAddNewForum" runat="server" Text="Add New Forum" class="button" />
        </div>
    </div>
</asp:Content>
