<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="MemberProfile.aspx.cs" Inherits="GUI_MemberProfile" Title="Member Profile" %>

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
                <% if (GetMemberProfileByMemberID().MemberID.ToString() != null)
                   { %>
                                    <a class="avatar" href="" title="<%= GetMember().UserName %>'s Avatar"><span class="avatarcontainer">
                        <img src="<%= GetMemberProfileByMemberID().Avatar  %>" alt="" /></span> </a>
                        <%}else{ %>
                    <a class="avatar" href="" title="<%= GetMember().UserName %>'s Avatar"><span class="avatarcontainer">
                        <img src="Images/unknown.gif" alt="" /></span> </a>
                        <%} %>
                    <ul id="usermenu" class="usermenu">
                        <li class="separator"></li>
                        <li><a href="ViewAllTopics.aspx?memberID=<%= GetMember().MemberID %>">
                            <img src="Images/forum.png" alt="Find all Topics" class="inlineimg" />
                            Find all Topics</a></li>
                        <%--<li><a href="ViewAllPosts.aspx">
                            <img src="Images/forum.png" alt="Find all posts"
                                class="inlineimg" />
                            Find all posts</a></li>--%>
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

        </div>
        <div class="member_tabs">
            <div class="profile_content">
                <div id="view-visitor_messaging" class="view_section">
                </div>
                <div id="view-aboutme" class="selected_view_section">
                   
                    <!-- basic information -->
                    
                    <div class="subsection">
                        <h5 class="profilecategorytitle">
                            About <%= GetMember().FullName %></h5>
                        <div>
                            <dl class="stats">
                                <dt id="profilefield_title_1">Full Name</dt><dd id="profilefield_value_1"><%= GetMember().FullName %>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_2">Email</dt><dd id="profilefield_value_2"><%= GetMember().Email %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_3">Date Creation</dt><dd id="profilefield_value_3"><%= GetMember().DateCreation %>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="profilefield_title_4">Blast</dt><dd id="profilefield_value_4"><%= GetMemberProfileByMemberID().Blast %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt1">Avatar</dt><dd id="Dd1"><img src="<%= GetMemberProfileByMemberID().Avatar %>" />
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt2">Country</dt><dd id="Dd2"><%= GetMemberProfileByMemberID().Country %>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt3">Address</dt><dd id="Dd3"><%= GetMemberProfileByMemberID().Address %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt4">BirthDay</dt><dd id="Dd4"><%= GetMemberProfileByMemberID().BirthDay %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt5">Gender</dt><dd id="Dd5"><% if(GetMemberProfileByMemberID().Gender==true){ %>
                                            Male
                                            <% }else{ %> Female <% } %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt6">Yahoo</dt><dd id="Dd6"><%= GetMemberProfileByMemberID().Yahoo %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt7">Phone</dt><dd id="Dd7"><%= GetMemberProfileByMemberID().Phone %>

                               </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt8">Hospital</dt><dd id="Dd8"><%= GetMemberProfileByMemberID().Hospital %>

                               </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt9">Blog</dt><dd id="Dd9"><%= GetMemberProfileByMemberID().Blog %>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt10">Total Posts</dt><dd id="Dd10"><%= GetMemberProfileByMemberID().TotalPosts %>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt11">Total Thanks</dt><dd id="Dd11"><%= GetMemberProfileByMemberID().TotalThanks %>

                               </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt12">Total Thanked</dt><dd id="Dd12"><%= GetMemberProfileByMemberID().TotalThanked %>

                               </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt13">Experience</dt><dd id="Dd13"><%= GetMemberProfileByMemberID().Experience %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt14">Professional</dt><dd id="Dd14"><%= GetMemberProfileByMemberID().Professional %>

                               </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt15">Last Login</dt><dd id="Dd15"><%= GetMemberProfileByMemberID().LastLogin %>
                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt17">Signature</dt><dd id="Dd17"><%= GetMemberProfileByMemberID().Signature %>

                                </dd>
                            </dl>
                            <dl class="stats">
                                <dt id="Dt18">About Me</dt><dd id="Dd18"><%= GetMemberProfileByMemberID().AboutMe %>

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
                <!-- / cat_itrader_stats -->
            </div>
        </div>
</asp:Content>
