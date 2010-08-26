<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="MemberProfile.aspx.cs" Inherits="GUI_MemberProfile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="breadcrumb" class="breadcrumb">
        <ul class="floatcontainer">
            <li class="navbithome"><a href="" accesskey="1">
                <img src="http://m.dpstatic.com/misc/navbit-home.png" alt="Home" /></a></li>
            <li class="navbit lastnavbit"><span>letcomvn</span></li>
        </ul>
        <hr />
    </div>
    <div class="member_content">
        <div class="profile_widgets member_summary" id="profile_tabs">
            <div class="block mainblock">
                <h1 class="blocksubhead">
                    <span id="userinfo"><span class="user10">letcomvn</span>
                        <img class="inlineimg onlinestatus" src="http://i.dpstatic.com/statusicon/user-online.png"
                            alt="letcomvn is online now" border="0" />
                        <br />
                        <span class="usertitle">Peon</span> </span>
                </h1>
                <div id="userinfoblock" class="floatcontainer">
                    <a class="avatar" href="member.php?u=451746" title="letcomvn's Avatar"><span class="avatarcontainer">
                        <img src="http://m.dpstatic.com/misc/unknown.gif" alt="" /></span> </a>
                    <ul id="usermenu" class="usermenu">
                        <li><a href="private.php?do=newpm&amp;u=451746">
                            <img src="http://i.dpstatic.com/site_icons/message.png" alt="Send Private Message"
                                class="inlineimg" />
                            Send Private Message</a></li>
                        <li><a href="sendmessage.php?do=mailmember&amp;u=451746">
                            <img src="http://i.dpstatic.com/site_icons/email.png" alt="Email" class="inlineimg" />
                            Send Email</a> </li>
                        <li class="separator"></li>
                        <li><a href="search.php?do=finduser&amp;userid=451746&amp;contenttype=vBForum_Post&amp;showposts=1">
                            <img src="http://i.dpstatic.com/site_icons/forum.png" alt="Find all posts" class="inlineimg" />
                            Find all posts</a></li>
                        <li><a href="search.php?do=finduser&amp;userid=451746&amp;starteronly=1&amp;contenttype=vBForum_Thread">
                            <img src="http://i.dpstatic.com/site_icons/forum.png" alt="Find all started threads"
                                class="inlineimg" />
                            Find all started threads</a></li>
                        <li><a href="http://articles.digitalpoint.com/list.php?r=author/451746-letcomvn"
                            rel='nofollow'>
                            <img src="http://i.dpstatic.com/site_icons/article.png" class="inlineimg" alt="" />
                            View Articles</a></li>
                        <li><a href="http://blogs.digitalpoint.com/?u=451746" rel='nofollow'>
                            <img src="http://i.dpstatic.com/site_icons/blog.png" class="inlineimg" alt="" />
                            View Blog Entries</a></li>
                    </ul>
                </div>
            </div>
            <div class="underblock">
            </div>
            <!-- stats_mini -->
            <div id="view-stats_mini" class="block">
                <div class="mini_stats">
                    <div class="userinfo blockbody">
                        <h5 class="blocksubhead smaller">
                            Mini Statistics</h5>
                        <div class="blockrow">
                            <dl class="stats">
                                <dt>Join Date</dt>
                                <dd>
                                    Aug 8th 2010</dd>
                            </dl>
                            <dl class="stats">
                                <dt>Current Activity</dt>
                                <dd>
                                    Viewing User Profile
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt>Last Activity</dt>
                                <dd>
                                    Today <span class="time">12:44 pm</span></dd>
                            </dl>
                            <dl class="stats">
                                <dt>Blog Entries</dt>
                                <dd>
                                    0</dd>
                            </dl>
                        </div>
                    </div>
                    <!-- blockbody -->
                </div>
                <!-- widget block mini_stats -->
            </div>
            <div class="underblock">
            </div>
            <!-- / stats_mini -->
            <div class="friends_mini friends block">
                <h5 class="blocksubhead smaller">
                    <a class="textcontrol imagecontrol" href="profile.php?do=buddylist">
                        <img src="http://b.dpstatic.com/buttons/edit_40b.png" alt="Edit" /></a> <span class="friends_total">
                            0</span> Friends
                </h5>
                <div class="blockbody">
                    <div class="blockrow">
                        <!--<ul class="friendcontrol">
</ul>-->
                        <div>
                            Your friends list is empty
                        </div>
                    </div>
                </div>
            </div>
            <div class="underblock">
            </div>
            <div class="underblock">
            </div>
            <!-- groups -->
            <div id="view-groups" class="block">
                <div class="groups">
                    <h5 class="blocksubhead smaller">
                        <a href="group.php" class="textcontrol">Join Groups</a> <span class="group_count">0</span>
                        Groups
                    </h5>
                    <div class="allgroups blockbody">
                        <div class="blockrow">
                            You are not a member of any groups
                        </div>
                    </div>
                </div>
                <!-- This is to emulate the block separator in template memberinfo_block -->
            </div>
            <div class="underblock">
            </div>
            <div class="block">
                <!-- / Done block separator -->
                <div class="groups">
                    <h5 class="blocksubhead smaller">
                        <a href="profile.php?do=editusergroups" class="textcontrol">Join Groups</a> <span
                            class="group_count">0</span> Permission Groups
                    </h5>
                    <div class="allgroups blockbody">
                        <div class="blockrow">
                            You are not a member of any groups
                        </div>
                    </div>
                </div>
            </div>
            <div class="underblock">
            </div>
            <!-- / groups -->
            <!-- visitors -->
            <div id="view-visitors" class="block">
                <div class="visitors">
                    <h5 class="blocksubhead smaller">
                        Recent Visitors</h5>
                    <div class="blockbody">
                        <div class="blockrow">
                            <span class="totalvisits">This page has had <strong>0</strong> visits</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="underblock">
            </div>
            <!-- / visitors -->
        </div>
        <div class="member_tabs">
            <dl class="tabslight">
                <dt>Tab Content</dt>
                <dd>
                    <a id="cat_itrader_stats-tab" href="member.php?u=451746#cat_itrader_stats" onclick="return tabViewPicker(this);">
                        Feedback Score</a></dd>
                <dd class="selected">
                    <a id="aboutme-tab" href="member.php?u=451746#aboutme" onclick="return tabViewPicker(this);">
                        About Me</a></dd>
                <dd>
                    <a id="friends-tab" href="member.php?u=451746#friends-content" onclick="return tabViewPicker(this);">
                        Friends</a></dd>
                <dd>
                    <a id="postareas-tab" href="member.php?u=451746#postareas" onclick="return tabViewPicker(this);">
                        Post Areas</a></dd>
            </dl>
            <div class="profile_content">
                <div id="view-visitor_messaging" class="view_section">
                </div>
                <div id="view-aboutme" class="selected_view_section">
                    <h3 class="subsectionhead">
                        <a class="textcontrol" href="member.php?u=451746&amp;tab=aboutme&amp;simple=1">View
                            your "About Me" as seen by everyone else</a> <span class="subsectiontitle">About letcomvn</span>
                    </h3>
                    <!-- basic information -->
                    <h4 class="subsectionhead-understate" id="about-me">
                        Basic Information</h4>
                    <div class="subsection">
                        <h5 class="profilecategorytitle">
                            About letcomvn</h5>
                        <div>
                            <dl class="stats">
                                <dt id="profilefield_title_1">Biography</dt>
                                <dd id="profilefield_value_1">
                                    N/A

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "1");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_2">Location</dt>
                                <dd id="profilefield_value_2">
                                    N/A

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "2");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_3">Interests</dt>
                                <dd id="profilefield_value_3">
                                    N/A

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "3");
//-->

                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_4">Occupation</dt>
                                <dd id="profilefield_value_4">
                                    N/A

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                        </div>
                    </div>
                    <!-- contactinfo -->
                    <div id="view-contactinfo" class="block">
                        <!-- contact information -->
                        <h4 class="subsectionhead-understate" id="contact-info">
                            Contact</h4>
                        <div class="subsection">
                            <dl class="stats">
                                <dt>This Page</dt>
                                <dd>
                                    <a href="http://forums.digitalpoint.com/member.php?u=451746">http://forums.digitalpoint.com/member.php?u=451746</a></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="underblock">
                    </div>
                    <!-- / contactinfo -->
                    <!-- stats -->
                    <div id="view-stats" class="block">
                        <!-- Statistics -->
                        <h4 id="view-statistics" class="subsectionhead-understate">
                            Statistics</h4>
                        <div class="subsection">
                            <h5 class="subsubsectionhead">
                                Total Posts</h5>
                            <dl class="stats">
                                <dt>Total Posts</dt>
                                <dd>
                                    0</dd>
                            </dl>
                            <dl class="stats">
                                <dt>Posts Per Day</dt>
                                <dd>
                                    0</dd>
                            </dl>
                            <h5 class="subsubsectionhead">
                                General Information</h5>
                            <dl class="stats">
                                <dt>Last Activity</dt>
                                <dd>
                                    Today <span class="time">12:44 pm</span></dd>
                            </dl>
                            <dl class="stats">
                                <dt>Current Activity</dt>
                                <dd>
                                    Viewing User Profile
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt>Join Date</dt>
                                <dd>
                                    Aug 8th 2010</dd>
                            </dl>
                            <dl class="stats">
                                <dt>Referrals</dt>
                                <dd>
                                    0</dd>
                            </dl>
                        </div>
                        <!-- view-statistics -->
                    </div>
                    <div class="underblock">
                    </div>
                    <!-- / stats -->
                </div>
                <div id="view-friends-content" class="view_section">
                    <h3 class="subsectionhead" id="friends">
                        <a class="textcontrol" href="profile.php?do=buddylist">Edit Your Friends List</a>
                        <span class="subsectiontitle">Friends</span>
                    </h3>
                    <div>
                        <div>
                            Your friends list is empty
                        </div>
                    </div>
                    <!-- view-friends -->
                </div>
                <div id="view-infractions-content" class="view_section">
                </div>
                <div id="view-postareas" class="view_section">
                    <h4 class="subsectionhead-understate">
                        Top Areas Of Posting</h4>
                    <div class="subsection">
                    </div>
                </div>
                <div id="view-cat_itrader_stats" class="view_section">
                    <div class="subsection">
                        <table class="tborder" border="0" width="100%" align="center">
                            <tr>
                                <td class="blocksubhead" align="center">
                                    iTrader Profile</td>
                                <td class="blocksubhead" align="center">
                                    Recent Ratings</td>
                            </tr>
                            <tr>
                                <td class="blockbody" valign="top" align="left" style="padding: 5px;">
                                    <table border="0" width="100%" align="center">
                                        <tr>
                                            <td>
                                                <strong>Feedback Score:</strong><br />
                                                <strong>Positive Feedback:</strong></td>
                                            <td>
                                                <strong>0<br />
                                                    0%</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Members who left positive:<br />
                                                Members who left negative:</td>
                                            <td>
                                                0<br />
                                                0</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Total positive feedback:</td>
                                            <td>
                                                0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <a href="http://forums.digitalpoint.com/itrader_feedback.php?u=451746"><b>Submit Feedback
                                                    For letcomvn</b></a><br />
                                                <a href="http://forums.digitalpoint.com/itrader.php?u=451746"><strong>View Complete
                                                    Feedbacks for letcomvn</strong></a></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="blockbody" align="center" valign="top" align="left" style="padding: 5px;">
                                    <table border="0" width="100%" align="center">
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td align="center">
                                                Past<br />
                                                Month</td>
                                            <td align="center">
                                                Past<br />
                                                6 Months</td>
                                            <td align="center">
                                                Past<br />
                                                12 Months</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="alt2" style="padding: 1px">
                                            </td>
                                        </tr>
                                        <tr style="color: #008000;">
                                            <td align="left">
                                                <img src="http://i.dpstatic.com/itrader/icon_positive.png" class="inlineimg" alt="" />&nbsp;</td>
                                            <td align="center">
                                                0</td>
                                            <td align="center">
                                                0</td>
                                            <td align="center">
                                                0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="alt2" style="padding: 1px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <img src="http://i.dpstatic.com/itrader/icon_neutral.png" class="inlineimg" alt="" />&nbsp;</td>
                                            <td align="center">
                                                0</td>
                                            <td align="center">
                                                0</td>
                                            <td align="center">
                                                0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="alt2" style="padding: 1px">
                                            </td>
                                        </tr>
                                        <tr style="color: #FF0000;">
                                            <td align="left">
                                                <img src="http://i.dpstatic.com/itrader/icon_negative.png" class="inlineimg" alt="" />&nbsp;</td>
                                            <td align="center">
                                                0</td>
                                            <td align="center">
                                                0</td>
                                            <td align="center">
                                                0</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="underblock">
                </div>
                <!-- / cat_itrader_stats -->
            </div>
        </div>
    </div>
</asp:Content>
