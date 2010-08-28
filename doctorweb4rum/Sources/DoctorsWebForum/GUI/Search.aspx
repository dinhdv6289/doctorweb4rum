<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="GUI_Search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
<div class="blockrow"><label for="ctl00_ContentPlaceHolder1_DropDownList1">Search in:</label> <ul class="multifield group"><li><asp:DropDownList id="DropDownList1" runat="server" Width="248px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList> </li><li><asp:DropDownList id="DropDownList2" runat="server" Enabled="False">
                                </asp:DropDownList> </li></ul></div>
</contenttemplate>
            </asp:UpdatePanel>
            <div class="blockrow">
                <label for="keyword">
                    Keyword(s):</label>
                <ul class="multifield group">
                    <li>
                        <input id="keyword" type="text" class="textbox" name="query" tabindex="1" value="" />
                    </li>
                    <li>
                        <select name="titleonly" tabindex="1">
                            <option value="0" selected="selected">Search Entire Posts</option>
                            <option value="1">Search Titles Only</option>
                        </select>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label for="searchuser">
                    User Name:</label>
                <ul class="multifield group">
                    <li>
                        <div id="userfield" class="popupmenu nomouseover noclick nohovermenu">
                            <input type="text" class="textbox popupctrl" name="searchuser" id="userfield_txt"
                                tabindex="1" value="" />
                        </div>
                    </li>
                    <li>
                        <label for="cb_exactname">
                            <input type="checkbox" name="exactname" value="1" id="cb_exactname" tabindex="1" />&nbsp;Exact
                            name
                        </label>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label for="tag">
                    Tag:</label>
                <div id="tag_add" class="popupmenu nomouseover noclick nohovermenu">
                    <input type="text" class="textbox primary popupctrl" name="tag" id="tag_add_input"
                        tabindex="1" value="" />
                </div>
            </div>
            <div class="blockrow">
                <label for="searchdate">
                    Find Posts</label>
                <ul class="multifield group">
                    <li>
                        <select name="searchdate" tabindex="1">
                            <option value="0" selected="selected">Any Date</option>
                            <option value="lastvisit">Your Last Visit</option>
                            <option value="1">Yesterday</option>
                            <option value="7">A Week Ago</option>
                            <option value="14">2 Weeks Ago</option>
                            <option value="30">A Month Ago</option>
                            <option value="90">3 Months Ago</option>
                            <option value="180">6 Months Ago</option>
                            <option value="365">A Year Ago</option>
                        </select>
                    </li>
                    <li>
                        <select name="beforeafter" tabindex="1">
                            <option value="after">and Newer</option>
                            <option value="before">and Older</option>
                        </select>
                    </li>
                </ul>
            </div>
            <div class="blockrow">
                <label for="sortby">
                    Sort Results by</label>
                <ul class="multifield group">
                    <li>
                        <select name="sortby" tabindex="1">
                            <option value="dateline" selected="selected">Date</option>
                            <option value="relevance" selected="selected">Relevance</option>
                        </select>
                    </li>
                    <li>
                        <select name="order" tabindex="1">
                            <option value="descending" selected="selected">in Descending Order</option>
                            <option value="ascending">in Ascending Order</option>
                        </select>
                    </li>
                </ul>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <input type="submit" class="button" name="dosearch" value="Search Now" tabindex="1"
                    accesskey="s" />
                <input type="reset" class="button" value="Reset" tabindex="1" />
            </div>
        </div>
    </div>
    <div id="searchform_tagcloud">
        <div class="block">
            <h2 class="blockhead">
                Search Tag Cloud</h2>
            <div class="blockbody settings_form_border">
                <h3 class="blocksubhead">
                    These are the 70 most-searched-for thread tags</h3>
                <div class="blockrow">
                    <a href="tags.php?tag=%2410" class="tagcloudlink level1">$10</a> <a href="tags.php?tag=2012+affiliate"
                        class="tagcloudlink level2">2012 affiliate</a> <a href="tags.php?tag=acai+berry"
                            class="tagcloudlink level1">acai berry</a> <a href="tags.php?tag=ads" class="tagcloudlink level2">
                                ads</a> <a href="tags.php?tag=adsense" class="tagcloudlink level3">adsense</a>
                    <a href="tags.php?tag=advertising" class="tagcloudlink level2">advertising</a> <a
                        href="tags.php?tag=adwords" class="tagcloudlink level2">adwords</a> <a href="tags.php?tag=affiliate"
                            class="tagcloudlink level5">affiliate</a> <a href="tags.php?tag=affiliate+marketing"
                                class="tagcloudlink level1">affiliate marketing</a> <a href="tags.php?tag=affiliate+program"
                                    class="tagcloudlink level2">affiliate program</a> <a href="tags.php?tag=apache" class="tagcloudlink level1">
                                        apache</a> <a href="tags.php?tag=backlink" class="tagcloudlink level1">backlink</a>
                    <a href="tags.php?tag=backlinks" class="tagcloudlink level2">backlinks</a> <a href="tags.php?tag=bing"
                        class="tagcloudlink level1">bing</a> <a href="tags.php?tag=blog" class="tagcloudlink level2">
                            blog</a> <a href="tags.php?tag=blogger" class="tagcloudlink level1">blogger</a>
                    <a href="tags.php?tag=blogging" class="tagcloudlink level1">blogging</a> <a href="tags.php?tag=business"
                        class="tagcloudlink level2">business</a> <a href="tags.php?tag=clickbank" class="tagcloudlink level1">
                            clickbank</a> <a href="tags.php?tag=cms" class="tagcloudlink level2">cms</a>
                    <a href="tags.php?tag=cpm" class="tagcloudlink level2">cpm</a> <a href="tags.php?tag=css"
                        class="tagcloudlink level2">css</a> <a href="tags.php?tag=design" class="tagcloudlink level1">
                            design</a> <a href="tags.php?tag=directory" class="tagcloudlink level1">directory</a>
                    <a href="tags.php?tag=domain" class="tagcloudlink level2">domain</a> <a href="tags.php?tag=earn"
                        class="tagcloudlink level2">earn</a> <a href="tags.php?tag=facebook" class="tagcloudlink level3">
                            facebook</a> <a href="tags.php?tag=flash" class="tagcloudlink level1">flash</a>
                    <a href="tags.php?tag=free" class="tagcloudlink level3">free</a> <a href="tags.php?tag=free+directory"
                        class="tagcloudlink level2">free directory</a> <a href="tags.php?tag=full+rss+feeds"
                            class="tagcloudlink level1">full rss feeds</a> <a href="tags.php?tag=google" class="tagcloudlink level3">
                                google</a> <a href="tags.php?tag=google+adsense" class="tagcloudlink level2">google
                                    adsense</a> <a href="tags.php?tag=hosting" class="tagcloudlink level1">hosting</a>
                    <a href="tags.php?tag=html" class="tagcloudlink level1">html</a> <a href="tags.php?tag=internet+marketing"
                        class="tagcloudlink level1">internet marketing</a> <a href="tags.php?tag=javascript"
                            class="tagcloudlink level1">javascript</a> <a href="tags.php?tag=joomla" class="tagcloudlink level1">
                                joomla</a> <a href="tags.php?tag=kdjkfjskdfjlskdjf.com" class="tagcloudlink level1">
                                    kdjkfjskdfjlskdjf.com</a> <a href="tags.php?tag=keyword" class="tagcloudlink level1">
                                        keyword</a> <a href="tags.php?tag=keywords" class="tagcloudlink level2">keywords</a>
                    <a href="tags.php?tag=link" class="tagcloudlink level1">link</a> <a href="tags.php?tag=link+building"
                        class="tagcloudlink level2">link building</a> <a href="tags.php?tag=lose+weight"
                            class="tagcloudlink level1">lose weight</a> <a href="tags.php?tag=make+money" class="tagcloudlink level2">
                                make money</a> <a href="tags.php?tag=marketing" class="tagcloudlink level1">marketing</a>
                    <a href="tags.php?tag=matrimonial+site+script" class="tagcloudlink level1">matrimonial
                        site script</a> <a href="tags.php?tag=money" class="tagcloudlink level1">money</a>
                    <a href="tags.php?tag=mysql" class="tagcloudlink level1">mysql</a> <a href="tags.php?tag=pagerank"
                        class="tagcloudlink level1">pagerank</a> <a href="tags.php?tag=paypal" class="tagcloudlink level3">
                            paypal</a> <a href="tags.php?tag=paypal+india" class="tagcloudlink level2">paypal india</a>
                    <a href="tags.php?tag=php" class="tagcloudlink level2">php</a> <a href="tags.php?tag=ppc"
                        class="tagcloudlink level2">ppc</a> <a href="tags.php?tag=review" class="tagcloudlink level2">
                            review</a> <a href="tags.php?tag=scam" class="tagcloudlink level2">scam</a>
                    <a href="tags.php?tag=script" class="tagcloudlink level1">script</a> <a href="tags.php?tag=scriptpick.com"
                        class="tagcloudlink level5">scriptpick.com</a> <a href="tags.php?tag=search+engine"
                            class="tagcloudlink level1">search engine</a> <a href="tags.php?tag=seo" class="tagcloudlink level4">
                                seo</a> <a href="tags.php?tag=traffic" class="tagcloudlink level1">traffic</a>
                    <a href="tags.php?tag=twitter" class="tagcloudlink level2">twitter</a> <a href="tags.php?tag=upload"
                        class="tagcloudlink level2">upload</a> <a href="tags.php?tag=vbulletin" class="tagcloudlink level2">
                            vbulletin</a> <a href="tags.php?tag=video" class="tagcloudlink level2">video</a>
                    <a href="tags.php?tag=web+design" class="tagcloudlink level1">web design</a> <a href="tags.php?tag=website"
                        class="tagcloudlink level2">website</a> <a href="tags.php?tag=wordpress" class="tagcloudlink level2">
                            wordpress</a> <a href="tags.php?tag=www" class="tagcloudlink level1">www</a>
                    <a href="tags.php?tag=yahoo" class="tagcloudlink level2">yahoo</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
