<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="GUI_Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="threadlist" id="threadlist">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <contenttemplate>
<asp:Panel id="repeaterForumsPanel" runat="server"><asp:Repeater id="repeaterForums" runat="server" OnItemCreated="repeaterForums_ItemCreated" OnItemCommand="repeaterForums_ItemCommand" OnItemDataBound="repeaterForums_ItemDataBound">
                <ItemTemplate>
                    <div class="threadlisthead table">
                        <div>
                            <span class="threadinfo">Forum </span><span class="threadstats td">Order</span><span class="threadlastpost td">Controls</span>
                        </div>
                    </div>
                    <ol class="threads" id="threads">
                        <li class="threadbit new">
                            <div class="sticky">
                                <div title="" class="threadinfo">
                                    <div class="inner">
                                        <h3>
                                            &nbsp;&nbsp; <a id="thread_title_1907333" href="" class="title threadtitle_unread">
                                                <%#Eval("CategoryName") %>
                                            </a>
                                        </h3>
                                    </div>
                                </div>
                                <ul class="threadstats td alt">
                                        	<li><asp:TextBox ID="txtPriorityCategory" runat="server" Width="50px"  CssClass="primary textbox" Text='<%#Eval("Priority") %>'></asp:TextBox></li>
                                </ul>
                                <dl class="threadlastpost td">
                                    <dd>
                                        <div class="popupmenu memberaction">
                                            <asp:DropDownList ID="ddlFunctionForum"  DataValueField="FunctionID" DataTextField="FunctionName"  DataSource='<%# FillFunctionsForumToDropDownList() %>' Width="100px"	runat="server" ></asp:DropDownList>
                                            <asp:Button ID="btnInForumContinue" runat="server" Text="Continue" class="button" CommandName="ForumContinue" CommandArgument='<%# Eval("CategoryID") %>' />
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            <asp:Repeater ID="repeaterSubForums" runat="server" DataSource='<%#GetAllSubForumsByCategoryID(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "CategoryID"))) %>'>
                                <ItemTemplate>
                                    <div class="nonsticky">
                                        <div class="threadinfo" title="">
                                            <div class="inner">
                                                <h3>
                                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;----&nbsp;&nbsp;<a class="title threadtitle_unread"
                                                        href="" ><%# Eval("SubForumName")%>
                                                    </a>
                                                </h3>
                                            </div>
                                        </div>
                                        <ul class="threadstats td alt">
                                        	<li><asp:TextBox ID="txtPrioritySubForum" runat="server" Width="50px"  CssClass="primary textbox" Text='<%#Eval("Priority") %>'></asp:TextBox></li>
                                </ul>
                                        <dl class="threadlastpost td">
                                            <dd>
                                                <div class="popupmenu memberaction">
                                                <asp:DropDownList ID="ddlFunctionSubForum"  DataValueField="FunctionID" DataTextField="FunctionName"  DataSource='<%# FillFunctionsSubForumToDropDownList() %>' Width="100px" 	runat="server"></asp:DropDownList>
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
            </asp:Repeater> <%--end repeater 1--%><DIV class="blockfoot actionbuttons settings_form_border"><DIV class="group"><asp:Button id="btnAddNewForum" class="button" runat="server" Text="Add New Forum"></asp:Button> </DIV></DIV></asp:Panel>
             <asp:Panel id="editForumPanel" runat="server"><asp:Repeater id="repeaterEditForum" runat="server" OnItemCommand="repeaterEditForum_ItemCommand">
                <ItemTemplate>
            <div class="threadlist">
                            <div class="threadlisthead table">
                        <div>
                            <span class="threadinfo">Forum '<%#Eval("CategoryName")%>'</span>
                        </div>
                    </div>
                    <div class="threads">
                               <div class="blockrow">
                    <label>
                        Forum Name:</label>
                    <div class="rightcol">
                        <asp:TextBox ID="txtForumName" runat="server" CssClass="primary textbox" Text='<%#Eval("CategoryName") %>'></asp:TextBox>
                        </div>
                    </div>
                    </div>
                    </div>
                     <div class="blockfoot actionbuttons settings_form_border">
        <div class="group">
            <asp:Button ID="btnSaveEditForum" runat="server" Text="Save" class="button" CommandName="SaveEdit" CommandArgument='<%#Eval("CategoryID") %>'/>
            <asp:Button ID="btnResetEditForum" runat="server" Text="Reset" class="button" CommandName="ResetEdit" CommandArgument='<%#Eval("CategoryID") %>'/>
        </div>
        
    </div>
                   </ItemTemplate>
            </asp:Repeater> </asp:Panel>
            
              <asp:Panel id="editSubForumPanel" runat="server">
              <asp:Repeater id="repeaterEditSubForum" runat="server" OnItemCommand="repeaterEditSubForum_ItemCommand">
                <ItemTemplate>
            <div class="threadlist">
                            <div class="threadlisthead table">
                        <div>
                            <span class="threadinfo">SubForum: '<%#Eval("SubForumName") %>'</span>
                        </div>
                    </div>
                    <div class="threads">
                               <div class="blockrow">
                    <label>
                        SubForum Name:</label>
                    <div class="rightcol">
                        <asp:TextBox ID="txtSubForumName" runat="server" CssClass="primary textbox" Text='<%#Eval("SubForumName") %>'></asp:TextBox>
                        </div>
                    </div>
                     <div class="blockrow">
                    <label>
                        Description:</label>
                    <div class="rightcol">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Text='<%#Eval("Description") %>' Width="300px" Height="86px"></asp:TextBox>
                        </div>
                    </div>
                    </div>
                    </div>
                     <div class="blockfoot actionbuttons settings_form_border">
        <div class="group">
            <asp:Button ID="btnSaveEditSubForum" runat="server" Text="Save" class="button" CommandName="SaveEdit" CommandArgument='<%#Eval("SubForumID") %>'/>
            <asp:Button ID="btnResetEditSubForum" runat="server" Text="Reset" class="button" CommandName="ResetEdit" CommandArgument='<%#Eval("SubForumID") %>'/>
        </div>
        
    </div>
                   </ItemTemplate>
            </asp:Repeater> </asp:Panel>  
</contenttemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
