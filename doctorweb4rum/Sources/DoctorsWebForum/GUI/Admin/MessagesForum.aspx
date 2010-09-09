<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="MessagesForum.aspx.cs" Inherits="GUI_Admin_MessagesForum" Title="Message Forum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="standard_error">
        <h2 class="blockhead">
           Message Forum </h2>
        <div class="blockbody formcontrols">
            <div class="blockrow restore">
                You have entered an invalid username or password. Please press the back button, enter the correct details and try again. Don't forget that the password is case sensitive. 
                <ul>
                    <li></li>
                    <li><a href="../Index.aspx">Go to forums index</a></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

