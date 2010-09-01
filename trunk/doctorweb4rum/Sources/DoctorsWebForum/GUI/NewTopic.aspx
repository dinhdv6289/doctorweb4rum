<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewTopic.aspx.cs" Inherits="GUI_NewTopic" Title="Untitled Page" %>
<%@ Register Assembly="obout_Editor" Namespace="OboutInc.Editor" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <br />
        <div class="vbform block">
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">
            <div class="blockrow">
                    <span class="bold" >The following errors occurred with your New Topic :</span>
                    <div style="padding: 10px;">
                        <span class="bold" style="color: #ff0000;">
                            <asp:Label ID="lblErrors" runat="server" ></asp:Label></span> <br>
                        <br>
                    </div>
                </div>
                <div class="blockrow">
                    You are creating a new thread in <span class="bold"><%= GetSubForumBySubForumID().SubForumName %></span>
                    <div style="padding: 10px;">
                        <span class="bold">Description:</span> <%= GetSubForumBySubForumID().Description %><br>
                        <br>
                        <li>
                            <label for="cb_confirm_forum">
                                <asp:CheckBox ID="checkBoxBelieve" runat="server" />
                                I believe <span class="bold"><%= GetSubForumBySubForumID().SubForumName %></span> is the BEST section for this
                                topic</label>
                        </li>
                    </div>
                </div>
                <div class="blockrow">
                    <label class="full" for="subject">
                        Title:</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="primary full textbox"></asp:TextBox>
                    &nbsp;<img alt="" src="clear.gif" id="display_posticon">
                </div>
                <div class="blockrow texteditor" id="vB_Editor_001">
                    <!-- / Editor Scripts -->
                    <obout:Editor ID="Editor1" runat="server" PreviewMode="true" FixedToolbar="false" >
                    </obout:Editor>
                </div>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="btnSubmitNewTopic" runat="server" Text="Submit New Topic" CssClass="button" OnClick="btnSubmitNewTopic_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />
            </div>
        </div>
        </div>
</asp:Content>
