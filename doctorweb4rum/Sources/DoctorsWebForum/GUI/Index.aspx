<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="GUI_Index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div><span style="font-family: Verdana; font-size: 0.8em;">
<span style="color: rgb(51, 51, 51); font-weight: bold;">Doctors Web Forum</span></span> <br /><br />
<div>
<hr />
</div>
    <asp:Repeater ID="repeaterCategories" runat="server">
        <ItemTemplate>
            <ol id="forums" class="floatcontainer">
                <li class="forumbit_nopost L1">
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
                                                <img alt="" id="forum_statusicon_5" class="forumicon" src='<%#GetImageStatus(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SubForumID"))) %>' style="cursor: pointer;">
                                                <div class="forumdata">
                                                    <div class="datacontainer">
                                                        <div class="titleline">
                                                            <h2 class="forumtitle">
                                                                <a href="ShowTopics.aspx?subForumID=<%# Eval("SubForumID")%>">
                                                                    <%# Eval("SubForumName")%>
                                                                </a>
                                                            </h2>
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
                                                <li>Topics: <%#CountTopicsInSubForumBySubForumID(Convert.ToInt32(Eval("SubForumID")))%></li>
                                                <li>Posts:  <%#GetCountPostBySubForumID(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SubForumID")))%></li>
                                            </ul>
                                            <%#GetLastPostInformationBySubForumID(Convert.ToInt32( Eval("SubForumID")))%>
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
