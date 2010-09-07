<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true" CodeFile="AddNewForum.aspx.cs" Inherits="GUI_Admin_AddNewForum" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
fghg
    <br />
    <table style="width: 529px; height: 156px">
        <tr>
            <td align="center" colspan="2">
                Add New Forum</td>
        </tr>
        <tr>
            <td style="width: 216px" align="left">
                Title :</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 18px; width: 216px;" align="left">
                CategoryType :</td>
            <td style="height: 18px">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="122px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 216px; height: 18px" align="left">
                Description :</td>
            <td style="height: 18px" align="left">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 216px; height: 18px" align="left">
                DateCreation :</td>
            <td style="height: 18px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="height: 19px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" Width="51px" />
                <asp:Button ID="Button2" runat="server" Text="Cancel" /></td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <EmptyDataTemplate>
            <table style="width: 529px; height: 156px">
                <tr>
                    <td align="center" colspan="2">
                        Add New Forum</td>
                </tr>
                <tr>
                    <td style="width: 216px" align="left">
                        Title :</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="height: 18px; width: 216px;" align="left">
                        CategoryType :</td>
                    <td style="height: 18px">
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="122px">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 216px; height: 18px" align="left">
                        Description :</td>
                    <td style="height: 18px" align="left">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 216px; height: 18px" align="left">
                        DateCreation :</td>
                    <td style="height: 18px">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 19px">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" Width="51px" />
                        <asp:Button ID="Button2" runat="server" Text="Cancel" /></td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>

