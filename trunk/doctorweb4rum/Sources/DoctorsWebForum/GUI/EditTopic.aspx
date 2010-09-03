<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditTopic.aspx.cs" Inherits="GUI_EditTopic" Title="Untitled Page" %>

<%@ Register Assembly="obout_Editor" Namespace="OboutInc.Editor" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="pagetitle">
        <h1>
        </h1>
        <p class="description">
           Edit Topic </p>
    </div>
    <br />

    <div class="vbform block">
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">
                <div class="blockrow">
                    <label for="titlefield">
                        Title:</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="primary full textbox"></asp:TextBox>
                </div>
                <div class="blockrow texteditor" >
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
