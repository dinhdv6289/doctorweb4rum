<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShowTopics.aspx.cs" Inherits="GUI_ShowTopics" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="above_threadlist" id="above_threadlist">
    <asp:LinkButton ID="LinkButton2" runat="server"  CssClass="newcontent_textcontrol" OnClick="LinkButton2_Click"><span>+ </span>Post New Topic</asp:LinkButton>
<%--        <a id="newthreadlink_top" class="newcontent_textcontrol" rel="nofollow" href="NewTopic.aspx?subForumID=<%= Request.QueryString["subForumID"] %>">
            <span>+</span> Post New Topic</a>--%>
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
    <div id="threadlist" class="threadlist">
        <div>
            <div class="threadlisthead table">
                <div>
                    <span class="threadinfo">Title / Thread Starter </span><span class="threadstats td">
                        Replies / Views</span> <span class="threadlastpost td">Last Post By</span>
                </div>
            </div>
            <%--begin repeater--%>
            <asp:Repeater ID="repeaterTopics" runat="server">
                <ItemTemplate>
                    <ol id="threads" class="threads">
                        <li class="threadbit new" id="thread_1907333">
                            <div class="<%#GetRating(Convert.ToInt32(Eval("TopicID"))) %> nonsticky">
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
            <%--end repeater--%>
        </div>
    </div>
    <br />
    <br />
    <%--begin Button post new Thread--%>
    <div class="noinlinemod below_threadlist" id="below_threadlist">
<%--        <a id="newthreadlink_bottom" class="newcontent_textcontrol" rel="nofollow" href="NewTopic.aspx?subForumID=<%= Request.QueryString["subForumID"] %>">
            <span>+</span> Post New Topic</a>--%>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="newcontent_textcontrol"><span>+ </span>Post New Topic</asp:LinkButton>
        <%--begin phan trang--%>
        <div class="threadpagenav">
            <CC1:COLLECTIONPAGER id="CollectionPager1" runat="server" ResultsLocation="None" ShowFirstLast="True" BackNextLocation="Split" BackNextDisplay="HyperLinks" PageSize="15" ControlCssClass="pagination" ShowLabel="False" PageNumbersDisplay="Numbers" PageNumbersSeparator="&nbsp;" BackNextButtonStyle="" BackNextLinkSeparator="" BackNextStyle="" ShowPageNumbers="True" SliderSize="3" UseSlider="True" IgnoreQueryString="False" ResultsFormat="Results  {0} to {1} of {2}" ResultsStyle="float:left;"></CC1:COLLECTIONPAGER>
        </div>
        <%--end phan trang--%>
    </div>
    <br />
    <br />
    <%--and button post new thread--%>
</asp:Content>
