<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="EditForum.aspx.cs" Inherits="GUI_Admin_EditForum" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
aaaaa<br />
    <table style="width: 562px; height: 149px">
        <tr>
            <td align="center" colspan="2" style="height: 27px">
                Update Forum</td>
        </tr>
        <tr>
            <td style="width: 237px; height: 2px">
                CategoryName :</td>
            <td style="height: 2px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 237px">
                Priority :</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 237px; height: 15px">
                DateCreation :</td>
            <td style="height: 15px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="height: 15px">
                <asp:Button ID="Button1" runat="server" Text="Save" Width="53px" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Cancel" /></td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

