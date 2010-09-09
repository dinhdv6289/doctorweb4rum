<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="AddNewForum.aspx.cs" Inherits="GUI_Admin_AddNewForum" Title="Add New Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <contenttemplate>
<asp:Panel id="panelAddNewForum" runat="server"><H2 id="H2_1" class="blocksubhead" align=center>Add New Category</H2>
<DIV class="section">
<DIV class="blockrow">
Category Name: <asp:TextBox id="txtCategoryName" runat="server" CssClass="primary textbox"></asp:TextBox>
 <asp:RequiredFieldValidator id="RequiredFieldValidatortxtCategoryName" runat="server" ErrorMessage="Category Name is required!" ControlToValidate="txtCategoryName"></asp:RequiredFieldValidator>
  </DIV>
  <DIV class="blockrow">Priority:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <asp:TextBox id="txtPriority" runat="server" CssClass="primary textbox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Priority is required!" ControlToValidate="txtPriority"></asp:RequiredFieldValidator> <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="Priority is type Int" ControlToValidate="txtPriority" ValidationExpression="\d*"></asp:RegularExpressionValidator><P class="description">Enter 0 to hide. </P> </DIV><FIELDSET class="blockrow"><asp:Button id="btnAddNew" runat="server" Text="Add New" CssClass="button" OnClick="btnAddNew_Click"></asp:Button> <asp:Button id="btnReset" runat="server" Text="Reset" CssClass="button" OnClick="btnReset_Click"></asp:Button> </FIELDSET> </DIV></asp:Panel> <asp:Panel id="panelMessage" runat="server"><asp:Timer id="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer> <H2 id="H2_2" class="blocksubhead" align=center>Message Forum</H2><DIV class="section"><DIV class="blockrow">Saved Forum <STRONG><asp:Label id="lblForumName" runat="server"></asp:Label> </STRONG>Successfully. </DIV><FIELDSET class="blockrow"></FIELDSET> </DIV></asp:Panel> 
  <asp:Panel id="panelError" runat="server"><H2 id="H2_3" class="blocksubhead" align=center>Message Forum</H2><DIV class="section"><DIV class="blockrow">Insert Category failure! </DIV><FIELDSET class="blockrow"><asp:Button id="btnBack" runat="server" Text="Go Back" CssClass="button" OnClick="btnBack_Click">
                        </asp:Button> </FIELDSET> </DIV></asp:Panel> 
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
