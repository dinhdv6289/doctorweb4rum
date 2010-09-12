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
                <label>
                    Professional:</label>
                <ul class="multifield group">
                    <li>
                        <asp:DropDownList ID="drProfessional" runat="server" Width="248px">
                            <asp:ListItem Value="0">--Select Professional--</asp:ListItem>
                            <asp:ListItem>Pre-Medical</asp:ListItem>
                            <asp:ListItem>Veterinarian</asp:ListItem>
                            <asp:ListItem>Dentist</asp:ListItem>
                            <asp:ListItem>Pre-Pharmacy</asp:ListItem>
                            <asp:ListItem>Psychology </asp:ListItem>
                            <asp:ListItem>Optometrist</asp:ListItem>
                            <asp:ListItem>Other Health Professions</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label>
                    Experience:</label>
                <ul class="multifield group">
                    <li>
                        <asp:DropDownList ID="drExperience" runat="server" Width="248px">
                            <asp:ListItem Value="0">--Select Experience--</asp:ListItem>
                            <asp:ListItem>1 Year</asp:ListItem>
                            <asp:ListItem>3 Year</asp:ListItem>
                            <asp:ListItem>5 Year</asp:ListItem>
                            <asp:ListItem>10 Year</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>
            
                        <div class="blockrow">
                <label>
                    Location:</label>
                <ul class="multifield group">
                    <li>
                        <asp:DropDownList ID="drLocation" runat="server" Width="248px">
                            <asp:ListItem Value="0">--Select Location--</asp:ListItem>
                            <asp:ListItem>Viet Nam</asp:ListItem>
                            <asp:ListItem>England</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>China</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>

            <div class="blockrow">
                <label for="searchdate">
                    Find Posts</label>
                <ul class="multifield group">
                    <li>
                        From: <asp:TextBox ID="txtFromDateCreate" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                    <li>
                        To: <asp:TextBox ID="txtToDateCreate" runat="server" CssClass="textbox"></asp:TextBox>
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
