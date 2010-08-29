<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="GUI_Search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
    $(function() {
		$("#<%= txtFromDateCreate.ClientID %>").datepicker();
		$("#<%= txtToDateCreate.ClientID %>").datepicker();
	});
    </script>

    <div id="breadcrumb" class="breadcrumb">
        <hr />
    </div>
    <h2 class="blockhead">
        Advance Search</h2>
    <div class="blockbody formcontrols">
        <h3 class="blocksubhead">
            Search In</h3>
        <div class="section">
            <div class="blockrow">
                <label>
                    Search Types:</label>
            </div>
        </div>
        <h3 class="blocksubhead">
            Search For</h3>
        <div class="section">
            <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
                <contenttemplate>
<div class="blockrow"><label>Search in:</label> <ul class="multifield group"><li><asp:DropDownList id="DropDownList1" runat="server" Width="248px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList> </li><li><asp:DropDownList id="DropDownList2" runat="server" Enabled="False">
                                </asp:DropDownList> </li></ul></div>
</contenttemplate>
            </asp:UpdatePanel>
            <div class="blockrow">
                <label>
                    Keyword(s):</label>
                <ul class="multifield group">
                    <li>
                        <asp:TextBox ID="txtKeySearch" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label>
                    User Name:</label>
                <ul class="multifield group">
                    <li>
                        <asp:TextBox ID="txtKeyUserName" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label for="searchdate">
                    Find Posts</label>
                <ul class="multifield group">
                    <li>
                        <asp:TextBox ID="txtFromDateCreate" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                    <li>
                        <asp:TextBox ID="txtToDateCreate" runat="server" CssClass="textbox"></asp:TextBox>
                    </li>
                </ul>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="Button1" runat="server" Text="Search now" CssClass="button" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Search now" CssClass="button" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
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
                                            </strong></a>

                                        </ul>
                                    </div>
                                </dd>
                                <dd>
                                    <%#GetLastPostOfTopicByTopicID(Convert.ToInt32(Eval("TopicID"))).DateCreation%>
                                    <em class="time"></em><a href="TopicDetails.aspx?topicIDLastPost=<%#Eval("TopicID") %>"
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
    </div>
    <br />
    <%--End result--%>
</asp:Content>
