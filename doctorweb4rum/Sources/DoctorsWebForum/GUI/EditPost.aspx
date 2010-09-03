<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditPost.aspx.cs" Inherits="GUI_EditPost" Title="Untitled Page" %>
<%@ Register Assembly="obout_Editor" Namespace="OboutInc.Editor" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="pagetitle">
        <h1>
        </h1>
        <p class="description">
            Edit Post</p>
    </div>
    <br />
    <div class="vbform block">
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
                <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="button"
                    OnClick="btnSaveChanges_Click" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />&nbsp;
            </div>
        </div>
    </div>
</asp:Content>
