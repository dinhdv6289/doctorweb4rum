<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewTopic.aspx.cs" Inherits="GUI_NewTopic" Title="Untitled Page" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="vbform block">
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">

                <div class="blockrow">
                    You are creating a new thread in <span class="bold"><%= GetSubForumBySubForumID().SubForumName %></span>
                    <div style="padding: 10px;">
                        <span class="bold">Description:</span> <%= GetSubForumBySubForumID().Description %><br>
                        <br>
                        <li>
                            <label for="cb_confirm_forum">
                                <%--<input type="checkbox" onclick="double_check_confirm();" tabindex="1" value="1" id="cb_confirm_forum"
                                    name="confirm_forum">--%>
                                <asp:CheckBox ID="checkBoxBelieve" runat="server" />
                                I believe <span class="bold"><%= GetSubForumBySubForumID().SubForumName %></span> is the BEST section for this
                                topic</label>
                        </li>
                    </div>
                </div>
                <div class="blockrow">
                    <label class="full" for="subject">
                        Title:</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="primary full textbox"></asp:TextBox>
                    &nbsp;<img alt="" src="clear.gif" id="display_posticon">
                </div>
                <div class="blockrow texteditor" id="vB_Editor_001">

                    <!-- / Editor Scripts -->
                    <telerik:RadEditor ID="radEditor" runat="server" Skin="Telerik" >
                        <Content>
                        </Content>
                    </telerik:RadEditor>
                </div>
                
                
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="btnSubmitNewTopic" runat="server" Text="Submit New Topic" CssClass="button" OnClick="btnSubmitNewTopic_Click" />
                <asp:Button ID="btnPreviewPost" runat="server" Text="Preview Post" CssClass="button" />
            </div>
        </div>
        
        <%--Begin Additional Options--%>
        <%--<h3 class="blockhead">
            Additional Options</h3>
        <div class="blockbody formcontrols">
            <div class="section">
                <div class="blockrow">
                    <label>
                        Additional Options:</label>
                    <ul class="checkradio group rightcol">
                        <li>
                            <label for="cb_disablesmilies">
                                <input type="checkbox" tabindex="1" id="cb_disablesmilies" value="1" name="disablesmilies">
                                Disable smilies in text</label></li></ul>
                </div>
                <fieldset id="attachfiles" class="blockrow">
                    <legend>Attachments</legend>
                    <label>
                        Manage Attachments:</label>
                    <div class="rightcol">
                        <a tabindex="1" title="Click here to add or edit files attached to this message"
                            target="manageattach" class="uploadlaunchfallback" href="newattachment.php?values[f]=21&amp;poststarttime=1282594976&amp;posthash=cdf957bcb458be51a4998102c9978780&amp;contenttypeid=1"
                            style="display: none;">Manage Attachments</a>
                        <input type="button" title="Click here to add or edit files attached to this message"
                            value="Manage Attachments" tabindex="1" class="button uploadlaunchbutton" id="manage_attachments_button"
                            style="">
                        <ul id="attachlist_list2" class="group attachments hidden">
                            <li class="hidden">&nbsp;</li>
                        </ul>
                    </div>
                    <p class="description">
                        Valid file extensions: asp bmp doc eps gif html jpe jpeg jpg pdf php png psd txt
                        xls xml zip</p>
                </fieldset>
                <fieldset class="blockrow">
                    <legend>Subscription</legend>
                    <dl class="group dep_group">
                        <dt>
                            <label for="subscribe">
                                Subscribe to this thread and notify me of changes:</label>
                            <input type="checkbox" tabindex="1" checked="checked" class="dep_ctrl" value="1"
                                name="subscribe" id="subscribe">
                        </dt>
                        <dd class="rightcol" id="subscribe_deps">
                            <ul class="group">
                                <li>
                                    <select tabindex="1" name="emailupdate" class="primary">
                                        <option value="0">Through my control panel only</option>
                                        <option selected="selected" value="1">Instantly, using email</option>
                                        <option value="2">Daily, using email</option>
                                        <option value="3">Weekly, using email</option>
                                    </select>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                </fieldset>
                <fieldset class="blockrow">
                    <legend>Post a Poll</legend>
                    <dl class="group dep_group">
                        <dt>
                            <label for="postpoll">
                                Create a poll with this number of options (Maximum 10):</label>
                            <input type="checkbox" class="dep_ctrl" tabindex="1" id="postpoll" value="yes" name="postpoll">
                        </dt>
                        <dd class="rightcol" id="postpoll_deps">
                            <input type="text" tabindex="1" id="polloptnum" value="4" name="polloptions" size="5"
                                class="textbox numeric" disabled="">
                        </dd>
                    </dl>
                </fieldset>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <input type="submit" tabindex="1" accesskey="s" value="Submit New Thread" name="sbutton"
                    class="button">
                <input type="submit" tabindex="1" accesskey="r" value="Preview Post" name="preview"
                    class="button">
            </div>
        </div>--%>
        <%--end Additional Options--%>
        </div>

</asp:Content>
