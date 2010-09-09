<%@ Page Language="C#" MasterPageFile="~/GUI/Admin/MasterPage2.master" AutoEventWireup="true"
    CodeFile="AllMembers.aspx.cs" Inherits="GUI_Admin_AllMembers" Title="All Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <contenttemplate>
<asp:Panel id="panelAllMembers" runat="server">
    <h2 class="blocksubhead" align="center" id="ForumManager">
        All Members</h2>
    <div class="threadlist" id="threadlist">
        <div class="threadlisthead table">
            <div>
                <span class="threadstats td">UserName </span><span class="threadstats td">Email</span><span
                    class="threadlastpost td">Date Join</span> <span class="threadstats td">Options</span>
                    <span class="threadstats td">  </span>
            </div>
        </div>
        <asp:Repeater ID="repeaterMembers" runat="server" OnItemCommand="repeaterMembers_ItemCommand">
            <ItemTemplate>
                <ol class="threads" id="threads">
                    <li class="threadbit new">
                        <div class="sticky">
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("UserName") %>
                                </li>
                            </ul>
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("Email") %>
                                </li>
                            </ul>
                            <ul class="threadstats td alt">
                                <li>
                                    <%#Eval("DateCreation") %>
                                </li>
                            </ul>
                            <dl class="threadlastpost td">
                                <dd>
                                    <div class="popupmenu memberaction">
                                        <asp:DropDownList ID="ddlFunctionMember" DataValueField="FunctionID" DataTextField="FunctionName"
                                            DataSource='<%# FillFunctionsToDropDownList() %>' Width="150px" runat="server">
                                        </asp:DropDownList>
                                        <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="button" CommandName="Continue"
                                            CommandArgument='<%# Eval("MemberID") %>' />
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </li>
                </ol>
            </ItemTemplate>
        </asp:Repeater>
        <%--end repeater 1--%>
    </div>
    </asp:Panel>
    
    <asp:Panel id="panelViewAndEditMember" runat="server">
    <asp:HiddenField ID="memberIDHiddend" runat="server"  />
    <!-- start if customfields --><H3 class="blocksubhead">Role</H3><DIV class="section"><DIV class="blockrow"><LABEL>User Group forum:</LABEL> <DIV class="rightcol"><asp:Label id="lblRoleGroup" runat="server"></asp:Label> </DIV>
        <br />
        <LABEL>Change Role:</LABEL> <DIV class="rightcol"><asp:DropDownList id="dropDownListRole" runat="server">
                </asp:DropDownList> </DIV></DIV></DIV>
                <H3 class="blocksubhead">Profile</H3>
                <DIV class="section">
                <DIV class="blockrow">
                <LABEL>UserName:</LABEL> 
                <asp:TextBox id="txtUserName" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> </DIV>
                <DIV class="blockrow"><LABEL>Birthday:</LABEL> 
                <DIV class="rightcol"><asp:TextBox id="txtBirthday" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox>
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
    
        <asp:Panel id="panelUpdateFailure" runat="server">
                <h2 id="H2_3" class="blocksubhead" align="center">
                    Message Forum</h2>
                    <asp:Timer id="TimerUpdateFailure" runat="server" Interval="1500" OnTick="Timer1_Tick"></asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update Information user failure!
                    </div>
                    <fieldset class="blockrow">
                       
                    </fieldset>
                </div>
            </asp:Panel>
            
            <asp:Panel id="panelUpdateSuccessfully" runat="server">
                <h2 id="H2_2" class="blocksubhead" align="center">
                    Message Forum</h2>
                    <asp:Timer id="TimerUpdateSuccessfully" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update user <strong><asp:Label ID="lblUserUpdate" runat="server"></asp:Label> </strong> successfully.
                    </div>
                    <fieldset class="blockrow">
                       
                    </fieldset>
                </div>
            </asp:Panel>
    </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
