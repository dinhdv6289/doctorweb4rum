<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="NewReplyToPost.aspx.cs" Inherits="GUI_NewReplyToPost" Title="Untitled Page" %>
<%@ Register Assembly="obout_Editor" Namespace="OboutInc.Editor" TagPrefix="obout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <br />
        <div class="vbform block">
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">

                <div class="blockrow">
                    <div style="padding: 10px;">
                        
                        <li>
                        </li>
                    </div>
                </div>

                <div class="blockrow texteditor">

                    <!-- / Editor Scripts -->
                     <obout:Editor ID="Editor1" runat="server" PreviewMode="true" FixedToolbar="false">
                    </obout:Editor>
                </div>
                
                
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="btnSubmitNewReply" runat="server" Text="Submit New Reply" CssClass="button" OnClick="btnSubmitNewReply_Click" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />&nbsp;
                
            </div>
        </div>
        </div>
        
<br />
    <div class="vbform block">
        <ol id="forums" class="floatcontainer">
            <li class="forumbit_nopost L1">
                <div class="module">
                    <div class="header" style="width:102.7%;">
                        <h2>
                            <span class="forumtitle">Topic Review (Newest First) </span>
                        </h2>
                    </div>
                    <ol class="childforum" id="c_cat4">
                        <%--begin repeater post--%>
                        <asp:Repeater ID="repeaterNewestFirstPost" runat="server">
                            <ItemTemplate>
                                <li  class="postbit blockrow">
                                    <div>
                                        <div class="datetime">
                                            <%#Eval("DateCreationOfPosts")%>
                                        </div>
                                        <span class="username">
                                            <%#Eval("UserName") %>
                                        </span>
                                    </div>
                                    <div class="content">
                                        <%#GetQuote(Convert.ToInt32(Eval("QuoteID"))) %>
                                        <%#Eval("Content") %>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ol>
                </div>
            </li>
        </ol>
    </div>
    <%--end repeater post--%>        
</asp:Content>
