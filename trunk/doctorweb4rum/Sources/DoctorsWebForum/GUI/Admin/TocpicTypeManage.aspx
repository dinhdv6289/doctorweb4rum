<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="TocpicTypeManage.aspx.cs" Inherits="GUI_Admin_TocpicTypeManage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="156px"
        Width="548px" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="ForumName">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Process ">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Add New Forum</asp:ListItem>
                        <asp:ListItem>Edit Forum</asp:ListItem>
                        <asp:ListItem>Delete</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" CommandName="Continue"
                        Text="Continue" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

