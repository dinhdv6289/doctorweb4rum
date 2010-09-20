<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="TopicDetails.aspx.cs" Inherits="GUI_TopicDetails" Title="Topic Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:LinkButton ID="lbtnAddNewTp" runat="server" CssClass="newcontent_textcontrol" OnClick="lbtnAddNewTopic" >
    <span>+ </span>Add New Topic</asp:LinkButton>    
    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="newcontent_textcontrol" OnClick="CheckLoginToNewReply" >
    <span>+ </span>Reply to Topic</asp:LinkButton>
    <br />
    <div class="pagetitle" id="pagetitle">
        <h1>
            Thread: <span class="threadtitle"><a title="Reload this Page" href="TopicDetails.aspx?topicID=<%= GetTopic().TopicID %>">
                <%= GetTopic().Title%>
            </a></span>
        </h1>
    </div>
    <div class="postlist restrain">
        <ol start="1" class="posts">
            <li class="postbit postbitim postcontainer">
                <div class="postdetails_noavatar">
                    <div class="posthead">
                        <span class="postdate old"><span class="date">
                            <%= GetTopic().DateCreate %>
                        </span></span><span class="nodecontrols"><a class="postcounter" href="#post1"
                            name="post1">#1</a></span>
                    </div>
                    <div class="userinfo_noavatar">
                        <div class="contact">
                        <a title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %>  is online now" href="MemberProfile.aspx?memberID=<%= GetTopic().MemberID%>" class="postuseravatarlink">
                            <img alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %>'s Avatar" src="<%= GetMemberProfileByMemberID(GetTopic().MemberID).Avatar%>" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %>'s Avatar" width="80px" height="80px"/></a>
                            <div class="username_container">
                                <div class="popupmenu memberaction" >
                                <% if(GetMemberByMemberID(GetTopic().MemberID).IsOnline){ %>
                                    
                                    
                                    <% if (BLL.MemberBLL.GetBannedUser(GetTopic().MemberID).AllowLogin)
                                       { %>
                                       <a title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online " href="MemberProfile.aspx?memberID=<%= GetTopic().MemberID%>" class="username online popupctrl">
                                    <strong><span class="user25">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span></strong>
                                        <%}else{ %>
                                         <span style="text-decoration:line-through;">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span>
                                        </a>
                                        
                                        Banned
                                        <%} %>
                                        
                                        <%}else{ %>
                                            
                                        <a title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" href="MemberProfile.aspx?memberID=<%= GetTopic().MemberID%>" class="username offline popupctrl"
                                        id="A1">
                                            
                                    <% if(BLL.MemberBLL.GetBannedUser(GetTopic().MemberID).AllowLogin){ %>
                                    <strong><span class="user25">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span></strong>
                                        <%}else{ %>
                                         <span style="text-decoration:line-through;">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span>
                                        <%} %>
                                        </a>
                                        <%} %>
                                </div>
                               
                                <% if(GetMemberByMemberID(GetTopic().MemberID).IsOnline){ %>
                                <img border="0" alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online" src="Images/user-online.png"
                                    class="inlineimg onlinestatus" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online" />
                                    <%}else{ %>
                                     <img border="0"alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" src="Images/user-offline.png"
                                    class="inlineimg onlinestatus" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" />
                                    <%} %>
                                    <% Member memberCheckAdmin = GetMemberByMemberID(GetTopic().MemberID);
                                       MemberProfile memberProfileRole = GetMemberProfileByMemberID(GetTopic().MemberID);
                                       Role role = BLL.RoleBLL.GetRoleByRoleID(memberProfileRole.RoleID);
                                        %>
                                        <% if(role.RoleName.Equals("Admin")){ %>
                                <span class="postbit_reputation">
                                    <img alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> " src="Images/MemberProfiles/Roles/adminitrator.gif"
                                        class="repimg" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> " />
                                </span>
                                <%} %>
                                <%--end admin--%>
                                <% if(memberCheckAdmin.IsDoctor) {%>
                                <span class="postbit_reputation">
                                    <img alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> " src="Images/MemberProfiles/Doctor/doctor.gif"
                                        class="repimg" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> " />
                                </span>
                                <%} %>
                                <div class="imlinks">
                                </div>
                            </div>
                        </div>
                        <div class="userinfo_extra">
                            <dl class="userstats">
                                <dt>Join Date</dt><dd><%= GetMemberByMemberID(GetTopic().MemberID).DateCreation%></dd>
                                <dt>Location</dt><dd><%= GetMemberProfileByMemberID(GetTopic().MemberID).Address%></dd>
                                <dt>Posts</dt><dd><%= GetMemberProfileByMemberID(GetTopic().MemberID).TotalPosts%></dd></dl>
                        </div>
                    </div>
                </div>
                <div class="postbody">
                    <div class="postrow">
                        <h2 class="posttitle icon">
                            <%= GetTopic().Title%>
                        </h2>
                        <div class="content">
                            <div>
                                <blockquote class="postcontent restore">
                                    <%= GetTopic().Content%>                                   
                               </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="postfoot">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <ContentTemplate>
 <div class="textcontrols floatcontainer">
<span class="postcontrols"><% if (IsMyTopic()){ %>
<asp:LinkButton id="QuickEditLinkButton" onclick="CheckLoginToQuickEdit" runat="server" CssClass="editpost" >Edit Topic</asp:LinkButton>
 <span class="seperator">&nbsp;</span>
 <% } %><asp:LinkButton id="quickReplyLinkButton" onclick="CheckLoginToNewReply" runat="server" CssClass="quickreply">Reply</asp:LinkButton> 
 <span class="seperator">&nbsp;</span>
  <ajaxToolkit:Rating id="topicRating" runat="Server" CssClass="ratingStar" OnChanged="topicRating_Changed" AutoPostBack="True" 
  StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty"></ajaxToolkit:Rating> 
  </span><span class="postlinking"><% if (!isThanked() && !IsMyTopic())
                            {%>
                                          <asp:LinkButton id="LinkButton1" onclick="LinkButton1_Click" runat="server" CssClass="post_thanks_button" >Thanks</asp:LinkButton>
                             <%}%></span>
                                                 </div>
</ContentTemplate>
 </asp:UpdatePanel>

                </div>
                <hr/>
            </li>
        </ol>
    </div>
    
    <%--begin thanks--%>
            <asp:UpdatePanel ID="UpdatePanelRepeaterThanksOfTopic" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <ContentTemplate>
            <div>
            <asp:Panel id="panelThanksOfTopic" runat="server">
            <ol class="floatcontainer">
                <li class="forumbit_nopost L1">
                    <div class="module">
                        <div class="header" style="cursor: pointer;">
                            <h2>
                                <span class="forumtitle"><a style="color: rgb(255, 255, 255);" href="">The Following
                                    User Says Thank You to <%= GetMemberByMemberID(GetTopic().MemberID).UserName %> For This Useful Post: </a></span>
                            </h2>
                        </div>
                                                        <ol id="c_cat4" class="childforum">
                                    <li id="forum5" class="forumbit_post L2">
                                        <div class="forumrow table">
                                            <div class="titleline">
                        <asp:Repeater ID="repeaterThanksOfTopic" runat="server">
                            <ItemTemplate>
                                <a href="MemberProfile.aspx?memberID=<%#Eval("FromMember")%>"> <%#Eval("UserName")%> (<%#Eval("ThankDate")%>) </a>
                            </ItemTemplate>
                            <SeparatorTemplate>
                                ,</SeparatorTemplate>
                        </asp:Repeater>
                                </div>
                                        </div>
                                    </li>
                                </ol>
                    </div>
                </li>
            </ol>   
            </asp:Panel>
            </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <%--end thanks--%>
    
    
    <%--begin posts list of this topic--%>
<asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
<ContentTemplate>
<div>
    <asp:Repeater ID="repeaterPosts" runat="server" OnItemCommand="repeaterPosts_ItemCommand">
        <ItemTemplate>
        <div class="postlist restrain" id="postlist">
        <ol start="1" class="posts" id="posts">
            <li id="post_14688639" class="postbit postbitim postcontainer">
                <div class="postdetails_noavatar">
                    <div class="posthead">
                        <span class="postdate old"><span class="date">
                            <%#Eval("DateCreationOfPosts")%>
                        </span></span><span class="nodecontrols"><a class="postcounter" href="#post<%#Container.ItemIndex + 2 %>"
                            name="post<%#Container.ItemIndex + 2 %>">#<%#Container.ItemIndex + 2 %></a></span>
                    </div>
                    <div class="userinfo_noavatar">
                        <div class="contact">
                        <a title="<%#Eval("UserName")%>  is online now" href="MemberProfile.aspx?memberID=<%= GetTopic().MemberID%>" class="postuseravatarlink">
                            <img alt="<%#Eval("UserName")%>'s Avatar" src="<%#Eval("Avatar")%>" title="<%#Eval("UserName")%>'s Avatar" width="80px" height="80px"></a>
                            <div class="username_container">
                                <div class="popupmenu memberaction" id="yui-gen16">
                                    <a title="<%#ShowStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>" href="MemberProfile.aspx?memberID=<%#Eval("MemberID")%>" class="username offline popupctrl"
                                        id="yui-gen18"><span class="user25" style="<%#MemberIsBanned(Eval("MemberID").ToString()) %>" >
                                            <%#Eval("UserName")%>
                                        </span></a> <%#ShowTextBanned(Eval("MemberID").ToString())%>
                                </div>
                                <img border="0" alt=" <%#ShowStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>" src="<%#ShowImageStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>"
                                    class="inlineimg onlinestatus" title=" <%#ShowStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>">
                                <span id="repdisplay_14688639_429236" class="postbit_reputation">
                                    <img alt=" <%#Eval("UserName")%> " src="<%#ShowImageIsAdmin(Convert.ToInt32(Eval("PostID"))) %>"
                                        class="repimg" title=" <%#Eval("UserName")%> ">
                                </span>
                                <span id="Span1" class="postbit_reputation">
                                    <img alt=" <%#Eval("UserName")%> " src="<%#ShowImageIsDoctor(Convert.ToInt32(Eval("PostID"))) %>"
                                        class="repimg" title=" <%#Eval("UserName")%> ">
                                </span>                                
                                <div class="imlinks">
                                </div>
                            </div>
                        </div>
                        <div class="userinfo_extra">
                            <dl class="userstats">
                                <dt>Join Date</dt>
                                <dd>
                                    <%#Eval("DateCreation")%></dd>
                                <dt>Location</dt>
                                <dd>
                                    <%#Eval("Country")%></dd>
                                <dt>Posts</dt>
                                <dd>
                                    <%#Eval("TotalPosts")%></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="postbody">
                    <div class="postrow">
                        <h2 class="posttitle icon">
                            
                        </h2>
                        <div class="content">
                            <div id="post_message_14688639">
                                <%#GetQuote(Convert.ToInt32(Eval("QuoteID"))) %>
                                <%#Eval("Content") %>
                            </div>
                        </div>
                    </div>
                </div>
                
                                <div class="postfoot">
                    <div class="textcontrols floatcontainer">                               
<span class="postcontrols">
    <asp:LinkButton ID="EditPostLinkButton" runat="server" Visible='<%#IsMyPost(Convert.ToInt32(Eval("PostID"))) %>' 
    CssClass="editpost" CommandName="EditPost" CommandArgument='<%#Eval("PostID")%>'>Edit Post</asp:LinkButton>
<span class="seperator">&nbsp;</span> 
<asp:LinkButton ID="QuickReplyLinkButton" runat="server" CssClass="quickreply" CommandName="QuickReply"
 CommandArgument='<%#Eval("PostID")%>'>Reply</asp:LinkButton>
<span class="seperator">&nbsp;</span>
<asp:LinkButton ID="ReplyWithQuoteLinkButton" runat="server" CssClass="newreply" CommandName="ReplyWithQuote"
 CommandArgument='<%#Eval("PostID")%>'>Reply With Quote</asp:LinkButton>
 <span class="seperator">&nbsp;</span>
 <ajaxToolkit:Rating id="postRating" runat="Server" CurrentRating='<%#Convert.ToInt32(Eval("RatingPoint"))%>' 
 CssClass="ratingStar" Tag='<%#Eval("PostID")%>' EmptyStarCssClass="Empty" OnChanged="Rating_Changed" FilledStarCssClass="Filled"
  WaitingStarCssClass="Saved" StarCssClass="ratingItem" AutoPostBack="true"></ajaxToolkit:Rating> </span>

                   <span class="postlinking">

               <asp:LinkButton ID="btThank" Visible='<%#isPostThanked(Convert.ToInt32(Eval("PostID"))) %>' 
               runat="server" CssClass="post_thanks_button" CommandName="ThankClick" CommandArgument='<%#Eval("PostID")%>'>Thanks</asp:LinkButton>
                                    </span>
                    </div>
                </div>
                <hr>
            </li>
       
            <%--begin thanks of post--%>
            <ol class="floatcontainer" id="forums">
                <li class="forumbit_nopost L1">
                    <div class="module">
                        <div class="header" id="module_group10" style="cursor: pointer;">
                            <h2>
                                <span class="forumtitle"><a style="color: rgb(255, 255, 255);" href="">The Following
                                    User Says Thank You to <%#Eval("UserName")%> For This Useful Post: </a></span>
                            </h2>
                        </div>
            <ol id="c_cat4" class="childforum">
                <li id="forum5" class="forumbit_post L2">
                    <div class="forumrow table">
                        <div class="titleline">
                            <asp:Repeater ID="repeaterThanksOfPost" runat="server" DataSource='<%#GetAllThanksOfPostByPostID(Convert.ToInt32(Eval("PostID"))) %>'>
                            <ItemTemplate>
                                <a href="MemberProfile.aspx?memberID=<%#Eval("FromMember")%>"><%#Eval("UserName")%> (<%#Eval("ThankDate")%>) </a>                                                      
                            </ItemTemplate>
                            <SeparatorTemplate>
                                ,</SeparatorTemplate>
                        </asp:Repeater>
                        </div>
                    </div>
                </li>
            </ol>
                    </div>
                </li>
            </ol>   
    </ol>
    <%--end thanks of post--%>
        
    </div>
        </ItemTemplate>
    </asp:Repeater>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
     <%--and posts list of this topic--%>
     <asp:LinkButton ID="lbn3" runat="server" CssClass="newcontent_textcontrol" OnClick="lbtnAddNewTopic" >
    <span>+ </span>Add New Topic</asp:LinkButton>     
         <asp:LinkButton ID="replylink" runat="server" CssClass="newcontent_textcontrol" OnClick="CheckLoginToNewReply">
     <span>+ </span>Reply to Topic</asp:LinkButton> 
     <div class="noinlinemod below_postlist" id="below_postlist">
    

     <br />
     <br />
                <div class="pagination_bottom">
            <cc1:collectionpager id="collectionpager1" runat="server" ResultsLocation="None"
             ShowFirstLast="True" BackNextLocation="Split" BackNextDisplay="HyperLinks" 
             PageSize="15" ControlCssClass="pagination" ShowLabel="False" PageNumbersDisplay="Numbers" 
             PageNumbersSeparator="&nbsp;" BackNextButtonStyle="" BackNextLinkSeparator="" BackNextStyle="" 
             ShowPageNumbers="True" SliderSize="3" UseSlider="True" IgnoreQueryString="False" 
             ResultsFormat="Results  {0} to {1} of {2}" ResultsStyle="float:left;"></cc1:collectionpager>
            </div>
            </div>
</asp:Content>
