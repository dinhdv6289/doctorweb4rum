<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="TopicDetails.aspx.cs" Inherits="GUI_TopicDetails" Title="Untitled Page" %>
    <%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="PagingControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="newcontent_textcontrol" OnClick="CheckLoginToNewReply" ><span>+ </span>Reply to Topic</asp:LinkButton>
    <br />
    <div>
    </div>
    <div class="pagetitle" id="pagetitle">
        <h1>
            Thread: <span class="threadtitle"><a title="Reload this Page" href="TopicDetails.aspx?topicID=<%= GetTopic().TopicID %>">
                <%= GetTopic().Title%>
            </a></span>
        </h1>
    </div>
    <div class="thread_controls" id="thread_controls">
        <div>
            <ul class="postlist_popups popupgroup" id="postlist_popups">
                <li class="popupmenu" id="yui-gen11">
                    <h6>
                    </h6>
                </li>
                <li id="threadtools" class="popupmenu">
                  <h6>
                        </h6>
                    <ul class="popupbody" id="yui-gen12">
                        <li><</li><li></li><li> </li>
                    </ul>
                </li>
                <li id="searchthread" class="popupmenu searchthread">
                   <h6>
                        </h6>
                    
                </li>
            </ul>
        </div>
    </div>
    <div class="postlist restrain" id="postlist">
        <ol start="1" class="posts" id="posts">
            <li id="post_14688639" class="postbit postbitim postcontainer">
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
                            <img alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %>'s Avatar" src="<%= GetMemberProfileByMemberID(GetTopic().MemberID).Avatar%>" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %>'s Avatar"></a>
                            <div class="username_container">
                                <div class="popupmenu memberaction" id="yui-gen16">
                                <% if(GetMemberByMemberID(GetTopic().MemberID).IsOnline){ %>
                                    <a title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online " href="MemberProfile.aspx?memberID=<%= GetTopic().MemberID%>" class="username online popupctrl"
                                        id="yui-gen18"><strong><span class="user25">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span></strong></a>
                                        <%}else{ %>
                                        <a title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" href="MemberProfile.aspx?memberID=<%= GetTopic().MemberID%>" class="username offline popupctrl"
                                        id="A1"><strong><span class="user25">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span></strong></a>
                                        <%} %>
                                </div>
                               
                                <% if(GetMemberByMemberID(GetTopic().MemberID).IsOnline){ %>
                                <img border="0" alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online" src="Images/user-online.png"
                                    class="inlineimg onlinestatus" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online">
                                    <%}else{ %>
                                     <img border="0"alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" src="Images/user-offline.png"
                                    class="inlineimg onlinestatus" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline">
                                    <%} %>
                                <span class="usertitle"><%= GetMemberByMemberID(GetTopic().MemberID).FullName %> </span><span id="repdisplay_14688639_429236" class="postbit_reputation">
                                    <img alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is on a distinguished road" src="Images/reputation_pos.png"
                                        class="repimg" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is on a distinguished road">
                                </span>
                                <div class="imlinks">
                                </div>
                            </div>
                        </div>
                        <div class="userinfo_extra">
                            <dl class="userstats">
                                <dt>Join Date</dt><dd><%= GetMemberByMemberID(GetTopic().MemberID).DateCreation%></dd><dt>Location</dt><dd><%= GetMemberProfileByMemberID(GetTopic().MemberID).Address%></dd><dt>Posts</dt><dd><%= GetMemberProfileByMemberID(GetTopic().MemberID).TotalPosts%></dd></dl>
                        </div>
                    </div>
                </div>
                <div class="postbody">
                    <div class="postrow">
                        <h2 class="posttitle icon">
                            <%= GetTopic().Title%>
                        </h2>
                        <div class="content">
                            <div id="post_message_14688639">
                                <blockquote class="postcontent restore">
                                    <%= GetTopic().Content%>                                   
                               </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="postfoot">
                    <div class="textcontrols floatcontainer">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <ContentTemplate>
<SPAN class="postcontrols"><% if (IsMyTopic()){ %><asp:LinkButton id="QuickEditLinkButton" onclick="CheckLoginToQuickEdit" runat="server" CssClass="editpost" __designer:wfdid="w1">Edit Topic</asp:LinkButton> <SPAN class="seperator">&nbsp;</SPAN> <% } %><asp:LinkButton id="quickReplyLinkButton" onclick="CheckLoginToNewReply" runat="server" CssClass="quickreply" __designer:wfdid="w2">Reply</asp:LinkButton> <SPAN class="seperator">&nbsp;</SPAN> <ajaxToolkit:Rating id="topicRating" runat="Server" CssClass="ratingStar" OnChanged="topicRating_Changed" AutoPostBack="True" StarCssClass="ratingItem" WaitingStarCssClass="Saved" FilledStarCssClass="Filled" EmptyStarCssClass="Empty" __designer:wfdid="w3"></ajaxToolkit:Rating> </SPAN><SPAN class="postlinking"><% if (isThanked())
                            {
                            }
                               else
                               {
                             %><asp:LinkButton id="LinkButton1" onclick="LinkButton1_Click" runat="server" CssClass="post_thanks_button" __designer:wfdid="w4">Thanks</asp:LinkButton> <%} %></SPAN>
</ContentTemplate>
 </asp:UpdatePanel>
                    </div>
                </div>
                <hr/>
            </li>
        </ol>
        <%--        <div class="separator">
        </div>
        <div class="postlistfoot">
        </div>--%>
    </div>
    
    <%--begin thanks--%>
            <ol class="floatcontainer" id="forums">
                <li class="forumbit_nopost L1">
                    <div class="module">
                        <div class="header" id="module_group10" style="cursor: pointer;">
                            <h2>
                                <span class="forumtitle"><a style="color: rgb(255, 255, 255);" href="">The Following
                                    User Says Thank You to <%= GetMemberByMemberID(GetTopic().MemberID).UserName %> For This Useful Post: </a></span>
                            </h2>
                        </div>
                        <asp:Repeater ID="repeaterThanksOfTopic" runat="server">
                            <ItemTemplate>
                                <ol id="c_cat4" class="childforum">
                                    <li id="forum5" class="forumbit_post L2">
                                        <div class="forumrow table">
                                           <%-- <div class="foruminfo td">--%>
                                               <%-- <div class="forumdata">--%>
                                                   <%-- <div class="datacontainer">--%>
                                                        <div class="titleline">
                                                            <h2 class="forumtitle">
                                                                <a href="MemberProfile.aspx?memberID=<%#Eval("FromMember")%>"><%#Eval("UserName")%> (<%#Eval("ThankDate")%>) </a>
                                                            </h2>
                                                        </div>
                                                   <%-- </div>--%>
                                               <%-- </div>--%>
                                           <%-- </div>--%>
                                        </div>
                                    </li>
                                </ol>
                            </ItemTemplate>
                            <SeparatorTemplate>
                                ,</SeparatorTemplate>
                        </asp:Repeater>
                    </div>
                </li>
            </ol>    
    
    
    <%--end thanks--%>
    
    
    <%--begin posts list of this topic--%>
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
                            <img alt="<%#Eval("UserName")%>'s Avatar" src="<%#Eval("Avatar")%>" title="<%#Eval("UserName")%>'s Avatar"></a>
                            <div class="username_container">
                                <div class="popupmenu memberaction" id="yui-gen16">
                                    <a title="<%#ShowStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>" href="MemberProfile.aspx?memberID=<%#Eval("MemberID")%>" class="username offline popupctrl"
                                        id="yui-gen18"><strong><span class="user25">
                                            <%#Eval("UserName")%>
                                        </span></strong></a>
                                </div>
                                <img border="0" alt=" <%#ShowStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>" src="<%#ShowImageStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>"
                                    class="inlineimg onlinestatus" title=" <%#ShowStatusOnlineOrOffline(Convert.ToInt32(Eval("PostID"))) %>">
                                <span class="usertitle"><%#Eval("FullName")%> </span><span id="repdisplay_14688639_429236" class="postbit_reputation">
                                    <img alt=" <%#Eval("UserName")%> is on a distinguished road" src="Images/reputation_pos.png"
                                        class="repimg" title=" <%#Eval("UserName")%> is on a distinguished road">
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
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <ContentTemplate>                                
<SPAN class="postcontrols">
    <asp:LinkButton ID="EditPostLinkButton" runat="server" Visible='<%#IsMyPost(Convert.ToInt32(Eval("PostID"))) %>' 
    CssClass="editpost" CommandName="EditPost" CommandArgument='<%#Eval("PostID")%>'>Edit Post</asp:LinkButton>
<SPAN class="seperator">&nbsp;</SPAN> 
<asp:LinkButton ID="QuickReplyLinkButton" runat="server" CssClass="quickreply" CommandName="QuickReply" CommandArgument='<%#Eval("PostID")%>'>Reply</asp:LinkButton>
<SPAN class="seperator">&nbsp;</SPAN>
<asp:LinkButton ID="ReplyWithQuoteLinkButton" runat="server" CssClass="newreply" CommandName="ReplyWithQuote" CommandArgument='<%#Eval("PostID")%>'>Reply With Quote</asp:LinkButton>
 <SPAN class="seperator">&nbsp;</SPAN>
 <ajaxToolkit:Rating id="postRating" runat="Server" CurrentRating='<%#Convert.ToInt32(Eval("RatingPoint"))%>' 
 CssClass="ratingStar" Tag='<%#Eval("PostID")%>' EmptyStarCssClass="Empty" OnChanged="Rating_Changed" FilledStarCssClass="Filled"
  WaitingStarCssClass="Saved" StarCssClass="ratingItem" AutoPostBack="true"></ajaxToolkit:Rating> </SPAN>

                   <span class="postlinking">

               <asp:LinkButton ID="btThank" Visible='<%#isPostThanked(Convert.ToInt32(Eval("PostID"))) %>' 
               runat="server" CssClass="post_thanks_button" CommandName="ThankClick" CommandArgument='<%#Eval("PostID")%>'>Thanks</asp:LinkButton>
                                    </span>
 </ContentTemplate>
 </asp:UpdatePanel>
                    </div>
                </div>
                <hr>
            </li>
            <%--<li class="postbit" id="adsense_inline"></li>--%>
        </ol>
        <%--        <div class="separator">
        </div>
        <div class="postlistfoot">
        </div>--%>
    </div>
        </ItemTemplate>
    </asp:Repeater>
     <%--and posts list of this topic--%>
     <div class="noinlinemod below_postlist" id="below_postlist">
     <asp:LinkButton ID="replylink" runat="server" CssClass="newcontent_textcontrol" OnClick="CheckLoginToNewReply"><span>+ </span>Reply to Topic</asp:LinkButton>
     <br />
     <br />
                <div class="pagination_bottom">
            <CC1:COLLECTIONPAGER id="CollectionPager1" runat="server" ResultsLocation="None" ShowFirstLast="True" BackNextLocation="Split" BackNextDisplay="HyperLinks" PageSize="2" ControlCssClass="pagination" ShowLabel="False" PageNumbersDisplay="Numbers" PageNumbersSeparator="&nbsp;" BackNextButtonStyle="" BackNextLinkSeparator="" BackNextStyle="" ShowPageNumbers="True" SliderSize="3" UseSlider="True" IgnoreQueryString="False" ResultsFormat="Results  {0} to {1} of {2}" ResultsStyle="float:left;"></CC1:COLLECTIONPAGER>
            </div>
            </div>
</asp:Content>
