<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="MemberProfile.aspx.cs" Inherits="GUI_MemberProfile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="breadcrumb" class="breadcrumb">
        <ul class="floatcontainer">
            <li class="navbithome"><a href="" accesskey="1">
                <img src="Images/navbit-home.png" alt="Home" /></a></li>
            <li class="navbit lastnavbit"><span><%= GetMember().UserName %></span></li>
        </ul>
        <hr />
    </div>
    <div class="member_content">
        <div class="profile_widgets member_summary" id="profile_tabs">
            <div class="block mainblock">
                <h1 class="blocksubhead">
                    <span id="userinfo"><span class="user10"><%= GetMember().UserName %></span>
                        <img class="inlineimg onlinestatus" src="Images/user-online.png"
                            alt="<%= GetMember().UserName %> is online now" border="0" />
                        <br />
                        <span class="usertitle"><%= GetMember().FullName%></span> </span>
                </h1>
                <div id="userinfoblock" class="floatcontainer">
                <% if (GetMemberProfileByMemberID().MemberID != null)
                   { %>
                                    <a class="avatar" href="member.php?u=451746" title="<%= GetMember().UserName %>'s Avatar"><span class="avatarcontainer">
                        <img src="<%= GetMemberProfileByMemberID().Avatar  %>" alt="" /></span> </a>
                        <%}else{ %>
                    <a class="avatar" href="member.php?u=451746" title="<%= GetMember().UserName %>'s Avatar"><span class="avatarcontainer">
                        <img src="Images/unknown.gif" alt="" /></span> </a>
                        <%} %>
                    <ul id="usermenu" class="usermenu">
                        <li class="separator"></li>
                        <li><a href="ViewAllTopics.aspx">
                            <img src="Images/forum.png" alt="Find all posts" class="inlineimg" />
                            Find all posts</a></li>
                        <li><a href="ViewAllPosts.aspx">
                            <img src="Images/forum.png" alt="Find all started threads"
                                class="inlineimg" />
                            Find all started threads</a></li>
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
                                <dt>Join Date</dt><dd><%= GetMember().DateCreation%></dd></dl>
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
                        <img src="Images/edit_40b.png" alt="Edit" /></a> <span class="friends_total">
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
            <div class="profile_content">
                <div id="view-visitor_messaging" class="view_section">
                </div>
                <div id="view-aboutme" class="selected_view_section">
                    <h3 class="subsectionhead">
                        <a class="textcontrol" href="member.php?u=451746&amp;tab=aboutme&amp;simple=1">View
                            your "About Me" as seen by everyone else</a> <span class="subsectiontitle">About letcomvn</span>
                    </h3>
                    
                    <!-- basic information -->
                    
                    <div class="subsection">
                        <h5 class="profilecategorytitle">
                            About <%= GetMember().FullName %></h5>
                        <div>
                            <dl class="stats">
                                <dt id="profilefield_title_1">Full Name</dt><dd id="profilefield_value_1"><%= GetMember().FullName %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "1");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_2">Email</dt><dd id="profilefield_value_2"><%= GetMember().Email %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "2");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_3">Date Creation</dt><dd id="profilefield_value_3"><%= GetMember().DateCreation %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "3");
//-->

                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_4">Blast</dt><dd id="profilefield_value_4"><%= GetMemberProfileByMemberID().Blast %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt1">Avatar</dt><dd id="Dd1"><img src="<%= GetMemberProfileByMemberID().Avatar %>" />

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt2">Country</dt><dd id="Dd2"><%= GetMemberProfileByMemberID().Country %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt3">Address</dt><dd id="Dd3"><%= GetMemberProfileByMemberID().Address %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt4">BirthDay</dt><dd id="Dd4"><%= GetMemberProfileByMemberID().BirthDay %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt5">Gender</dt><dd id="Dd5"><% if(GetMemberProfileByMemberID().Gender==true){ %>
                                            Male
                                            <% }else{ %> Female <% } %>
                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt6">Yahoo</dt><dd id="Dd6"><%= GetMemberProfileByMemberID().Yahoo %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt7">Phone</dt><dd id="Dd7"><%= GetMemberProfileByMemberID().Phone %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt8">Hospital</dt><dd id="Dd8"><%= GetMemberProfileByMemberID().Hospital %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt9">Blog</dt><dd id="Dd9"><%= GetMemberProfileByMemberID().Blog %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt10">Total Posts</dt><dd id="Dd10"><%= GetMemberProfileByMemberID().TotalPosts %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt11">Total Thanks</dt><dd id="Dd11"><%= GetMemberProfileByMemberID().TotalThanks %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt12">Total Thanked</dt><dd id="Dd12"><%= GetMemberProfileByMemberID().TotalThanked %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt13">Experience</dt><dd id="Dd13"><%= GetMemberProfileByMemberID().Experience %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt14">Professional</dt><dd id="Dd14"><%= GetMemberProfileByMemberID().Professional %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt15">Last Login</dt><dd id="Dd15"><%= GetMemberProfileByMemberID().LastLogin %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt16">My Rss</dt><dd id="Dd16">

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt17">Signature</dt><dd id="Dd17"><%= GetMemberProfileByMemberID().Signature %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt18">About Me</dt><dd id="Dd18"><%= GetMemberProfileByMemberID().AboutMe %>

                                    <script type="text/javascript">
<!--
vBulletin.register_control("vB_ProfilefieldEditor", "4");
//-->
                                    </script>

                                </dd>
                            </dl>
                        </div>
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
                                                <a href=""><b>Submit Feedback
                                                    For letcomvn</b></a><br />
                                                <a href=""><strong>View Complete
                                                    Feedbacks for letcomvn</strong></a></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="blockbody" align="center" valign="top" style="padding: 5px;">
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
                                                <img src="Images/icon_positive.png" class="inlineimg" alt="" />&nbsp;</td>
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
                                                <img src="Images/icon_neutral.png" class="inlineimg" alt="" />&nbsp;</td>
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
                                                <img src="Images/icon_negative.png" class="inlineimg" alt="" />&nbsp;</td>
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
