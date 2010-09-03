<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="GUI_Index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <span style="font-family: Verdana; font-size: 0.8em;"><span style="color: rgb(51, 51, 51);
            font-weight: bold;">Doctors Web Forum</span></span>
        <div>
            <!-- what's going on box -->
            <div id="Div1" class="collapse wgo_block">
                <h2>
                    <span><a href="#" src="Images/forum_stats.png" alt="Doctors Web Forums Statistics">Doctors
                        Web Forums Statistics</a></span>
                </h2>
                <div class="floatcontainer">
                    <!-- logged-in users -->
                    <div id="Div2" class="wgo_subblock">
                        <h3>
                            <img src="Images/users_online.png" alt="Currently Active Users" />Currently Active
                            Users</h3>
                        <div>
                            <p>
                                There are currently <a href="#">
                                    <%= Application["ActiveUsers"].ToString()%>
                                    users online</a>. <span class="shade">
                                        <%= MembersOnline().ToString()%>
                                        members and
                                        <%= (Convert.ToInt32(Application["ActiveUsers"].ToString()) - MembersOnline())
                                        %>
                                        guests</span>
                                <div>
                                    <%= GetStatistics() %>
                                </div>
                            </p>
                        </div>
                    </div>
                    <!-- end logged-in users -->
                    <div id="Div3" class="wgo_subblock">
                    </div>
                </div>
            </div>
            <!-- end what's going on box -->
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
                                                    <img alt="" id="forum_statusicon_5" class="forumicon" src='<%#GetImageStatus(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SubForumID"))) %>'
                                                        style="cursor: pointer;">
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
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h4 class="nocss_label">
                                                    Forum Actions:</h4>
                                                <h4 class="nocss_label">
                                                    Forum Statistics:</h4>
                                                <ul class="forumstats td">
                                                    <li>Topics:
                                                        <%#CountTopicsInSubForumBySubForumID(Convert.ToInt32(Eval("SubForumID")))%>
                                                    </li>
                                                    <li>Posts:
                                                        <%#GetCountPostBySubForumID(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SubForumID")))%>
                                                    </li>
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
