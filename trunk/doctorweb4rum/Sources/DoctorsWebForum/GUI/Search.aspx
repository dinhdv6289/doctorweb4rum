<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="GUI_Search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
    $(function() {
		$("#<%= txtFromDateCreate.ClientID %>").datepicker();
		$("#<%= txtToDateCreate.ClientID %>").datepicker();
	});
    </script>

    <div id="breadcrumb" class="breadcrumb">
        <hr />
    </div>
    <h2 class="blockhead">
        Advance Search</h2>

    <div class="blockbody formcontrols">
            <h3 class="blocksubhead">
            The following errors occurred with your search</h3>
        <div class="section">
            <div class="blockrow">
            <asp:Label ID="lblErrors" runat="server"></asp:Label>
                <label>
                    </label>
            </div>
        </div>
        <h3 class="blocksubhead">
            Search In</h3>
        <div class="section">
            <div class="blockrow">
                <label>
                    Search Types:</label>
            </div>
        </div>
        <h3 class="blocksubhead">
            Search For</h3>
        <div class="section">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="blockrow">
                        <label>
                            Search in:</label>
                        <ul class="multifield group">
                            <li>
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="248px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False">
                                </asp:DropDownList>
                            </li>
                        </ul>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="blockrow">
                <label>
                    Keyword(s):</label>
                <ul class="multifield group">
                    <li>
                        <asp:TextBox ID="txtKeySearch" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label>
                    User Name:</label>
                <ul class="multifield group">
                    <li>
                        <asp:TextBox ID="txtKeyUserName" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label for="searchdate">
                    Find Posts</label>
                <ul class="multifield group">
                    <li>
                        <asp:TextBox ID="txtFromDateCreate" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                    <li>
                        <asp:TextBox ID="txtToDateCreate" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                </ul>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="Button1" runat="server" Text="Search now" CssClass="button" OnClick="Button1_Click" />
                
            </div>
        </div>
    </div>
    
</asp:Content>
