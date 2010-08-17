<%@ Page Language="C#" MasterPageFile="~/GUI/MasterTopicsPage.master" AutoEventWireup="true"
    CodeFile="ShowTopics.aspx.cs" Inherits="GUI_ShowTopics" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pagetitle" id="pagetitle">
        <h1>
            Sub-Forum: <span class="forumtitle"><%= GetSubForumBySubForumID().SubForumName %></span></h1>
        <p class="description">
            <%= GetSubForumBySubForumID().Description %></p>
    </div>
    <%-- Begin Forum Tools  Search Forum--%>
    <div class="above_threadlist_controls" id="above_threadlist_controls">
        <div>
            <ul id="forumdisplaypopups" class="popupgroup forumdisplaypopups">
                <li id="forumtools" class="popupmenu nohovermenu">
                    <h6>
                        <a rel="nofollow" class="popupctrl" href="javascript://" id="yui-gen15">Forum Tools</a></h6>
                    <ul class="popupbody" id="yui-gen14">
                        <li><a rel="nofollow" href="newthread.php?do=newthread&amp;f=27">Post a New Thread…
                        </a></li>
                        <li><a onclick="return mark_forum_read(27);" rel="nofollow" href="forumdisplay.php?do=markread&amp;f=27&amp;markreadhash=guest">
                            Mark This Forum Read </a></li>
                        <li><a rel="nofollow" href="forumdisplay.php?f=5">View Parent Forum</a></li>
                    </ul>
                </li>
                <li id="forumsearch" class="popupmenu nohovermenu forumsearch">
                    <h6>
                        <a class="popupctrl" href="javascript://" id="yui-gen17">Search Forum</a></h6>
                    <form method="get" action="search.php?do=process">
                        <ul class="popupbody" id="yui-gen16">
                            <li>
                                <input type="text" value="Search..." name="q" class="searchbox">
                                <input type="submit" value="Search" class="button">
                            </li>
                            <li class="formsubmit">
                                <div class="submitoptions">
                                    <label>
                                        <input type="radio" checked="checked" value="0" name="showposts">
                                        Show Threads</label>
                                    <label>
                                        <input type="radio" value="1" name="showposts">
                                        Show Posts</label>
                                </div>
                                <div class="advancedsearchlink">
                                    <a rel="nofollow" href="search.php?search_type=1&amp;contenttype=vBForum_Post&amp;forumchoice[]=27">
                                        Advanced Search</a></div>
                            </li>
                        </ul>
                        <input type="hidden" value="" name="s">
                        <input type="hidden" value="guest" name="securitytoken">
                        <input type="hidden" value="process" name="do">
                        <input type="hidden" value="vBForum_Post" name="contenttype">
                        <input type="hidden" value="27" name="forumchoice[]">
                        <input type="hidden" value="1" name="childforums">
                        <input type="hidden" value="1" name="exactname">
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <%--End Forum Tools Search Forum--%>
    <%--Begin Topics--%>
    <div id="below_threadlist" class="noinlinemod below_threadlist">
        <%--begin repeater--%>
        <asp:Repeater ID="repeaterTopics" runat="server">
            <ItemTemplate>
                <ol id="threads" class="threads">
                    <li class="threadbit hot" id="thread_920">
                        <div class="rating0 nonsticky">
                            <div class="threadinfo" title="Need a little help. Trying to delete some URL's from Adsense. Some I can get but there are some that just won't go away. The ones I seem to have the most trouble with are affiliate sites. Anyone have ideas? I can post example of the code but wasn't sure that was permitted.">
                                <!--  status icon block -->
                                <a class="threadstatus" rel="vB::AJAX"></a>
                                <!-- title / author block -->
                                <div class="inner">
                                    <h3 class="threadtitle">
                                        <a class="title" href="TopicDetails.aspx?topicID=<%#Eval("TopicID") %>" id="thread_title_920"><%#Eval("Title") %></a><span
                                            class="age"><%#CountDaysOldOfTopicByTopicID(Convert.ToInt32(Eval("TopicID")))%></span>
                                    </h3>
                                    <div class="threadmeta">
                                        <p class="threaddesc">
                                            Need a little help. Trying to delete some URL's from Adsense. Some I can get but
                                            there are some that just won't go away. The ones I seem to have the most trouble
                                            with are affiliate sites. Anyone have ideas? I can post example of the code but
                                            wasn't sure that was permitted.</p>
                                        <div class="author">
                                            <span class="label"><a href="member.php?u=595" class="username understate" title="Started on Jun 2nd 2004 5:49 pm">
                                                <%#GetMemberOfTopicByTopicID(Convert.ToInt32(Eval("TopicID"))).UserName%></a></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- iconinfo -->
                                <div class="threaddetails td">
                                    <div class="threaddetailicons">
                                    </div>
                                </div>
                            </div>
                            <!-- threadstats -->
                            <ul class="threadstats td alt" title="">
                                <li>Posts: <a href="misc.php?do=whoposted&amp;t=920" onclick="who(920); return false;"
                                    class="understate"><%#GetCountPostsByTopicID(Convert.ToInt32(Eval("TopicID"))) %></a></li>
                                <li>Views: <%#GetTotalViewsByTopicID(Convert.ToInt32(Eval("TopicID")))%></li>
                                <li class="hidden">Rating0 / 5</li>
                            </ul>
                            <!-- lastpost -->
                            <dl class="threadlastpost td">
                                <dt class="lastpostby hidden">Last Post By</dt>
                                <dd>
                                    <div id="yui-gen33" class="popupmenu memberaction">
                                        <a id="yui-gen35" class="username offline popupctrl" href="Member.aspx?memberID=<%#Eval("MemberID") %>" title="disgust is offline">
                                            <strong><%#GetLastMemberPostByTopicID(Convert.ToInt32(Eval("TopicID"))).UserName%></strong></a>
                                        <ul id="yui-gen34" class="popupbody memberaction_body">
                                            <li class="left">
                                                <img src="http://i.dpstatic.com/site_icons/profile.png" alt="">
                                                <a href="member.php?u=489">View Profile </a></li>
                                            <li class="right">
                                                <img src="http://i.dpstatic.com/site_icons/forum.png" alt="">
                                                <a href="search.php?do=finduser&amp;userid=489&amp;contenttype=vBForum_Post&amp;showposts=1"
                                                    rel="nofollow">View Forum Posts </a></li>
                                            <li class="right">
                                                <img src="http://i.dpstatic.com/site_icons/blog.png" alt="">
                                                <a href="http://blogs.digitalpoint.com/?u=489" rel="nofollow">View Blog Entries </a>
                                            </li>
                                            <li class="right">
                                                <img src="http://i.dpstatic.com/site_icons/article.png" alt="">
                                                <a href="http://articles.digitalpoint.com/list.php/author/489-disgust" rel="nofollow">
                                                    View Articles </a></li>
                                        </ul>
                                    </div>
                                </dd>
                                <dd>
                                    <%#GetLastPostOfTopicByTopicID(Convert.ToInt32(Eval("TopicID"))).DateCreation%> <em class="time"></em> <a href="TopicDetails.aspx?topicIDLastPost=<%#Eval("TopicID") %>"
                                        class="lastpostdate understate" title="Go to last post">
                                        <img title="Go to last post" src="http://b.dpstatic.com/buttons/lastpost-right.png"
                                            alt="Go to last post"></a>
                                </dd>
                            </dl>
                        </div>
                    </li>
                </ol>
            </ItemTemplate>
        </asp:Repeater>
        <%--end repeater--%>
    </div>
    <%--End Topics--%>
</asp:Content>
