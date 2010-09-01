<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewReplyWithQuote.aspx.cs" Inherits="GUI_NewReplyWithQuote" Title="Untitled Page" %>
<%@ Register Assembly="obout_Editor" Namespace="OboutInc.Editor" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="vbform block">
            <h2 class="blockhead">
            Preview</h2>
        <div class="blockbody postpreview">
            <blockquote class="blockrow postcontent restore preview postcontainer forumcontent"
                id="yui-gen20">
                <div class="bbcode_container">
                    <div class="bbcode_quote">
                        <div class="quote_container">
                            <div class="bbcode_quote_container">
                            </div>
                            <div class="bbcode_postedby">
                                <img alt="Quote" src="http://m.dpstatic.com/misc/quote_icon.png" title="Quote">
                                Originally Posted by <strong>acewonders</strong> <a rel="nofollow" href="showthread.php?p=12867331#post12867331">
                                    <img alt="View Post" src="http://b.dpstatic.com/buttons/viewpost-right.png" class="inlineimg"
                                        title="View Post"></a>
                            </div>
                            <div class="message">
                                I recently receive a letter from a law firm representing Product Partners/Beachbody.
                                They said that I was selling counterfeit P90X dvds, but I never knew they were fake
                                or counterfeit.
                                <br>
                                <br>
                                I never even got to see what I sold, I would sell it then use the money I received
                                to buy it from another site cheaper. Then I would have the DVD sent to the person
                                who paid me(dropshipping). I would keep the leftovers. The people I bought the DVD
                                from stated that they were authentic from Beachbody and I thought they were authentic
                                like stated, but apparently not. I received nothing but positive feedback, so I
                                thought everything was great. They want me to send them approximately $890 to avoid
                                court.
                                <br>
                                <br>
                                I want to ask what can happen to me? Iive in Houston, the law firm is in California,will
                                I have to fly there to defend myself? Can I be arrested for this? I started doing
                                this at age 16 now I'm 17.<br>
                                <br>
                                Sorry one last piece of information, I stopped selling the P90X dvds a couple of
                                months before I receive the letter(which was friday).</div>
                        </div>
                    </div>
                </div>
            </blockquote>
            <!-- attachments -->
            <blockquote class="blockrow signature restore preview">
            </blockquote>
            <!-- / attachments -->
        </div>
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">
                <div class="blockrow">
                    <div style="padding: 10px;">
                        <li></li>
                    </div>
                </div>
                <div class="blockrow texteditor" id="vB_Editor_001">
                    <!-- / Editor Scripts -->
                    <obout:editor id="Editor1" runat="server" previewmode="true" fixedtoolbar="false">
                    </obout:editor>
                </div>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <asp:Button ID="btnSubmitNewReply" runat="server" Text="Submit New Reply" CssClass="button"
                    OnClick="btnSubmitNewReply_Click" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancel_Click" />&nbsp;
            </div>
        </div>
        
        <div class="blockfoot actionbuttons">
        </div>

    </div>
</asp:Content>
