<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShowTopics.aspx.cs" Inherits="GUI_ShowTopics" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div class="above_threadlist" id="above_threadlist">
                <a id="newthreadlink_top" class="newcontent_textcontrol" rel="nofollow" href="NewTopic.aspx?subForumID=<%= Request.QueryString["subForumID"] %>"><span>
                    +</span> Post New Topic</a>
            </div>
 <br />
<div>
<hr />
</div>
    <div class="pagetitle" id="pagetitle">
        <h1>
            Sub-Forum: <span class="forumtitle">
                <%= GetSubForumBySubForumID().SubForumName %>
            </span>
        </h1>
        <p class="description">
            <%= GetSubForumBySubForumID().Description %>
        </p>
    </div>
    <div id="above_threadlist_controls" class="above_threadlist_controls">
        <div>
            <ul class="popupgroup forumdisplaypopups" id="forumdisplaypopups">
                <li class="popupmenu nohovermenu" id="forumtools">
                    <h6>
                        <a id="yui-gen15" href="javascript://" class="popupctrl" rel="nofollow">Forum Tools</a></h6>
                    <ul id="yui-gen14" class="popupbody">
                        <li><a href="newthread.php?do=newthread&amp;f=69" rel="nofollow">Post a New Thread…
                        </a></li>
                        <li><a href="forumdisplay.php?do=markread&amp;f=69&amp;markreadhash=guest" rel="nofollow"
                            onclick="return mark_forum_read(69);">Mark This Forum Read </a></li>
                        <li><a href="forumdisplay.php?f=27" rel="nofollow">View Parent Forum</a></li>
                    </ul>
                </li>
                <li class="popupmenu nohovermenu forumsearch" id="forumsearch">
                    <h6>
                        <a id="yui-gen17" href="javascript://" class="popupctrl">Search Forum</a></h6>
                    <form action="search.php?do=process" method="get">
                        <ul id="yui-gen16" class="popupbody">
                            <li>
                                <input class="searchbox" name="q" value="Search..." type="text">
                                <input class="button" value="Search" type="submit">
                            </li>
                            <li class="formsubmit">
                                <div class="submitoptions">
                                    <label>
                                        <input name="showposts" value="0" checked="checked" type="radio">
                                        Show Threads</label>
                                    <label>
                                        <input name="showposts" value="1" type="radio">
                                        Show Posts</label>
                                </div>
                                <div class="advancedsearchlink">
                                    <a href="search.php?search_type=1&amp;contenttype=vBForum_Post&amp;forumchoice[]=69"
                                        rel="nofollow">Advanced Search</a></div>
                            </li>
                        </ul>
                        <input name="s" value="" type="hidden">
                        <input name="securitytoken" value="guest" type="hidden">
                        <input name="do" value="process" type="hidden">
                        <input name="contenttype" value="vBForum_Post" type="hidden">
                        <input name="forumchoice[]" value="69" type="hidden">
                        <input name="childforums" value="1" type="hidden">
                        <input name="exactname" value="1" type="hidden">
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <div id="threadlist" class="threadlist">
        <form id="thread_inlinemod_form" action="inlinemod.php?forumid=69" method="post">
            <h2 class="hidden">
                Threads in This Forum</h2>
            <div>
                <div class="threadlisthead table">
                    <div>
                        <span class="threadinfo"><span class="threadtitle"><a href="forumdisplay.php?f=69&amp;sort=title&amp;order=asc"
                            rel="nofollow">Title</a> / <a href="forumdisplay.php?f=69&amp;sort=postusername&amp;order=asc"
                                rel="nofollow">Thread Starter</a> </span></span><span class="threadstats td"><a href="forumdisplay.php?f=69&amp;sort=replycount&amp;order=desc"
                                    rel="nofollow">Replies</a> / <a href="forumdisplay.php?f=69&amp;sort=views&amp;order=desc"
                                        rel="nofollow">Views</a></span> <span class="threadlastpost td"><a href="forumdisplay.php?f=69&amp;sort=lastpost&amp;order=asc"
                                            rel="nofollow">Last Post By<img title="Reverse Sort Order" class="sortarrow" src="http://b.dpstatic.com/buttons/sortarrow-white-asc.png"
                                                alt="Reverse Sort Order" border="0">
                                        </a></span>
                    </div>
                </div>
                <%--begin repeater--%>
                <asp:Repeater ID="repeaterTopics" runat="server">
                    <ItemTemplate>
                        <ol id="threads" class="threads">
                            <li class="threadbit new" id="thread_1907333">
                                <div class="rating0 nonsticky">
                                    <div class="threadinfo" title="Can we insert google adsense code to a post on a site and email the email the same ! 
 
Is it against Google term and condition to email the adsense code along with the content ? 
 
What about google for feed / can anyone just email a post(along with the google ads) recieved from the feedburner ? 
...">
                                        <!--  status icon block -->
                                        <a class="threadstatus" rel="vB::AJAX"></a>
                                        <!-- title / author block -->
                                        <div class="inner">
                                            <h3 class="threadtitle">
                                                <a href="showthread.php?t=1907333&amp;goto=newpost" id="thread_gotonew_1907333">
                                                    <img title="Go to first new post" class="gotonewpost" src="http://b.dpstatic.com/buttons/firstnew.png"
                                                        alt="Go to first new post"></a> <a class="title threadtitle_unread" href="TopicDetails.aspx?topicID=<%#Eval("TopicID") %>"
                                                            id="thread_title_1907333"><%#Eval("Title") %></a><span class="age one"><%#CountDaysOldOfTopicByTopicID(Convert.ToInt32(Eval("TopicID")))%></span>
                                            </h3>
                                            <div class="threadmeta">
                                                <p class="threaddesc">
                                                    Can we insert google adsense code to a post on a site and email the email the same
                                                    ! Is it against Google term and condition to email the adsense code along with the
                                                    content ? What about google for feed / can anyone just email a post(along with the
                                                    google ads) recieved from the feedburner ? ...</p>
                                                <div class="author">
                                                    <span class="label"><a href="member.php?u=130126" class="username understate" title="Started on Yesterday 5:52 pm">
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
                                        <li>Posts: <a href="misc.php?do=whoposted&amp;t=1907333" onclick="who(1907333); return false;"
                                            class="understate"><%#GetCountPostsByTopicID(Convert.ToInt32(Eval("TopicID"))) %></a></li>
                                        <li>Views: <%#GetTotalViewsByTopicID(Convert.ToInt32(Eval("TopicID")))%></li>
                                        <li class="hidden">Rating0 / 5</li>
                                    </ul>
                                    <!-- lastpost -->
                                    <dl class="threadlastpost td">
                                        <dt class="lastpostby hidden">Last Post By</dt>
                                        <dd>
                                            <div id="yui-gen18" class="popupmenu memberaction">
                                                <a id="yui-gen20" class="username offline popupctrl" href="Member.aspx?memberID=<%#Eval("MemberID") %>" title="mike4uuu is offline">
                                                    <strong><%#GetLastMemberPostByTopicID(Convert.ToInt32(Eval("TopicID"))).UserName%></strong></a>
                                                <ul id="yui-gen19" class="popupbody memberaction_body">
                                                    <li class="left">
                                                        <img src="http://i.dpstatic.com/site_icons/profile.png" alt="">
                                                        <a href="member.php?u=130126">View Profile </a></li>
                                                    <li class="right">
                                                        <img src="http://i.dpstatic.com/site_icons/forum.png" alt="">
                                                        <a href="search.php?do=finduser&amp;userid=130126&amp;contenttype=vBForum_Post&amp;showposts=1"
                                                            rel="nofollow">View Forum Posts </a></li>
                                                    <li class="right">
                                                        <img src="http://i.dpstatic.com/site_icons/blog.png" alt="">
                                                        <a href="http://blogs.digitalpoint.com/?u=130126" rel="nofollow">View Blog Entries </a>
                                                    </li>
                                                    <li class="right">
                                                        <img src="http://i.dpstatic.com/site_icons/article.png" alt="">
                                                        <a href="http://articles.digitalpoint.com/list.php/author/130126-mike4uuu" rel="nofollow">
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
            <hr>
            <div class="noinlinemod forumfoot">
            </div>
            <input name="url" value="" type="hidden">
            <input name="s" value="" type="hidden">
            <input name="securitytoken" value="guest" type="hidden">
            <input name="forumid" value="69" type="hidden">
        </form>
    </div>
                <%--begin Button post new Thread--%>
            <div class="noinlinemod below_threadlist" id="below_threadlist">
                <a id="newthreadlink_bottom" class="newcontent_textcontrol" rel="nofollow" href="NewTopic.aspx?subForumID=<%= Request.QueryString["subForumID"] %>">
                    <span>+</span> Post New Topic</a>
                <%--begin phan trang--%>
                <div class="threadpagenav">
                </div>
                <%--end phan trang--%>
            </div>
            <%--and button post new thread--%>
</asp:Content>
