<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="GUI_Index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="repeaterCategories" runat="server">
        <ItemTemplate>
            <ol id="forums" class="floatcontainer">
                <li id="cat4" class="forumbit_nopost L1">
                    <%--            <div class="forumhead foruminfo L1 collapse">
                <h2>
                    <span class="forumtitle"><a href="">Search Engines</a></span> <span class="forumlastpost">
                        Last Post</span> <a href="#top" id="collapse_c_cat4" class="collapse" >
                            <img title="Collapse this Category" alt="" src="http://b.dpstatic.com/buttons/collapse_40b.png"></a>
                </h2>
            </div>--%>
                    <div class="module">
                        <div class="header">
                            <h2>
                                <span class="forumtitle"><a href="" style="color: #ffffff;">
                                    <%# Eval("CategoryName")%>
                                </a></span>
                            </h2>
                        </div>
                        <ol class="childforum" id="c_cat4">
                            <asp:Repeater ID="repeaterSubForums" runat="server" DataSource='<%#GetAllSubForumsByCategoryID(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "CategoryID"))) %>'>
                                <ItemTemplate>
                                    <li class="forumbit_post L2" id="forum5">
                                        <div class="forumrow table">
                                            <div class="foruminfo td">
                                                <img alt="" id="forum_statusicon_5" class="forumicon" src='<%#GetImageStatus(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SubForumID"))) %>'
                                                    title="Double-click this icon to mark this forum and its contents as read" style="cursor: pointer;">
                                                <div class="forumdata">
                                                    <div class="datacontainer">
                                                        <div class="titleline">
                                                            <h2 class="forumtitle">
                                                                <a href="ShowTopics.aspx?subForumID=<%# Eval("SubForumID")%>">
                                                                    <%# Eval("SubForumName")%>
                                                                </a>
                                                            </h2>
                                                            <span class="viewing">(<%= Application["ActiveUsers"].ToString()%> Viewing)</span>
                                                        </div>
                                                        <p class="forumdescription">
                                                            <%#Eval("Description")%>
                                                            .</p>
                                                        <%--  <div class="subforums">
                                                            <h4 class="subforumlistlabel">
                                                                Sub-Forums:</h4>
                                                            <ol class="subforumlist commalist">
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_27" alt="" src="http://i.dpstatic.com/statusicon/subforum_new-48.png"
                                                                        class="inlineimg" title="Double-click this icon to mark this forum and its contents as read"
                                                                        style="cursor: pointer;">
                                                                    <a href="">AdSense</a> </li>
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_35" alt="" src="http://i.dpstatic.com/statusicon/subforum_new-48.png"
                                                                        class="inlineimg" title="Double-click this icon to mark this forum and its contents as read"
                                                                        style="cursor: pointer;">
                                                                    <a href="">AdWords</a> </li>
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_112" alt="" src="http://i.dpstatic.com/statusicon/subforum_new-48.png"
                                                                        class="inlineimg" title="Double-click this icon to mark this forum and its contents as read"
                                                                        style="cursor: pointer;">
                                                                    <a href="">Analytics</a> </li>
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_131" alt="" src="http://i.dpstatic.com/statusicon/subforum_new-48.png"
                                                                        class="inlineimg" title="Double-click this icon to mark this forum and its contents as read"
                                                                        style="cursor: pointer;">
                                                                    <a href="">Affiliate Network</a> </li>
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_62" alt="" src="http://i.dpstatic.com/statusicon/subforum_new-48.png"
                                                                        class="inlineimg" title="Double-click this icon to mark this forum and its contents as read"
                                                                        style="cursor: pointer;">
                                                                    <a href="">Sitemaps</a> </li>
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_7" alt="" src="http://i.dpstatic.com/statusicon/subforum_new-48.png"
                                                                        class="inlineimg" title="Double-click this icon to mark this forum and its contents as read"
                                                                        style="cursor: pointer;">
                                                                    <a href="">Google APIs</a> </li>
                                                                <li class="subforum">
                                                                    <img border="0" id="forum_statusicon_8" alt="" src="http://i.dpstatic.com/statusicon/subforum_old-48.png"
                                                                        class="inlineimg">
                                                                    <a href="">Product Search</a> </li>
                                                            </ol>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <h4 class="nocss_label">
                                                Forum Actions:</h4>
                                            <ul class="forumactionlinks td">
                                                <li class="forumactionlink rsslink"><a title="View this forum's RSS feed" href="">View
                                                    this forum's RSS feed</a></li>
                                            </ul>
                                            <h4 class="nocss_label">
                                                Forum Statistics:</h4>
                                            <ul class="forumstats td">
                                                <li>Threads: 93,657</li>
                                                <li>Posts: 1,172,173</li>
                                            </ul>
                                            <div class="forumlastpost td">
                                                <h4 class="lastpostlabel">
                                                    Last Post:</h4>
                                                <div>
                                                    <p class="lastposttitle">
                                                        <a title="Go to first unread post in thread 'Anyone work with YouTube API?'" class="threadtitle"
                                                            href="#"><%# GetNewPostBySubForumID(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SubForumID"))).Title %></a> <a href="">
                                                                <img alt="Go to last post" src="http://b.dpstatic.com/buttons/lastpost-right.png"
                                                                    title="Go to last post"></a>
                                                    </p>
                                                    <div class="lastpostby">
                                                        by
                                                        <div class="popupmenu memberaction" id="yui-gen11">
                                                            <a title="faizagul is offline" href="" class="username offline popupctrl" id="yui-gen13">
                                                                <strong>faizagul</strong></a>
                                                            <ul class="popupbody memberaction_body" id="yui-gen12">
                                                                <li class="left">
                                                                    <img alt="" src="http://i.dpstatic.com/site_icons/profile.png">
                                                                    <a href="">View Profile </a></li>
                                                                <li class="right">
                                                                    <img alt="" src="http://i.dpstatic.com/site_icons/forum.png">
                                                                    <a rel="nofollow" href="">View Forum Posts </a></li>
                                                                <li class="right">
                                                                    <img alt="" src="http://i.dpstatic.com/site_icons/blog.png">
                                                                    <a rel="nofollow" href="http://blogs.digitalpoint.com/?u=451701">View Blog Entries </a>
                                                                </li>
                                                                <li class="right">
                                                                    <img alt="" src="http://i.dpstatic.com/site_icons/article.png">
                                                                    <a rel="nofollow" href="http://articles.digitalpoint.com/list.php/author/451701-faizagul">
                                                                        View Articles </a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <p class="lastpostdate">
                                                        Today <span class="time">5:48 am</span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ol>
                    </div>
                </li>
            </ol>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
