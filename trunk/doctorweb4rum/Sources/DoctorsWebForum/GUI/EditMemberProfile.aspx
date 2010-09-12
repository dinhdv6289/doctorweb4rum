<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditMemberProfile.aspx.cs" Inherits="GUI_EditMemberProfile" Title="Edit Member Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <contenttemplate>
<DIV id="usercp_nav">
<DIV class="block"><H2 class="blockhead">My Settings</H2>
<DIV class="blockbody"><UL><LI><H3 class="blocksubhead profile">
<IMG class="usercpimage" title="My Profile" alt="My Profile" src="Images/profile.png" border=0 /> My Profile</H3>
<UL class="blockrow"><LI class="inactive">
<asp:LinkButton id="linkButtonEditProfile" onclick="linkButtonEditProfile_Click" runat="server">Edit Profile</asp:LinkButton> 
</LI><LI class="inactive"><asp:LinkButton id="linkButtonEditAvatar" onclick="linkButtonEditAvatar_Click" runat="server">Edit Avatar</asp:LinkButton> 
</LI><LI class="inactive"><asp:LinkButton id="linkButtonEditSignature" runat="server">Edit Signature</asp:LinkButton></LI>
<LI class="inactive"><asp:LinkButton id="linkButtonProfilePrivacy" runat="server">Profile Privacy</asp:LinkButton></LI></UL></LI>
<LI><H3 class="blocksubhead"><IMG class="usercpimage" title="My Account" alt="My Account" src="Images/account.png" border=0 /> My Account</H3>
<UL class="blockrow"><LI class="inactive"><asp:LinkButton id="linkButtonEditEmailPassword" runat="server">Edit Email &amp; Password</asp:LinkButton>
 </LI>
 <LI class="inactive"><asp:LinkButton id="linkButtonGeneralSetting" runat="server">General Settings</asp:LinkButton></LI></UL></LI>
 <LI><H4 class="blocksubhead"></H4></LI></UL></DIV></DIV></DIV>
 <DIV id="usercp_content">
 <DIV class="cp_content">
 <asp:Panel id="panelViewAndEditMember" runat="server">
<h2 class="blockhead">Edit Profile</h2><div class="blockbody formcontrols settings_form_border">
<!-- start if customfields -->
<h3 class="blocksubhead">Role</h3>
<div class="section">
<div class="blockrow">
<label>User Group forum:</label> 
<div class="rightcol"><asp:Label id="lblRoleGroup" runat="server"></asp:Label>
 </div>
 </div>
 </div>
 <h3 class="blocksubhead">Profile</h3>
 <div class="section">
 <div class="blockrow">
 <label>UserName:</label> 
 <asp:TextBox id="txtUserName" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox> 
 </div>
<div class="blockrow"><label>Birthday:</label>
  <div class="rightcol"><asp:TextBox id="txtBirthday" runat="server" CssClass="primary textbox"></asp:TextBox> 
  </div></div><div class="blockrow"><label>Email:</label>
   <div class="rightcol">
  <asp:TextBox id="txtEmail" runat="server" CssClass="primary textbox"></asp:TextBox> 
  </div>
  </div>
  <div class="blockrow">
  <label>Full Name:</label> 
  <div class="rightcol">
  <asp:TextBox id="txtFullName" runat="server" CssClass="primary textbox"></asp:TextBox> 
  </div>
  </div>
  <div class="blockrow"><label>Gender:</label> 
  <div class="rightcol">
  <asp:label id="lblGender" runat="server" Enabled="False"></asp:label> 
  </div>
  </div>
  <div class="blockrow">
  <label>Date Creation:</label> 
  <div class="rightcol">
  <asp:TextBox id="txtDateCreation" runat="server" CssClass="primary textbox" Enabled="False"></asp:TextBox>
   </div>
   </div>
   <div class="blockrow"><label>Professional:</label> 
   <div class="rightcol">
   <asp:TextBox id="txtProfessional" runat="server" CssClass="primary textbox"></asp:TextBox>
    </div>
    </div>
    <div class="blockrow">
    <label>Experience:</label> 
    <div class="rightcol"><asp:TextBox id="txtExperience" runat="server" CssClass="primary textbox"></asp:TextBox>
     </div></div><div class="blockrow"><label>Country:</label>
      <div class="rightcol"><asp:TextBox id="txtCountry" runat="server" CssClass="primary textbox"></asp:TextBox> 
      </div></div><div class="blockrow"><label>Address:</label> 
      <div class="rightcol"><asp:TextBox id="txtAddress" runat="server" CssClass="primary textbox"></asp:TextBox>
       </div></div><div class="blockrow"><label>Yahoo:</label>
        <div class="rightcol"><asp:TextBox id="txtYahoo" runat="server" CssClass="primary textbox"></asp:TextBox> 
        </div></div><div class="blockrow"><label>Phone:</label> 
        <div class="rightcol"><asp:TextBox id="txtPhone" runat="server" CssClass="primary textbox"></asp:TextBox> 
        </div></div><div class="blockrow"><label>Hospital:</label>
         <div class="rightcol"><asp:TextBox id="txtHospital" runat="server" CssClass="primary textbox"></asp:TextBox> 
         </div></div><div class="blockrow"><label>Blog:</label> 
         <div class="rightcol"><asp:TextBox id="txtBlog" runat="server" CssClass="primary textbox"></asp:TextBox>
          </div></div><div class="blockrow"><label>Signature:</label>
           <div class="rightcol"><asp:TextBox id="txtSignature" runat="server" CssClass="primary textbox"></asp:TextBox>
            </div></div><div class="blockrow"><label>AboutMe:</label> 
            <div class="rightcol"><asp:TextBox id="txtAboutMe" runat="server" CssClass="primary textbox"></asp:TextBox> 
            </div></div><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" CssClass="button" Text="Save">
                    </asp:Button> <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" CssClass="button" Text="Cancel">
                    </asp:Button> </div>
  </asp:Panel> 
  <asp:Panel id="panelUpdateFailure" runat="server">
                <h2 id="h2_3" class="blocksubhead" align="center">
                    Message Forum</h2>
                <asp:Timer ID="TimerUpdateFailure" runat="server" Interval="1500" OnTick="Timer1_Tick">
                </asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update Information user failure!
                    </div>
                    <fieldset class="blockrow">
                    </fieldset>
                </div>
            </asp:Panel> 
            <asp:Panel id="panelUpdateSuccessfully" runat="server">
                <h2 id="h2_2" class="blocksubhead" align="center">
                    Message Forum</h2>
                <asp:Timer ID="TimerUpdateSuccessfully" runat="server" Interval="1000" OnTick="Timer2_Tick">
                </asp:Timer>
                <div class="section">
                    <div class="blockrow">
                        Update user <strong>
                            <asp:label ID="lblUserUpdate" runat="server"></asp:label>
                        </strong>successfully.
                    </div>
                    <fieldset class="blockrow">
                    </fieldset>
                </div>                
            </asp:Panel> 
            <asp:Panel id="panelAvatar" runat="server"><H2 class="blockhead">Edit Avatar</H2>
            <DIV class="blockbody formcontrols settings_form_border">
            <H3 class="blocksubhead">Your Current Avatar</H3><DIV class="section"><DIV class="blockrow"><DIV class="primary">
            <IMG title="Custom Avatar" height=80 alt="Custom Avatar" src="<%= GetAvatar() %>" width=49 border=0 /> 
            </DIV></DIV></DIV><H3 class="blocksubhead">Custom Avatar</H3><DIV class="section"><DIV id="avatar_yes_deps">
            <DIV class="blockrow"><LABEL for="avatarupload">Upload Image From Your Computer:</LABEL> <DIV class="rightcol">
            <asp:FileUpload id="uploadAvatar" runat="server"></asp:FileUpload></DIV>
            <P class="description">Note: The maximum size of your custom image isb 1 MB (whichever is smaller).</P>
            <asp:Label id="lbnMess" runat="server" Text="Label"></asp:Label> </DIV></DIV></DIV>
            <DIV class="blockfoot actionbuttons settings_form_border"><DIV class="group">
            <asp:Button id="btnSaveAvater" onclick="btnSaveAvater_Click" runat="server" CssClass="button" Text="Save"></asp:Button>
             <asp:Button id="btnCancelAvatar" onclick="btnCancelAvater_Click" runat="server" CssClass="button" Text="Cancel">
                    </asp:Button> </DIV></DIV></DIV></asp:Panel> 
                    </DIV></DIV>
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
