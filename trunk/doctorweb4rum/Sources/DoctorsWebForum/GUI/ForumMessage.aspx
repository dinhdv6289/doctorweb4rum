<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="ForumMessage.aspx.cs" Inherits="GUI_ForumMessage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="standard_error">
        <h2 class="blockhead">
            Forum Message</h2>
        <div class="blockbody formcontrols">
            <div class="blockrow restore">
                All cookies cleared!
                <ul>
                    <%--<li><a href="#">Go to forums index</a></li>--%>
                    <li><a href="Index.aspx">Go to forums index</a></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
