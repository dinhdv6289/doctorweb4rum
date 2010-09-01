<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewReplyWithQuote.aspx.cs" Inherits="GUI_NewReplyWithQuote" Title="Untitled Page" %>

<%@ Register Assembly="obout_Editor" Namespace="OboutInc.Editor" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <strong>New Reply</strong>
    <div class="vbform block">
        <h2 class="blockhead">
            Preview</h2>
        <div class="blockbody postpreview">
            <blockquote class="blockrow postcontent restore preview postcontainer forumcontent"
                id="yui-gen20">
                <div class="bbcode_container">
                    <div class="bbcode_quote">
                        <div class="quote_container">
                            <div class="bbcode_quote_container">
                            </div>
                            <div class="bbcode_postedby">
                                <img alt="Quote" src="Images/quote_icon.png" title="Quote">Originally Posted by <strong><%=OriginallyPostedBy() %></strong>
                            </div>
                            <div class="message">
                                <%= GetContent()%>
                             </div>
                        </div>
                    </div>
                </div>
            </blockquote>
            <!-- attachments -->
            <blockquote class="blockrow signature restore preview">
            </blockquote>
            <!-- / attachments -->
        </div>
       
        <h2 class="blockhead">
            Errors Message</h2>
        <div class="blockbody postpreview">
            <blockquote class="blockrow postcontent restore preview postcontainer forumcontent"
                id="Blockquote1">
                <div class="bbcode_container">
                    <asp:Label ID="lblErrors" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </blockquote>
        </div>
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">
                <div class="blockrow">
                    <div style="padding: 10px;">
                        <li></li>
                    </div>
                </div>
                <div class="blockrow texteditor" id="vB_Editor_001">
                    <!-- / Editor Scripts -->
                    <obout:Editor ID="Editor1" runat="server" PreviewMode="true" FixedToolBar="false">
                    </obout:Editor>
                </div>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="btnSubmitNewReply" runat="server" Text="Submit New Reply" CssClass="button"
                    OnClick="btnSubmitNewReply_Click" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />&nbsp;
            </div>
        </div>
        <div class="blockfoot actionbuttons">
        </div>
    </div>
</asp:Content>
