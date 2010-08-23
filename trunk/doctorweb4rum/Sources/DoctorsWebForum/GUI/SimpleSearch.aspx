<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="SimpleSearch.aspx.cs" Inherits="GUI_SimpleSearch" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="breadcrumb" class="breadcrumb">
<ul class="floatcontainer">
<li class="navbithome"><a href="" accesskey="1"><img src="http://m.dpstatic.com/misc/navbit-home.png" alt="Home" /></a></li>



<li class="navbit lastnavbit"><span>Advanced Search</span></li>
 
</ul>

<hr />
</div>

 
 


 

<div class="block">
<ul id="searchtypeswitcher" class="floatcontainer">
<li class="selected"><a href="search.php?search_type=1">Search Single Content Type</a></li>
<li><a href="search.php">Search Multiple Content Types</a></li>
</ul>
   <div class="blockbody formcontrols">
<form id="searchtypes" action="search.php" method="post" class="">
<h3 class="blocksubhead">Search In</h3>
<div class="section">

<div class="blockrow">
<label for="search_type">Search Type:</label>
<select class="primary" id="search_type" name="contenttypeid" tabindex="1" onchange="change_type()">
<option value="3" class="" >Forums</option> <option value="1" class="" selected="selected">Posts</option> <option value="7" class="" >Groups</option> <option value="5" class="" >Group Messages</option> <option value="11" class="" >Visitor Messages</option> <option value="16" class="" >Blog Comments</option> <option value="15" class="" >Blog Entries</option> <option value="18" class="" >Articles</option> <option value="20" class="" >Static Pages</option> 


</select>
</div>
</div>
<noscript>
<input class="button" type="submit" tabindex="1" value="Go">
</noscript>

<input type="hidden" name="search_type" value="1" />
<input type="hidden" name="s" value="" />
<input type="hidden" name="securitytoken" value="1282598720-961edaadbf952bb5600e764a95076f4454edc06e" />
</form> 



<div id="vb_search_params">
<form action="search.php?do=process" method="post" name="vbform" id="searchform" class="">

<h3 class="blocksubhead">

Search for Posts

</h3>

<div class="section">

<div class="blockrow">
<label for="keyword">Keyword(s):</label>
<ul class="multifield group">
<li>
<input id="keyword" type="text" class="textbox" name="query" tabindex="1" value="" />
</li>

<li>
<select id="titleonly" name="titleonly" tabindex="1">
<option value="0" selected="selected">Search Entire Posts</option>
<option value="1" >Search Titles Only</option>

</select>
</li>
</ul>
</div>

<div class="blockrow">
<label for="keyword">User Name:</label>
<ul class="multifield group">
<li>
<div id="userfield" class="popupmenu nomouseover noclick nohovermenu">
<input type="text" class="textbox popupctrl" name="searchuser" id="userfield_txt" tabindex="1" value="" />
</div>
</li>

<li>
<select name="starteronly" tabindex="1">

<option value="0" selected="selected">Find Posts by User</option>
<option value="1" >Find Threads Started by User</option>
</select>
</li>

<li>
<label for="cb_exactname">
<input type="checkbox" name="exactname" value="1" tabindex="1" id="cb_exactname"  /> Exact name
</label>
</li>
</ul>
</div>

<div class="blockrow">

<label for="keyword">Tag:</label>
<div id="tag_add" class="popupmenu nomouseover noclick nohovermenu popupcustom">
<input type="text" class="textbox primary" name="tag" id="tag_add_input" tabindex="1" value="" autocomplete="false" />
</div>
</div>


</div>

<div class="blockfoot actionbuttons">
<div class="group">
<input type="submit" class="button" name="dosearch" value="Search Now" tabindex="1" accesskey="s"/>
<input type="reset" class="button" value="Reset" tabindex="1" accesskey="r" />
</div>
</div>

<h3 class="blocksubhead">Additional Options <a class="collapse" id="collapse_additionaloptions" href="search.php?search_type=1#top"><img src="http://b.dpstatic.com/buttons/collapse_40b.png" alt="" /></a></h3>
<div class="section" id="additionaloptions">
<div class="blockrow">
<label for="forumchoice">Search in Forum(s):</label>
<ul class="multifield stacked group">
<li>
<select class="primary" id="forumchoice" name="forumchoice[]" multiple="multiple" tabindex="1" size="5">
<option value="" class="" selected="selected">Search All Open Forums</option> <option value="subscribed" class="" >Search Subscribed Forums</option> <option value="4" class="d0" > Search Engines</option> <option value="5" class="d1" > Google</option> <option value="27" class="d2" > AdSense</option> <option value="69" class="d3" > Guidelines / Compliance</option> <option value="72" class="d3" > Placement / Reviews / Examples</option> <option value="71" class="d3" > Reporting &amp; Stats</option> <option value="68" class="d3" > Payments</option> <option value="7" class="d2" > Google APIs</option> <option value="8" class="d2" > Product Search</option> <option value="6" class="d1" > Yahoo</option> <option value="47" class="d2" > Publisher Network</option> <option value="46" class="d2" > Yahoo APIs</option> <option value="43" class="d1" > Microsoft</option> <option value="26" class="d1" > All Other Search Engines</option> <option value="25" class="d1" > Directories</option> <option value="65" class="d2" > Solicitations &amp; Announcements</option> <option value="66" class="d2" > ODP / DMOZ</option> <option value="11" class="d0" > Marketing</option> <option value="21" class="d1" > General Marketing</option> <option value="12" class="d1" > Search Engine Optimization</option> <option value="77" class="d2" > Keywords</option> <option value="67" class="d2" > Sandbox</option> <option value="118" class="d1" > Social Networks</option> <option value="135" class="d2" > Facebook</option> <option value="136" class="d3" > Facebook APIs</option> <option value="13" class="d1" > Link Development</option> <option value="20" class="d1" > Pay Per Click Advertising</option> <option value="35" class="d2" > Google AdWords</option> <option value="84" class="d2" > Yahoo Search Marketing</option> <option value="82" class="d2" > Microsoft adCenter</option> <option value="22" class="d1" > Affiliate Programs</option> <option value="73" class="d2" > Commission Junction</option> <option value="131" class="d2" > Google</option> <option value="117" class="d2" > Pepperjam</option> <option value="96" class="d2" > Azoogle</option> <option value="75" class="d2" > Amazon</option> <option value="133" class="d2" > eBay</option> <option value="87" class="d2" > ClickBank</option> <option value="74" class="d2" > Chitika</option> <option value="32" class="d0" > Business</option> <option value="33" class="d1" > General Business</option> <option value="115" class="d1" > eCommerce</option> <option value="101" class="d1" > Payment Processing</option> <option value="134" class="d2" > PayPal</option> <option value="44" class="d1" > Legal Issues</option> <option value="45" class="d1" > Domain Names</option> <option value="61" class="d2" > Appraisals</option> <option value="86" class="d1" > Copywriting</option> <option value="24" class="d1" > Buy, Sell or Trade</option> <option value="105" class="d2" > Freebies</option> <option value="52" class="d2" > Sites</option> <option value="59" class="d2" > Domains</option> <option value="90" class="d2" > Advertising</option> <option value="76" class="d2" > Content</option> <option value="114" class="d2" > eBooks</option> <option value="81" class="d2" > Templates</option> <option value="116" class="d2" > Scripts</option> <option value="60" class="d2" > Services</option> <option value="102" class="d3" > Content Creation</option> <option value="104" class="d3" > Design</option> <option value="103" class="d3" > Programming</option> <option value="99" class="d3" > Traffic</option> <option value="98" class="d3" > Web Hosting</option> <option value="53" class="d2" > Link Exchange</option> <option value="58" class="d2" > Link Sales</option> <option value="128" class="d3" > Template Sponsorship</option> <option value="129" class="d3" > Signature Links</option> <option value="119" class="d2" > Partnerships</option> <option value="94" class="d2" > Contests</option> <option value="89" class="d2" > Vouchers</option> <option value="100" class="d2" > Adult</option> <option value="15" class="d0" > Design &amp; Development</option> <option value="16" class="d1" > HTML &amp; Website Design</option> <option value="39" class="d2" > CSS</option> <option value="55" class="d1" > Graphics &amp; Multimedia</option> <option value="121" class="d2" > Photoshop</option> <option value="51" class="d1" > Content Management</option> <option value="40" class="d2" > Blogging</option> <option value="110" class="d3" > WordPress</option> <option value="120" class="d2" > Drupal</option> <option value="111" class="d2" > Joomla</option> <option value="78" class="d2" > XML &amp; RSS</option> <option value="93" class="d2" > Scripts</option> <option value="17" class="d1" > Programming</option> <option value="37" class="d2" > PHP</option> <option value="38" class="d2" > JavaScript</option> <option value="48" class="d2" > ASP</option> <option value="56" class="d2" > ColdFusion</option> <option value="18" class="d1" > Site &amp; Server Administration</option> <option value="49" class="d2" > Apache</option> <option value="95" class="d2" > Security</option> <option value="70" class="d2" > Traffic Analysis</option> <option value="112" class="d3" > Google Analytics</option> <option value="50" class="d2" > robots.txt</option> <option value="64" class="d2" > Forum Management</option> <option value="109" class="d3" > vBulletin</option> <option value="62" class="d2" > Google Sitemaps</option> <option value="122" class="d2" > Web Hosting</option> <option value="124" class="d3" > Outages</option> <option value="57" class="d1" > Databases</option> <option value="108" class="d2" > MySQL</option> <option value="9" class="d0" > Products &amp; Tools</option> <option value="10" class="d1" > Keyword Tracker</option> <option value="34" class="d1" > Co-op Advertising Network</option> <option value="41" class="d2" > Setup / Validation Help</option> <option value="42" class="d2" > Weight Questions</option> <option value="29" class="d1" > Optigold ISP</option> <option value="30" class="d2" > Feature Requests</option> <option value="31" class="d2" > Bugs</option> <option value="14" class="d1" > All Other Tools</option> <option value="1" class="d0" > The Digital Point</option> <option value="2" class="d1" > Introductions</option> <option value="19" class="d1" > General Chat</option> <option value="97" class="d2" > Movies, Music &amp; TV</option> <option value="126" class="d2" > Games</option> <option value="125" class="d2" > Sports</option> <option value="107" class="d2" > Hardware</option> <option value="80" class="d2" > Politics &amp; Religion</option> <option value="91" class="d1" > Reviews</option> <option value="23" class="d2" > Websites</option> <option value="92" class="d2" > SEO</option> <option value="3" class="d1" > Suggestions &amp; Feedback</option> <option value="28" class="d1" > The Underground</option> 

</select>
</li>
<li>
<label for="cb_childforums" class="rightcol">
<input id="cb_childforums" type="checkbox"  value="1" name="childforums" tabindex="1" checked="checked" />
Also search in child forums
</label>
</li>
</ul>
</div>


<div class="blockrow">
<label for="prefixchoice">Search by Prefix:</label>
<select class="primary" id="prefixchoice" name="prefixchoice[]" size="5" multiple="multiple" tabindex="1">
<option value="" selected="selected">(any thread)</option>

<option value="-2" >(any prefix)</option>
<option value="-1" >(no prefix)</option>

<optgroup label="Marketplace">
<option value="wts" class=""  selected="selected">[WTS]</option> <option value="wtb" class=""  selected="selected">[WTB]</option> <option value="wtt" class=""  selected="selected">[WTT]</option> 
</optgroup>
 
<optgroup label="Suggestions &amp; Feedback">
<option value="suggestion" class=""  selected="selected">[Suggestion]</option> <option value="feedback" class=""  selected="selected">[Feedback]</option> <option value="rules" class=""  selected="selected">[Rules]</option> <option value="bug" class=""  selected="selected">[Bug]</option> <option value="features" class=""  selected="selected">[Feature]</option> <option value="infraction" class=""  selected="selected">[Infraction]</option> <option value="ban" class=""  selected="selected">[Ban]</option> <option value="rep" class=""  selected="selected">[Rep]</option> 

</optgroup>
 
</select>
</div>


<div class="blockrow">
<label for="replyless">Find Threads with:</label>
<ul class="multifield group">
<li>
<select id="replyless" name="replyless" tabindex="1">
<option value="0" >At Least</option>
<option value="1" >At Most</option>
</select>

</li>
<li>
<label for="replylimit">
<input type="text" class="textbox" id="replylimit" name="replylimit" size="3" tabindex="1" value="" />
Replies
</label>
</li>
</ul>
</div>

<div class="blockrow">
<label for="searchdate">Find Posts:</label>
<ul class="multifield group">
<li>
<select id="searchdate" name="searchdate" tabindex="1">
<option value="0" selected="selected">Any Date</option>

<option value="lastvisit" >Your Last Visit</option>
<option value="1" >Yesterday</option>
<option value="7" >A Week Ago</option>

<option value="14" >2 Weeks Ago</option>
<option value="30"> A Month Ago</option>
<option value="90" >3 Months Ago</option>
<option value="180" >6 Months Ago</option>
<option value="365" >A Year Ago</option>

</select>
</li>
<li>
<select name="beforeafter" tabindex="1">
<option value="after" >and Newer</option>
<option value="before" >and Older</option>
</select>
</li>
</ul>
</div>


<div class="blockrow">
<label for="sortby">Sort Results by:</label>

<ul class="multifield group">
<li>
<select id="sortby" name="sortby" tabindex="1">

<option value="replycount" >Number of Replies</option>
<option value="views" >Number of Views</option>
<option value="threadstart" >Thread Start Date</option>
<option value="dateline" selected="selected">Last Posting Date</option>

<option value="forum" >Forum</option>
</select>
</li>

<li>
<select name="order" class="" tabindex="1">
<option value="descending" selected="selected">in Descending Order</option>
<option value="ascending" >in Ascending Order</option>
</select>
</li>
</ul>
</div>

<div class="blockrow">
<label>Show Results as:</label>
<ul class="checkradio group rightcol">
<li><label for="rb_showposts_0"><input type="radio" name="showposts" value="0" id="rb_showposts_0" tabindex="1" checked="checked" /> Threads</label></li>

<li><label for="rb_showposts_1"><input type="radio" name="showposts" value="1" id="rb_showposts_1" tabindex="1"  /> Posts</label></li>
</ul>
</div>


  

<div class="blockfoot actionbuttons">

<div class="savepreferences">
<select name="saveprefs" tabindex="1">
<option value="1" selected="selected">Save Search Preferences</option>
<option value="0">Clear Search Preferences</option>
</select>

<input type="submit" class="button" name="doprefs" value="Go" id="save_searchprefs" tabindex="1"  onclick="vB_AJAX_SearchPrefs.prototype.form_click"/>
<input type="image" src="clear.gif"/>
<script type="text/javascript">

<!--
vB_AJAX_SearchPrefs_Init('save_searchprefs');
//-->

</script>
</div>

<div class="group">
<input type="submit" class="button" name="dosearch" value="Search Now" tabindex="1" accesskey="s"/>
<input type="reset" class="button" value="Reset" tabindex="1" accesskey="r" />
</div>
</div>

</div>


<input type="hidden" name="searchthreadid" value="" />

<input type="hidden" name="s" value="" />
<input type="hidden" name="securitytoken" value="1282598720-961edaadbf952bb5600e764a95076f4454edc06e" />
<input type="hidden" name="searchfromtype" value="vBForum:Post" />
<input type="hidden" name="do" value="process" />
<input type="hidden" name="contenttypeid" value="1" />
</form> 
</div>

</div>
</div>
  

<div id="searchform_tagcloud"><div class="block">
    <h2 class="blockhead">Search Tag Cloud</h2>
    <div class="blockbody settings_form_border">

  <h3 class="blocksubhead">These are the 70 most-searched-for thread tags</h3>
        <div class="blockrow"><a href="tags.php?tag=%2410" class="tagcloudlink level1">$10</a>  <a href="tags.php?tag=2012+affiliate" class="tagcloudlink level2">2012 affiliate</a>  <a href="tags.php?tag=acai+berry" class="tagcloudlink level1">acai berry</a>  <a href="tags.php?tag=ads" class="tagcloudlink level2">ads</a>  <a href="tags.php?tag=adsense" class="tagcloudlink level3">adsense</a>  <a href="tags.php?tag=advertising" class="tagcloudlink level2">advertising</a>  <a href="tags.php?tag=adwords" class="tagcloudlink level2">adwords</a>  <a href="tags.php?tag=affiliate" class="tagcloudlink level5">affiliate</a>  <a href="tags.php?tag=affiliate+marketing" class="tagcloudlink level1">affiliate marketing</a>  <a href="tags.php?tag=affiliate+program" class="tagcloudlink level2">affiliate program</a>  <a href="tags.php?tag=apache" class="tagcloudlink level1">apache</a>  <a href="tags.php?tag=backlink" class="tagcloudlink level1">backlink</a>  <a href="tags.php?tag=backlinks" class="tagcloudlink level2">backlinks</a>  <a href="tags.php?tag=bing" class="tagcloudlink level1">bing</a>  <a href="tags.php?tag=blog" class="tagcloudlink level2">blog</a>  <a href="tags.php?tag=blogger" class="tagcloudlink level1">blogger</a>  <a href="tags.php?tag=blogging" class="tagcloudlink level1">blogging</a>  <a href="tags.php?tag=business" class="tagcloudlink level2">business</a>  <a href="tags.php?tag=clickbank" class="tagcloudlink level1">clickbank</a>  <a href="tags.php?tag=cms" class="tagcloudlink level2">cms</a>  <a href="tags.php?tag=cpm" class="tagcloudlink level2">cpm</a>  <a href="tags.php?tag=css" class="tagcloudlink level2">css</a>  <a href="tags.php?tag=design" class="tagcloudlink level1">design</a>  <a href="tags.php?tag=directory" class="tagcloudlink level1">directory</a>  <a href="tags.php?tag=domain" class="tagcloudlink level2">domain</a>  <a href="tags.php?tag=earn" class="tagcloudlink level2">earn</a>  <a href="tags.php?tag=facebook" class="tagcloudlink level3">facebook</a>  <a href="tags.php?tag=flash" class="tagcloudlink level1">flash</a>  <a href="tags.php?tag=free" class="tagcloudlink level3">free</a>  <a href="tags.php?tag=free+directory" class="tagcloudlink level2">free directory</a>  <a href="tags.php?tag=full+rss+feeds" class="tagcloudlink level1">full rss feeds</a>  <a href="tags.php?tag=google" class="tagcloudlink level3">google</a>  <a href="tags.php?tag=google+adsense" class="tagcloudlink level2">google adsense</a>  <a href="tags.php?tag=hosting" class="tagcloudlink level1">hosting</a>  <a href="tags.php?tag=html" class="tagcloudlink level1">html</a>  <a href="tags.php?tag=internet+marketing" class="tagcloudlink level1">internet marketing</a>  <a href="tags.php?tag=javascript" class="tagcloudlink level1">javascript</a>  <a href="tags.php?tag=joomla" class="tagcloudlink level1">joomla</a>  <a href="tags.php?tag=kdjkfjskdfjlskdjf.com" class="tagcloudlink level1">kdjkfjskdfjlskdjf.com</a>  <a href="tags.php?tag=keyword" class="tagcloudlink level1">keyword</a>  <a href="tags.php?tag=keywords" class="tagcloudlink level2">keywords</a>  <a href="tags.php?tag=link" class="tagcloudlink level1">link</a>  <a href="tags.php?tag=link+building" class="tagcloudlink level2">link building</a>  <a href="tags.php?tag=lose+weight" class="tagcloudlink level1">lose weight</a>  <a href="tags.php?tag=make+money" class="tagcloudlink level2">make money</a>  <a href="tags.php?tag=marketing" class="tagcloudlink level1">marketing</a>  <a href="tags.php?tag=matrimonial+site+script" class="tagcloudlink level1">matrimonial site script</a>  <a href="tags.php?tag=money" class="tagcloudlink level1">money</a>  <a href="tags.php?tag=mysql" class="tagcloudlink level1">mysql</a>  <a href="tags.php?tag=pagerank" class="tagcloudlink level1">pagerank</a>  <a href="tags.php?tag=paypal" class="tagcloudlink level3">paypal</a>  <a href="tags.php?tag=paypal+india" class="tagcloudlink level2">paypal india</a>  <a href="tags.php?tag=php" class="tagcloudlink level2">php</a>  <a href="tags.php?tag=ppc" class="tagcloudlink level2">ppc</a>  <a href="tags.php?tag=review" class="tagcloudlink level2">review</a>  <a href="tags.php?tag=scam" class="tagcloudlink level2">scam</a>  <a href="tags.php?tag=script" class="tagcloudlink level1">script</a>  <a href="tags.php?tag=scriptpick.com" class="tagcloudlink level5">scriptpick.com</a>  <a href="tags.php?tag=search+engine" class="tagcloudlink level1">search engine</a>  <a href="tags.php?tag=seo" class="tagcloudlink level4">seo</a>  <a href="tags.php?tag=traffic" class="tagcloudlink level1">traffic</a>  <a href="tags.php?tag=twitter" class="tagcloudlink level2">twitter</a>  <a href="tags.php?tag=upload" class="tagcloudlink level2">upload</a>  <a href="tags.php?tag=vbulletin" class="tagcloudlink level2">vbulletin</a>  <a href="tags.php?tag=video" class="tagcloudlink level2">video</a>  <a href="tags.php?tag=web+design" class="tagcloudlink level1">web design</a>  <a href="tags.php?tag=website" class="tagcloudlink level2">website</a>  <a href="tags.php?tag=wordpress" class="tagcloudlink level2">wordpress</a>  <a href="tags.php?tag=www" class="tagcloudlink level1">www</a>  <a href="tags.php?tag=yahoo" class="tagcloudlink level2">yahoo</a>  </div>

    </div>
</div> </div>

     
</asp:Content>

