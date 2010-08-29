<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="TopicDetails.aspx.cs" Inherits="GUI_TopicDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <a id="newreplylink_top" class="newcontent_textcontrol" href="NewReply.aspx?topicID=<%= Request.QueryString["topicID"] %>">
        <span>+</span> Reply to Topic</a>
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
                        </span></span><span class="nodecontrols"><a class="postcounter" href="#"
                            name="post14688639">#1</a><a name="1" id="postcount14688639"></a> </span>
                    </div>
                    <div class="userinfo_noavatar">
                        <div class="contact">
                            <div class="username_container">
                                <div class="popupmenu memberaction" id="yui-gen16">
                                    <a title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" href="member.php?u=429236" class="username offline popupctrl"
                                        id="yui-gen18"><strong><span class="user25">
                                            <%= GetMemberByMemberID(GetTopic().MemberID).UserName %>
                                        </span></strong></a>
                                </div>
                               
                                <% if(GetMemberByMemberID(GetTopic().MemberID).IsOnline){ %>
                                <img border="0" alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online" src="Images/users-online.png"
                                    class="inlineimg onlinestatus" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is online">
                                    <%}else{ %>
                                     <img border="0"alt="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline" src="Images/user-offline.png"
                                    class="inlineimg onlinestatus" title="<%= GetMemberByMemberID(GetTopic().MemberID).UserName %> is offline">
                                    <%} %>
                                <span class="usertitle"><%= GetMemberByMemberID(GetTopic().MemberID).FullName %> </span><span id="repdisplay_14688639_429236" class="postbit_reputation">
                                    <img alt="maihannijat is on a distinguished road" src="http://i.dpstatic.com/reputation/reputation_pos.png"
                                        class="repimg" title="maihannijat is on a distinguished road">
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
                        <span class="postcontrols">
                            <img style="display: none" id="Img2" src="http://m.dpstatic.com/misc/progress.gif"
                                alt="" />
                            <a id="qr_14688798" class='quickreply'  href="NewReply.aspx?topicID=<%= Request.QueryString["topicID"] %>"
                                rel="nofollow">
                                <img id="replyimg_14688798" src="clear.gif" alt="" />
                                Reply</a> <span class="seperator">&nbsp;</span> <a rel="nofollow" href="NewReply.aspx?topicID=<%= Request.QueryString["topicID"] %>&withQuote=1"
                                    class="newreply" id="qrwq_14688639">Reply With Quote</a><span class="seperator">&nbsp;</span>
                            <span class="postlinking"></span> </span><span class="postlinking">
                                    <span title="14688639" class="reputationpopupmenu popupmenu popupcustom" id="yui-gen71">
                                        <a id="reputation_14688639" rel="nofollow" title="Add to this user's reputation"
                                            href="reputation.php?do=addreputation&amp;p=14688639" class="popupctrl reputation">
                                           
                                            &nbsp;</a></span> &nbsp;<a title="Report Post" rel="nofollow" href="#"
                                                class="report">&nbsp;</a>
                                    &nbsp; </span>
                    </div>
                </div>
                <hr/>
            </li>
            <li class="postbit" id="adsense_inline"></li>
        </ol>
        <%--        <div class="separator">
        </div>
        <div class="postlistfoot">
        </div>--%>
    </div>
    <%--begin posts list of this topic--%>
    <asp:Repeater ID="repeaterPosts" runat="server">
        <ItemTemplate>
        <div class="postlist restrain" id="postlist">
        <ol start="1" class="posts" id="posts">
            <li id="post_14688639" class="postbit postbitim postcontainer">
                <div class="postdetails_noavatar">
                    <div class="posthead">
                        <span class="postdate old"><span class="date">
                            <%#Eval("DateCreationOfPosts")%>
                        </span></span><span class="nodecontrols"><a class="postcounter" href="#"
                            name="post14688639">#1</a><a name="1" id="postcount14688639"></a> </span>
                    </div>
                    <div class="userinfo_noavatar">
                        <div class="contact">
                            <div class="username_container">
                                <div class="popupmenu memberaction" id="yui-gen16">
                                    <a title="maihannijat is offline" href="member.php?u=429236" class="username offline popupctrl"
                                        id="yui-gen18"><strong><span class="user25">
                                            <%#Eval("UserName")%>
                                        </span></strong></a>
                                </div>
                                <img border="0" alt="maihannijat is offline" src="http://i.dpstatic.com/statusicon/user-offline.png"
                                    class="inlineimg onlinestatus" title="maihannijat is offline">
                                <span class="usertitle"><%#Eval("FullName")%> </span><span id="repdisplay_14688639_429236" class="postbit_reputation">
                                    <img alt="maihannijat is on a distinguished road" src="http://i.dpstatic.com/reputation/reputation_pos.png"
                                        class="repimg" title="maihannijat is on a distinguished road">
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
                                <blockquote class="postcontent restore">
                                    <%#Eval("Content") %>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="postfoot">
                    <div class="textcontrols floatcontainer">
                        <span class="postcontrols">
                            <img style="display: none" id="Img2" src="http://m.dpstatic.com/misc/progress.gif"
                                alt="" />
                            <a id="qr_14688798" class='quickreply' href="newreply.php?do=newreply&amp;p=14688798"
                                rel="nofollow">
                                <img id="replyimg_14688798" src="clear.gif" alt="" />
                                Reply</a> <span class="seperator">&nbsp;</span> <a rel="nofollow" href="newreply.php?do=newreply&amp;p=14688639"
                                    class="newreply" id="qrwq_14688639">Reply With Quote</a><span class="seperator">&nbsp;</span>
                            <span class="postlinking"></span> </span><span class="postlinking">
                                    <span title="14688639" class="reputationpopupmenu popupmenu popupcustom" id="yui-gen71">
                                        <a id="reputation_14688639" rel="nofollow" title="Add to this user's reputation"
                                            href="#" class="popupctrl reputation">
                                            <!--<img src="http://b.dpstatic.com/buttons/reputation-40b.png" alt="Add to this user's reputation" />-->
                                            &nbsp;</a></span> &nbsp;<a title="Report Post" rel="nofollow" href="#"
                                                class="report"><!-- <img src="http://b.dpstatic.com/buttons/report-40b.png" alt="Report Post" /> -->&nbsp;</a>
                                    &nbsp; </span>
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
    <a id="newreplylink_bottom" class="newcontent_textcontrol" href="NewReply.aspx?topicID=<%= Request.QueryString["topicID"] %>">
        <span>+</span> Reply to Topic</a>
    <br />
</asp:Content>
