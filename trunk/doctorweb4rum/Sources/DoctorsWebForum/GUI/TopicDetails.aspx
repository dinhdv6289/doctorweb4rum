<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="TopicDetails.aspx.cs" Inherits="GUI_TopicDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <br />
<div>
<hr />
</div>
    <div class="pagetitle" id="pagetitle">
        <h1>
            Thread: <span class="threadtitle"><a title="Reload this Page" href="TopicDetails.aspx?topicID=<%= GetTopic().TopicID %>">
                <%= GetTopic().Title%></a></span>
        </h1>
    </div>
    <div class="thread_controls" id="thread_controls">
        <div>
            <ul class="postlist_popups popupgroup" id="postlist_popups">
                <li class="popupmenu" id="yui-gen11">
                    <h6>
                        <a href="showthread.php?t=1891188#post14788193" class="firstunread">View First Unread
                        </a>
                    </h6>
                </li>
                <li id="threadtools" class="popupmenu">
                    <h6>
                        <a href="javascript://" class="popupctrl" id="yui-gen13">Thread Tools</a></h6>
                    <ul class="popupbody" id="yui-gen12">
                        <li><a rel="nofollow" accesskey="3" href="printthread.php?t=1891188&amp;pp=20&amp;page=1">
                            Show Printable Version</a></li>
                        <li><a rel="nofollow" href="sendmessage.php?do=sendtofriend&amp;t=1891188">Email this
                            Page…</a></li>
                        <li><a rel="nofollow" href="subscription.php?do=addsubscription&amp;t=1891188">Subscribe
                            to this Thread…</a> </li>
                    </ul>
                </li>
                <li id="searchthread" class="popupmenu searchthread">
                    <h6>
                        <a href="javascript://" class="popupctrl" id="yui-gen15">Search Thread</a></h6>
                    <form method="post" action="search.php">
                        <ul class="popupbody" id="yui-gen14">
                            <li>
                                <input type="text" tabindex="13" value="Search..." class="searchbox" name="query">
                                <input type="submit" tabindex="14" value="Search" class="button">
                            </li>
                            <li class="formsubmit">
                                <div>
                                    <a href="search.php?search_type=1&amp;searchthreadid=1891188&amp;contenttype=vBForum_Post"
                                        class="advancedsearchlink">Advanced Search</a></div>
                            </li>
                        </ul>
                        <input type="hidden" value="" name="s">
                        <input type="hidden" value="guest" name="securitytoken">
                        <input type="hidden" value="process" name="do">
                        <input type="hidden" value="1891188" name="searchthreadid">
                        <input type="hidden" value="1" name="search_type">
                        <input type="hidden" value="vBForum_Post" name="contenttype">
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <div class="postlist restrain" id="postlist">
        <ol start="1" class="posts" id="posts">
            <li id="post_14688639" class="postbit postbitim postcontainer">
                <div class="postdetails_noavatar">
                    <div class="posthead">
                        <span class="postdate old"><span class="date"><%= GetTopic().DateLastPost %></span> </span><span class="nodecontrols"><a class="postcounter" href="showthread.php?t=1891188&amp;p=14688639#post14688639"
                                name="post14688639">#1</a><a name="1" id="postcount14688639"></a> </span>
                    </div>
                    <div class="userinfo_noavatar">
                        <div class="contact">
                            <div class="username_container">
                                <div class="popupmenu memberaction" id="yui-gen16">
                                    <a title="maihannijat is offline" href="member.php?u=429236" class="username offline popupctrl"
                                        id="yui-gen18"><strong><span class="user25"><%= GetMemberByMemberID(GetTopic().MemberID).UserName %></span></strong></a>
                                    <ul class="popupbody memberaction_body" id="yui-gen17">
                                        <li class="left">
                                            <img alt="" src="http://i.dpstatic.com/site_icons/profile.png">
                                            <a href="member.php?u=429236">View Profile </a></li>
                                        <li class="right">
                                            <img alt="" src="http://i.dpstatic.com/site_icons/forum.png">
                                            <a rel="nofollow" href="search.php?do=finduser&amp;userid=429236&amp;contenttype=vBForum_Post&amp;showposts=1">
                                                View Forum Posts </a></li>
                                        <li class="left">
                                            <img alt="" src="http://i.dpstatic.com/site_icons/message.png">
                                            <a rel="nofollow" href="private.php?do=newpm&amp;u=429236">Private Message </a></li>
                                        <li class="right">
                                            <img alt="" src="http://i.dpstatic.com/site_icons/blog.png">
                                            <a rel="nofollow" href="http://blogs.digitalpoint.com/?u=429236">View Blog Entries </a>
                                        </li>
                                        <li class="left">
                                            <img alt="" src="http://i.dpstatic.com/site_icons/homepage.png">
                                            <a rel="nofollow" href="http://www.AfgPictures.com">Visit Homepage </a></li>
                                        <li class="right">
                                            <img alt="" src="http://i.dpstatic.com/site_icons/article.png">
                                            <a rel="nofollow" href="http://articles.digitalpoint.com/list.php/author/429236-maihannijat">
                                                View Articles </a></li>
                                    </ul>
                                </div>
                                <img border="0" alt="maihannijat is offline" src="http://i.dpstatic.com/statusicon/user-offline.png"
                                    class="inlineimg onlinestatus" title="maihannijat is offline">
                                <span class="usertitle">Peon </span><span id="repdisplay_14688639_429236" class="postbit_reputation">
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
                                    Jun 2010</dd>
                                <dt>Location</dt>
                                <dd>
                                    Afghanistan</dd>
                                <dt>Posts</dt>
                                <dd>
                                    13</dd>
                            </dl>
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
                            <a id="qr_14688798" class='quickreply' href="newreply.php?do=newreply&amp;p=14688798"
                                rel="nofollow">
                                <img id="replyimg_14688798" src="clear.gif" alt="" />
                                Reply</a> <span class="seperator">&nbsp;</span> <a rel="nofollow" href="newreply.php?do=newreply&amp;p=14688639"
                                    class="newreply" id="qrwq_14688639">Reply With Quote</a><span class="seperator">&nbsp;</span>
                            <span class="postlinking"></span><a class='multiquote' href="newreply.php?do=newreply&amp;p=14688639"
                                rel="nofollow" onclick="return false;" id="mq_14688639">
                                <img id="mq_image_14688639" src="clear.gif" alt="" />&nbsp;</a> </span><span class="postlinking">
                                    <span title="14688639" class="reputationpopupmenu popupmenu popupcustom" id="yui-gen71">
                                        <a id="reputation_14688639" rel="nofollow" title="Add to this user's reputation"
                                            href="reputation.php?do=addreputation&amp;p=14688639" class="popupctrl reputation">
                                            <!--<img src="http://b.dpstatic.com/buttons/reputation-40b.png" alt="Add to this user's reputation" />-->
                                            &nbsp;</a></span> &nbsp;<a title="Report Post" rel="nofollow" href="report.php?p=14688639"
                                                class="report"><!-- <img src="http://b.dpstatic.com/buttons/report-40b.png" alt="Report Post" /> -->&nbsp;</a>
                                    &nbsp; </span>
                    </div>
                </div>
                <hr>
            </li>
            <li class="postbit" id="adsense_inline">

                <script type="text/javascript">&lt;!--
google_ad_client = "pub-5676236325709660";
google_ad_width = 728;google_ad_height = 90;
google_ad_slot = "4486070640";//--&gt;</script>

                <script src="http://pagead2.googlesyndication.com/pagead/show_ads.js" type="text/javascript">
</script>

            </li>
        </ol>
        <div class="separator">
        </div>
        <div class="postlistfoot">
        </div>
    </div>
</asp:Content>
