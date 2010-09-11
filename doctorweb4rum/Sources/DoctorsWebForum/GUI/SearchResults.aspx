<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="GUI_SearchResults" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%-- Begin result--%>
    <div id="threadlist" class="threadlist">
        <div class="threadlisthead table">
            <div>
                <span class="threadinfo"><span class="threadtitle">Title / Thread Starter </span></span>
                <span class="threadstats td">Replies / Views</span> <span class="threadlastpost td">
                    Last Post By</span>
            </div>
        </div>
        <asp:Repeater ID="repeaterTopics" runat="server">
            <ItemTemplate>
                <ol id="threads" class="threads">
                    <li class="threadbit new" id="thread_1907333">
                        <div class="rating0 nonsticky">
                            <div class="threadinfo" title="">
                                <!--  status icon block -->
                                <a class="threadstatus" rel="vB::AJAX"></a>
                                <!-- title / author block -->
                                <div class="inner">
                                    <h3 class="threadtitle">
                                        <a class="title threadtitle_unread" href="TopicDetails.aspx?topicID=<%#Eval("TopicID") %>"
                                            id="thread_title_1907333">
                                            <%#Eval("Title") %>
                                        </a><span class="age">
                                            <%#CountDaysOldOfTopicByTopicID(Convert.ToInt32(Eval("TopicID")))%>
                                        </span>
                                    </h3>
                                    <div class="threadmeta">
                                        <div class="author">
                                            <span class="label"><a href="" class="username understate">
                                                <%#GetMemberOfTopicByTopicID(Convert.ToInt32(Eval("TopicID"))).UserName%>
                                            </a></span>
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
                                <li>Replies:
                                    <%#GetCountPostsByTopicID(Convert.ToInt32(Eval("TopicID"))) %>
                                </li>
                                <li>Views:
                                    <%#GetTotalViewsByTopicID(Convert.ToInt32(Eval("TopicID")))%>
                                </li>
                                <li class="hidden">Rating0 / 5</li>
                            </ul>
                            <!-- lastpost -->
                            <dl class="threadlastpost td">
                                <dd>
                                    <div class="popupmenu memberaction">
                                        <a class="username" href="Member.aspx?memberID=<%#Eval("MemberID") %>"><strong>
                                            <%#GetLastMemberPostByTopicID(Convert.ToInt32(Eval("TopicID"))).UserName%>
                                        </strong></a></ul>
                                    </div>
                                </dd>
                                <dd>
                                    <%#GetLastPostOfTopicByTopicID(Convert.ToInt32(Eval("TopicID"))).DateCreation%>
                                    <em class="time"></em><a href="TopicDetails.aspx?topicIDLastPost=<%#Eval("TopicID") %>"
                                        class="lastpostdate understate" title="Go to last post">
                                        <img title="Go to last post" src="Images/lastpost-right.png"
                                            alt="Go to last post"></a>
                                </dd>
                            </dl>
                        </div>
                    </li>
                </ol>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <br />
    <%--End result--%>
</asp:Content>

