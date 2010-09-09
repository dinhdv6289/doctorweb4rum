<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="SearchForUsers.aspx.cs" Inherits="GUI_Admin_SearchForUsers" Title="Search for Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <contenttemplate>
<asp:Panel id="panelQuickSearch" runat="server"><DIV><H2 id="ForumManager" class="blocksubhead" align=center>Quick Search</H2><DIV class="section"><DIV class="blockrow"><LABEL for="bd_month"><A href="AllMembers.aspx">All Members</A></LABEL> <LABEL for="bd_month">All Authors</LABEL> </DIV></DIV></DIV><BR /><H2 id="H2_1" class="blocksubhead" align=center>Search Details</H2><DIV class="section"><DIV class="blockrow"><LABEL for="showbirthday">UserName:</LABEL> <asp:TextBox id="txtUserNameSearch" runat="server" CssClass="primary textbox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNameSearch" ErrorMessage="UserName is required."></asp:RequiredFieldValidator> </DIV><%--        <div class="blockrow">
            <label for="tb_homepage">
                Role:</label>
            <asp:DropDownList ID="dropdownlistRoles" runat="server">
            </asp:DropDownList>
        </div>--%><asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" CssClass="button" Text="Search"></asp:Button> <%--        <fieldset class="blockrow">
            <legend>Instant Messaging</legend>
            <ul class="group">
                <li>
                    <label for="icq">
                        Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="primary textbox"></asp:TextBox>
                </li>
                <li>
                    <label for="aim">
                        Yahoo:</label>
                    <asp:TextBox ID="txtYahoo" runat="server" CssClass="primary textbox"></asp:TextBox>
                </li>
                <li>
                    <label for="aim">
                        .</label>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" />
                </li>
            </ul>
        </fieldset>--%></DIV><DIV></DIV></asp:Panel>
         <asp:Panel id="panelSearchResult" runat="server">
        <!-- start if customfields --><H3 class="blocksubhead">Role</H3><DIV class="section"><DIV class="blockrow"><LABEL>User Group forum:</LABEL> <DIV class="rightcol"><asp:Label id="lblRoleGroup" runat="server"></asp:Label> </DIV><LABEL>Change Role:</LABEL> <DIV class="rightcol"><asp:DropDownList id="dropDownListRole" runat="server">
                </asp:DropDownList> </DIV></DIV></DIV>
                <H3 class="blocksubhead">Profile</H3>
                <DIV class="section">
                <DIV class="blockrow">
                <LABEL>UserName:</LABEL> 
                <asp:TextBox id="txtUserName" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV>
                <DIV class="blockrow"><LABEL>Birthday:</LABEL> 
                <DIV class="rightcol"><asp:TextBox id="txtBirthday" runat="server" CssClass="primary textbox"></asp:TextBox>
                 </DIV></DIV>
                 <DIV class="blockrow"><LABEL>Email:</LABEL> 
                 <DIV class="rightcol"><asp:TextBox id="txtEmail" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                 <DIV class="blockrow"><LABEL>Full Name:</LABEL> <DIV class="rightcol">
                 <asp:TextBox id="txtFullName" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                 <DIV class="blockrow"><LABEL>Gender:</LABEL>
                  <DIV class="rightcol"><asp:Label id="lblGender" runat="server" Enabled="False"></asp:Label> </DIV></DIV>
                  <DIV class="blockrow"><LABEL>Date Creation:</LABEL> 
                  <DIV class="rightcol"><asp:TextBox id="txtDateCreation" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                  <DIV class="blockrow"><LABEL>Professional:</LABEL>
                   <DIV class="rightcol"><asp:TextBox id="txtProfessional" runat="server" CssClass="primary textbox" ></asp:TextBox> </DIV></DIV>
                   <DIV class="blockrow"><LABEL>Experience:</LABEL>
                    <DIV class="rightcol"><asp:TextBox id="txtExperience" runat="server" CssClass="primary textbox"></asp:TextBox> </DIV></DIV>
                    <DIV class="blockrow"><LABEL>Country:</LABEL>
                     <DIV class="rightcol"><asp:TextBox id="txtCountry" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                     <DIV class="blockrow"><LABEL>Address:</LABEL>
                      <DIV class="rightcol"><asp:TextBox id="txtAddress" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                      <DIV class="blockrow"><LABEL>Yahoo:</LABEL>
                       <DIV class="rightcol"><asp:TextBox id="txtYahoo" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                       <DIV class="blockrow"><LABEL>Phone:</LABEL>
                        <DIV class="rightcol"><asp:TextBox id="txtPhone" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                        <DIV class="blockrow"><LABEL>Hospital:</LABEL>
                         <DIV class="rightcol"><asp:TextBox id="txtHospital" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                         <DIV class="blockrow"><LABEL>Blog:</LABEL>
                          <DIV class="rightcol"><asp:TextBox id="txtBlog" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV></DIV>
                          <DIV class="blockrow"><LABEL>Signature:</LABEL>
                           <DIV class="rightcol"><asp:TextBox id="txtSignature" runat="server" CssClass="primary textbox" TextMode="MultiLine"></asp:TextBox> </DIV></DIV>
                           <DIV class="blockrow"><LABEL>AboutMe:</LABEL>
                            <DIV class="rightcol"><asp:TextBox id="txtAboutMe" runat="server" CssClass="primary textbox"  TextMode="MultiLine"></asp:TextBox> </DIV></DIV>
                            <asp:Button id="btnSave" runat="server" CssClass="button" Text="Save" OnClick="btnSave_Click"></asp:Button>
                             <asp:Button id="btnCancel" runat="server" CssClass="button" Text="Cancel" OnClick="btnCancel_Click"></asp:Button> </DIV>
                             </asp:Panel> 
                             <asp:Panel id="panelMessage" runat="server"><H2 id="H2_2" class="blocksubhead" align=center>Message Forum</H2><DIV class="section"><DIV class="blockrow">Not find user <asp:Label id="lblUserNameNotFound" runat="server">
    </asp:Label> </DIV><FIELDSET class="blockrow"><asp:Button id="btnGoBack" runat="server" CssClass="button" Text="Go Back" OnClick="btnGoBack_Click">
    </asp:Button> </FIELDSET> </DIV></asp:Panel> 
    
    <asp:Panel id="panelUpdateFailure" runat="server">
                <h2 id="H2_3" class="blocksubhead" align="center">
                    Message Forum</h2>
                    <asp:Timer id="Timer1" runat="server" Interval="1500" OnTick="Timer1_Tick"></asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update Information user failure!
                    </div>
                    <fieldset class="blockrow">
                       
                    </fieldset>
                </div>
            </asp:Panel>
</contenttemplate>
    </asp:UpdatePanel>
    <!-- end if custom fields -->
</asp:Content>
