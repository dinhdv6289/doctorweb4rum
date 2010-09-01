<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true" CodeFile="EditPost.aspx.cs" Inherits="GUI_EditPost" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="pagetitle">
<h1></h1>
<p class="description">
Make changes to post <a href="showthread.php?t=1924581&amp;p=14883481#post14883481">14883481</a> from the thread <a href="showthread.php?t=1924581"><em>Help with form layout on window resize</em></a></p>
</div>


<form class="vbform block" action="editpost.php?do=deletepost&amp;p=14883481" method="post">
<h2 class="blockhead">Delete Post</h2>
<div class="blockbody formcontrols">

<h3 class="blocksubhead">Select the appropriate options and then click the <strong>Delete</strong> button.</h3>
<div class="section">
<div class="blockrow">
<dl class="dep_group">
<dt><label for="delete"><input class="dep_ctrl" id="delete" name="dodelete" value="1" tabindex="1" type="checkbox"> Delete this post in the following manner:</label></dt>
<dd id="delete_deps">
<ul class="group checkradio">

<li>
<dl class="group dep_group floatcontainer">
<dt><label for="deltype_soft"><input disabled="disabled" id="deltype_soft" checked="checked" class="dep_ctrl" name="deletepost" value="delete" tabindex="1" type="radio"> Delete Message</label></dt>

<dd id="deltype_soft_deps">
<input disabled="disabled" name="reason" class="textbox primary" value="" tabindex="1" type="text">

</dd>
</dl>
</li>
</ul>
</dd>
</dl>
</div>
</div>
</div>
<div class="blockfoot actionbuttons">
<div class="group">
<input class="button" value="Delete Post" tabindex="1" type="submit">
</div>
</div>

<input name="s" value="" type="hidden">
<input name="securitytoken" value="1283378023-bf5033564f41d338bd22f104fb32eb6b8809e598" type="hidden">
<input name="p" value="14883481" type="hidden">
<input name="url" value="http://forums.digitalpoint.com/showthread.php?t=1924581" type="hidden">
<input name="do" value="deletepost" type="hidden">



</form>




<form class="vbform block" action="editpost.php?do=updatepost&amp;p=14883481" onsubmit="return vB_Editor['vB_Editor_001'].prepare_submit(0, 10)" method="post">

<h2 class="blockhead">Your Message</h2>

<div class="blockbody formcontrols">
<div class="section">

<div class="blockrow">
<label for="editreason">Reason for Editing:</label>
<div><input class="primary textbox" id="editreason" name="reason" value="" tabindex="1" type="text"></div>
<p class="description">Optional</p>
</div>

<div class="blockrow">
                        
<p class="description"></p>
<label for="titlefield">Title:</label>
<input name="title" class="primary textbox" id="titlefield" maxlength="85" value="" tabindex="1" type="text">

<img id="posticon_preview" src="clear.gif" alt="" title="Selected post icon">
</div>

<div class="blockrow">
Message originally posted by <a href="member.php?u=460624" target="_blank">dellgx270</a> on Sep 1st 2010 at <span class="time">1:40 pm</span>:
</div>

<div id="vB_Editor_001" class="blockrow texteditor">

<!-- Editor Scripts -->

<!-- / Editor Scripts --> 

<div class="editor">
<div class="editor_controls floatcontainer" id="vB_Editor_001_controls">
<div class="right right_editor_buttons">
<ul>
<li>
<div class="right_editor_button">
<div><img title="Decrease Size" src="http://i.dpstatic.com/editor/resize_0.gif" class="imagebutton" id="vB_Editor_001_cmd_resize_0_100" alt="Decrease Size" width="21" height="9"></div>
<div><img title="Increase Size" src="http://i.dpstatic.com/editor/resize_1.gif" class="imagebutton" id="vB_Editor_001_cmd_resize_1_100" alt="Increase Size" width="21" height="9"></div>
</div>
<img title="Switch Editor Mode" src="http://i.dpstatic.com/editor/switchmode.png" class="imagebutton" id="vB_Editor_001_cmd_switchmode" alt="Switch Editor Mode" style="float: right;" width="20" height="20">
</li>
</ul>
</div>
<ul>

<li>
<img title="Remove Text Formatting" src="http://i.dpstatic.com/editor/removeformat.png" class="imagebutton" id="vB_Editor_001_cmd_removeformat" alt="Remove Text Formatting" width="20" height="20">
</li>

<li class="popupmenu menubutton fonts nomouseover editormenu" id="vB_Editor_001_popup_fontname">
<div id="yui-gen14" class="popupctrl"><div id="vB_Editor_001_fontfield">Fonts</div></div>
<ul id="yui-gen13" class="editorpopupbody popupbody">
<li style="display: none;">&nbsp;</li>
<li class="fontname" style="font-family: Arial;"><a href="javascript://">Arial</a></li> <li class="fontname" style="font-family: Arial Black;"><a href="javascript://">Arial Black</a></li> <li class="fontname" style="font-family: Arial Narrow;"><a href="javascript://">Arial Narrow</a></li> <li class="fontname" style="font-family: Book Antiqua;"><a href="javascript://">Book Antiqua</a></li> <li class="fontname" style="font-family: Century Gothic;"><a href="javascript://">Century Gothic</a></li> <li class="fontname" style="font-family: Comic Sans MS;"><a href="javascript://">Comic Sans MS</a></li> <li class="fontname" style="font-family: Courier New;"><a href="javascript://">Courier New</a></li> <li class="fontname" style="font-family: Fixedsys;"><a href="javascript://">Fixedsys</a></li> <li class="fontname" style="font-family: Franklin Gothic Medium;"><a href="javascript://">Franklin Gothic Medium</a></li> <li class="fontname" style="font-family: Garamond;"><a href="javascript://">Garamond</a></li> <li class="fontname" style="font-family: Georgia;"><a href="javascript://">Georgia</a></li> <li class="fontname" style="font-family: Impact;"><a href="javascript://">Impact</a></li> <li class="fontname" style="font-family: Lucida Console;"><a href="javascript://">Lucida Console</a></li> <li class="fontname" style="font-family: Lucida Sans Unicode;"><a href="javascript://">Lucida Sans Unicode</a></li> <li class="fontname" style="font-family: Microsoft Sans Serif;"><a href="javascript://">Microsoft Sans Serif</a></li> <li class="fontname" style="font-family: Palatino Linotype;"><a href="javascript://">Palatino Linotype</a></li> <li class="fontname" style="font-family: System;"><a href="javascript://">System</a></li> <li class="fontname" style="font-family: Tahoma;"><a href="javascript://">Tahoma</a></li> <li class="fontname" style="font-family: Times New Roman;"><a href="javascript://">Times New Roman</a></li> <li class="fontname" style="font-family: Trebuchet MS;"><a href="javascript://">Trebuchet MS</a></li> <li class="fontname" style="font-family: Verdana;"><a href="javascript://">Verdana</a></li> 

</ul>
</li>


<li class="popupmenu menubutton sizes nomouseover editormenu" id="vB_Editor_001_popup_fontsize">
<div id="yui-gen16" class="popupctrl"><div id="vB_Editor_001_sizefield">Sizes</div></div>
<ul id="yui-gen15" class="editorpopupbody popupbody">
<li style="display: none;">&nbsp;</li>
<li class="fontsize"><a href="javascript://"><font size="1">1</font></a></li> <li class="fontsize"><a href="javascript://"><font size="2">2</font></a></li> <li class="fontsize"><a href="javascript://"><font size="3">3</font></a></li> <li class="fontsize"><a href="javascript://"><font size="4">4</font></a></li> <li class="fontsize"><a href="javascript://"><font size="5">5</font></a></li> <li class="fontsize"><a href="javascript://"><font size="6">6</font></a></li> <li class="fontsize"><a href="javascript://"><font size="7">7</font></a></li> 

</ul>
</li>


<li class="popupmenu menubutton colors imagemenu nomouseover editormenu" id="vB_Editor_001_popup_forecolor" style="position: relative;">
<img src="clear.gif" class="vbedit_colorbar" id="vB_Editor_001_color_bar" alt="" width="21" height="4">
<div class="popupctrl" id="vB_Editor_001_colorfield"><img src="http://i.dpstatic.com/editor/color.png" id="vB_Editor_001_color_out" class="vbedit_colorbutton" alt="" width="21" height="16"></div>
<ul id="colorrow" class="editorpopupbody popupbody">
<li id="vB_Editor_001_color_Black" class="colorbutton"><div style="background-color: Black;"></div></li>  
<li id="vB_Editor_001_color_Sienna" class="colorbutton"><div style="background-color: Sienna;"></div></li>  
<li id="vB_Editor_001_color_DarkOliveGreen" class="colorbutton"><div style="background-color: DarkOliveGreen;"></div></li> 
<li id="vB_Editor_001_color_DarkGreen" class="colorbutton"><div style="background-color: DarkGreen;"></div></li> 
<li id="vB_Editor_001_color_DarkSlateBlue" class="colorbutton"><div style="background-color: DarkSlateBlue;"></div></li>  
<li id="vB_Editor_001_color_Navy" class="colorbutton"><div style="background-color: Navy;"></div></li> 
<li id="vB_Editor_001_color_Indigo" class="colorbutton"><div style="background-color: Indigo;"></div></li>  
<li id="vB_Editor_001_color_DarkSlateGray" class="colorbutton"><div style="background-color: DarkSlateGray;"></div></li> 
<li id="vB_Editor_001_color_DarkRed" class="colorbutton"><div style="background-color: DarkRed;"></div></li> 

<li id="vB_Editor_001_color_DarkOrange" class="colorbutton"><div style="background-color: DarkOrange;"></div></li> 
<li id="vB_Editor_001_color_Olive" class="colorbutton"><div style="background-color: Olive;"></div></li> 
<li id="vB_Editor_001_color_Green" class="colorbutton"><div style="background-color: Green;"></div></li> 
<li id="vB_Editor_001_color_Teal" class="colorbutton"><div style="background-color: Teal;"></div></li> 
<li id="vB_Editor_001_color_Blue" class="colorbutton"><div style="background-color: Blue;"></div></li> 
<li id="vB_Editor_001_color_SlateGray" class="colorbutton"><div style="background-color: SlateGray;"></div></li> 
<li id="vB_Editor_001_color_DimGray" class="colorbutton"><div style="background-color: DimGray;"></div></li> 
<li id="vB_Editor_001_color_Red" class="colorbutton"><div style="background-color: Red;"></div></li> 
<li id="vB_Editor_001_color_SandyBrown" class="colorbutton"><div style="background-color: SandyBrown;"></div></li> 
<li id="vB_Editor_001_color_YellowGreen" class="colorbutton"><div style="background-color: YellowGreen;"></div></li> 
<li id="vB_Editor_001_color_SeaGreen" class="colorbutton"><div style="background-color: SeaGreen;"></div></li> 
<li id="vB_Editor_001_color_MediumTurquoise" class="colorbutton"><div style="background-color: MediumTurquoise;"></div></li> 
<li id="vB_Editor_001_color_RoyalBlue" class="colorbutton"><div style="background-color: RoyalBlue;"></div></li> 
<li id="vB_Editor_001_color_Purple" class="colorbutton"><div style="background-color: Purple;"></div></li> 
<li id="vB_Editor_001_color_Gray" class="colorbutton"><div style="background-color: Gray;"></div></li> 
<li id="vB_Editor_001_color_Magenta" class="colorbutton"><div style="background-color: Magenta;"></div></li> 
<li id="vB_Editor_001_color_Orange" class="colorbutton"><div style="background-color: Orange;"></div></li> 

<li id="vB_Editor_001_color_Yellow" class="colorbutton"><div style="background-color: Yellow;"></div></li> 
<li id="vB_Editor_001_color_Lime" class="colorbutton"><div style="background-color: Lime;"></div></li> 
<li id="vB_Editor_001_color_Cyan" class="colorbutton"><div style="background-color: Cyan;"></div></li> 
<li id="vB_Editor_001_color_DeepSkyBlue" class="colorbutton"><div style="background-color: DeepSkyBlue;"></div></li> 
<li id="vB_Editor_001_color_DarkOrchid" class="colorbutton"><div style="background-color: DarkOrchid;"></div></li> 
<li id="vB_Editor_001_color_Silver" class="colorbutton"><div style="background-color: Silver;"></div></li> 
<li id="vB_Editor_001_color_Pink" class="colorbutton"><div style="background-color: Pink;"></div></li> 
<li id="vB_Editor_001_color_Wheat" class="colorbutton"><div style="background-color: Wheat;"></div></li> 
<li id="vB_Editor_001_color_LemonChiffon" class="colorbutton"><div style="background-color: LemonChiffon;"></div></li> 
<li id="vB_Editor_001_color_PaleGreen" class="colorbutton"><div style="background-color: PaleGreen;"></div></li> 
<li id="vB_Editor_001_color_PaleTurquoise" class="colorbutton"><div style="background-color: PaleTurquoise;"></div></li> 
<li id="vB_Editor_001_color_LightBlue" class="colorbutton"><div style="background-color: LightBlue;"></div></li> 
<li id="vB_Editor_001_color_Plum" class="colorbutton"><div style="background-color: Plum;"></div></li> 
<li id="vB_Editor_001_color_White" class="colorbutton"><div style="background-color: White;"></div></li>  
</ul>
</li>

<li class="popupmenu menubutton smilies imagemenu nomouseover editormenu" id="vB_Editor_001_popup_smilie">
<div id="yui-gen18" class="popupctrl"><img title="Smilies" src="http://i.dpstatic.com/editor/smilie.png" alt="Smilies" width="20" height="20"></div>
<ul id="yui-gen17" class="editorpopupbody popupbody">
<li style="display: none;">&nbsp;</li>
<li class="category"><div>Generic Smilies</div></li> 
<li class="smilie" id="smilie_dropdown_1"><div><img title=":)" src="http://s.dpstatic.com/smilies/smile.png" alt=":)"> Smile</div></li> 
<li class="smilie" id="smilie_dropdown_11"><div><img title=":(" src="http://s.dpstatic.com/smilies/frown.png" alt=":("> Frown</div></li> 
<li class="smilie" id="smilie_dropdown_10"><div><img title=":confused:" src="http://s.dpstatic.com/smilies/confused.png" alt=":confused:"> Confused</div></li> 
<li class="smilie" id="smilie_dropdown_8"><div><img title=":mad:" src="http://s.dpstatic.com/smilies/mad.png" alt=":mad:"> Mad</div></li> 

<li class="smilie" id="smilie_dropdown_5"><div><img title=":p" src="http://s.dpstatic.com/smilies/tongue.png" alt=":p"> Stick Out Tongue</div></li> 
<li class="smilie" id="smilie_dropdown_4"><div><img title=";)" src="http://s.dpstatic.com/smilies/wink.png" alt=";)"> Wink</div></li> 
<li class="smilie" id="smilie_dropdown_3"><div><img title=":D" src="http://s.dpstatic.com/smilies/biggrin.png" alt=":D"> Big Grin</div></li> 
<li class="smilie" id="smilie_dropdown_2"><div><img title=":o" src="http://s.dpstatic.com/smilies/redface.png" alt=":o"> Embarrassment</div></li> 
<li class="smilie" id="smilie_dropdown_7"><div><img title=":rolleyes:" src="http://s.dpstatic.com/smilies/rolleyes.png" alt=":rolleyes:"> Roll Eyes (Sarcastic)</div></li> 
<li class="smilie" id="smilie_dropdown_6"><div><img title=":cool:" src="http://s.dpstatic.com/smilies/cool.png" alt=":cool:"> Cool</div></li> 

<li class="smilie" id="smilie_dropdown_9"><div><img title=":eek:" src="http://s.dpstatic.com/smilies/eek.png" alt=":eek:"> EEK!</div></li> 

</ul>
</li>


<li class="popupmenu menubutton attach imagemenu nomouseover editormenu" id="vB_Editor_001_popup_attach">
<div id="yui-gen19" class="popupctrl"><img title="Attachments" src="http://i.dpstatic.com/editor/attach.png" alt="Attachments" width="20" height="20"></div>
<ul id="attachlist" class="editorpopupbody popupbody noempty">
<li class="noempty" style="display: none;">&nbsp;</li>
<li class="category noempty" id="manageattach"><div>Manage Attachments</div></li>
</ul>
</li>

<li>

<img title="Undo" src="http://i.dpstatic.com/editor/undo.png" class="imagebutton" id="vB_Editor_001_cmd_undo" alt="Undo" width="20" height="20">
<img title="Redo" src="http://i.dpstatic.com/editor/redo.png" class="imagebutton" id="vB_Editor_001_cmd_redo" alt="Redo" width="20" height="20">
</li>

</ul>


<ul>

<li>
<img src="http://i.dpstatic.com/editor/bold.png" class="imagebutton" id="vB_Editor_001_cmd_bold" alt="" width="20" height="20">
<img src="http://i.dpstatic.com/editor/italic.png" class="imagebutton" id="vB_Editor_001_cmd_italic" alt="" width="20" height="20">
<img src="http://i.dpstatic.com/editor/underline.png" class="imagebutton" id="vB_Editor_001_cmd_underline" alt="" width="20" height="20">
</li>


<li>

<img title="Align Left" src="http://i.dpstatic.com/editor/justifyleft.png" class="imagebutton" id="vB_Editor_001_cmd_justifyleft" alt="Align Left" width="20" height="20">
<img title="Align Center" src="http://i.dpstatic.com/editor/justifycenter.png" class="imagebutton" id="vB_Editor_001_cmd_justifycenter" alt="Align Center" width="20" height="20">
<img title="Align Right" src="http://i.dpstatic.com/editor/justifyright.png" class="imagebutton" id="vB_Editor_001_cmd_justifyright" alt="Align Right" width="20" height="20">

</li>


<li>

<img title="Ordered List" src="http://i.dpstatic.com/editor/insertorderedlist.png" class="imagebutton" id="vB_Editor_001_cmd_insertorderedlist" alt="Ordered List" width="20" height="20">
<img title="Unordered List" src="http://i.dpstatic.com/editor/insertunorderedlist.png" class="imagebutton" id="vB_Editor_001_cmd_insertunorderedlist" alt="Unordered List" width="20" height="20">


<img title="Decrease Indent" src="http://i.dpstatic.com/editor/outdent.png" class="imagebutton" id="vB_Editor_001_cmd_outdent" alt="Decrease Indent" width="20" height="20">
<img title="Increase Indent" src="http://i.dpstatic.com/editor/indent.png" class="imagebutton" id="vB_Editor_001_cmd_indent" alt="Increase Indent" width="20" height="20">

</li>


<li>

<img title="Insert Link" src="http://i.dpstatic.com/editor/createlink.png" class="imagebutton" id="vB_Editor_001_cmd_createlink" alt="Insert Link" width="20" height="20">
<img title="Remove Link" src="http://i.dpstatic.com/editor/unlink.png" class="imagebutton" id="vB_Editor_001_cmd_unlink" alt="Remove Link" width="20" height="20">
<img title="Insert Email Link" src="http://i.dpstatic.com/editor/email.png" class="imagebutton" id="vB_Editor_001_cmd_email" alt="Insert Email Link" width="20" height="20">


<img title="Insert Image" src="http://i.dpstatic.com/editor/insertimage.png" class="imagebutton" id="vB_Editor_001_cmd_insertimage" alt="Insert Image" width="20" height="20">
<img title="Insert Video" src="http://i.dpstatic.com/editor/video.png" class="imagebutton" id="vB_Editor_001_cmd_insertvideo" alt="Insert Video" width="21" height="20">

</li>


<li>

<img title="Wrap [QUOTE] tags around selected text" src="http://i.dpstatic.com/editor/quote.png" class="imagebutton" id="vB_Editor_001_cmd_wrap0_quote" alt="Wrap [QUOTE] tags around selected text" width="20" height="20">
</li>


<li>
<img title="Wrap [CODE] tags around selected text" src="http://i.dpstatic.com/editor/code.png" class="imagebutton" id="vB_Editor_001_cmd_wrap0_code" alt="Wrap [CODE] tags around selected text" width="20" height="20">
<img title="Wrap [HTML] tags around selected text" src="http://i.dpstatic.com/editor/html.png" class="imagebutton" id="vB_Editor_001_cmd_wrap0_html" alt="Wrap [HTML] tags around selected text" width="20" height="20">
<img title="Wrap [PHP] tags around selected text" src="http://i.dpstatic.com/editor/php.png" class="imagebutton" id="vB_Editor_001_cmd_wrap0_php" alt="Wrap [PHP] tags around selected text" width="20" height="20">
</li>


</ul>

</div>
<div class="editor_textbox_container">
<div class="editor_textbox editor_textbox_smilie">
<fieldset><textarea name="message" id="vB_Editor_001_textarea" rows="10" cols="80" dir="ltr" class="content" tabindex="1">[QUOTE=rinoa_26;14877860]Hi i need to layout  my form so that when maximized it will display like this

 FirstName            LastName           Phone 
&lt;FirstName Input box&gt;          &lt;LastName Inputbox&gt;        &lt;Phoneinputbox&gt;            &lt;button&gt;

Firstname &lt;inputbox&gt;
Lastname &lt;inputbox&gt;
Phone &lt;inputbox&gt;
&lt;button&gt;
sssssssssssssssssssssssssssssssssssssssssssssssssss

and when minimized it will display like this
Hi i need to layout my form so that when maximized it will display like this

FirstName LastName Phone
&lt;FirstName Input box&gt; &lt;LastName Inputbox&gt; &lt;Phoneinputbox&gt; &lt;button&gt;


and when minimized it will display like this

Firstname &lt;inputbox&gt;
Lastname &lt;inputbox&gt;
Phone &lt;inputbox&gt;
&lt;button&gt;</textarea></fieldset>

</div>
</div>

<div class="editor_smiliebox">


<ul class="smiliebox floatcontainer" id="vB_Editor_001_smiliebox">

<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/smile.png" id="vB_Editor_001_smilie_1" alt=":)" title="Smile" border="">
</div>
</div>
</li> 
<li>
<div class="table">

<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/frown.png" id="vB_Editor_001_smilie_11" alt=":(" title="Frown" border="">
</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/confused.png" id="vB_Editor_001_smilie_10" alt=":confused:" title="Confused" border="">
</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/mad.png" id="vB_Editor_001_smilie_8" alt=":mad:" title="Mad" border="">
</div>

</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/tongue.png" id="vB_Editor_001_smilie_5" alt=":p" title="Stick Out Tongue" border="">
</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/wink.png" id="vB_Editor_001_smilie_4" alt=";)" title="Wink" border="">
</div>
</div>
</li> 
<li>

<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/biggrin.png" id="vB_Editor_001_smilie_3" alt=":D" title="Big Grin" border="">
</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/redface.png" id="vB_Editor_001_smilie_2" alt=":o" title="Embarrassment" border="">
</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/rolleyes.png" id="vB_Editor_001_smilie_7" alt=":rolleyes:" title="Roll Eyes (Sarcastic)" border="">

</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/cool.png" id="vB_Editor_001_smilie_6" alt=":cool:" title="Cool" border="">
</div>
</div>
</li> 
<li>
<div class="table">
<div class="tablecell">
<img style="cursor: pointer;" src="http://s.dpstatic.com/smilies/eek.png" id="vB_Editor_001_smilie_9" alt=":eek:" title="EEK!" border="">
</div>
</div>
</li> 

</ul>
 
</div>

</div>
</div>

<input name="wysiwyg" id="vB_Editor_001_mode" value="0" type="hidden">


<div class="blockrow posticons">
<label class="full">Post Icons:</label>
<table border="0" cellpadding="0" cellspacing="0">

<tbody><tr>

<td>
<input name="iconid" value="1" id="rb_iconid_1" tabindex="1" onclick="swap_posticon('pi_1')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_1"><img title="Post" src="http://i.dpstatic.com/icon/icon1.png" alt="Post" id="pi_1" onclick="rb_iconid_1.click()"></label>
</td>
 
<td>
<input name="iconid" value="13" id="rb_iconid_13" tabindex="1" onclick="swap_posticon('pi_13')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_13"><img title="Thumbs down" src="http://i.dpstatic.com/icon/icon13.png" alt="Thumbs down" id="pi_13" onclick="rb_iconid_13.click()"></label>
</td>
 
<td>

<input name="iconid" value="12" id="rb_iconid_12" tabindex="1" onclick="swap_posticon('pi_12')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_12"><img title="Wink" src="http://i.dpstatic.com/icon/icon12.png" alt="Wink" id="pi_12" onclick="rb_iconid_12.click()"></label>
</td>
 
<td>
<input name="iconid" value="11" id="rb_iconid_11" tabindex="1" onclick="swap_posticon('pi_11')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_11"><img title="Red face" src="http://i.dpstatic.com/icon/icon11.png" alt="Red face" id="pi_11" onclick="rb_iconid_11.click()"></label>
</td>
 
<td>
<input name="iconid" value="10" id="rb_iconid_10" tabindex="1" onclick="swap_posticon('pi_10')" type="radio">
</td>
<td width="12%">

<label for="rb_iconid_10"><img title="Talking" src="http://i.dpstatic.com/icon/icon10.png" alt="Talking" id="pi_10" onclick="rb_iconid_10.click()"></label>
</td>
 
<td>
<input name="iconid" value="9" id="rb_iconid_9" tabindex="1" onclick="swap_posticon('pi_9')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_9"><img title="Unhappy" src="http://i.dpstatic.com/icon/icon9.png" alt="Unhappy" id="pi_9" onclick="rb_iconid_9.click()"></label>
</td>
 
<td>
<input name="iconid" value="8" id="rb_iconid_8" tabindex="1" onclick="swap_posticon('pi_8')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_8"><img title="Angry" src="http://i.dpstatic.com/icon/icon8.png" alt="Angry" id="pi_8" onclick="rb_iconid_8.click()"></label>
</td>
</tr> <tr>

<td>
<input name="iconid" value="7" id="rb_iconid_7" tabindex="1" onclick="swap_posticon('pi_7')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_7"><img title="Smile" src="http://i.dpstatic.com/icon/icon7.png" alt="Smile" id="pi_7" onclick="rb_iconid_7.click()"></label>
</td>
 
<td>
<input name="iconid" value="6" id="rb_iconid_6" tabindex="1" onclick="swap_posticon('pi_6')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_6"><img title="Cool" src="http://i.dpstatic.com/icon/icon6.png" alt="Cool" id="pi_6" onclick="rb_iconid_6.click()"></label>
</td>
 
<td>
<input name="iconid" value="5" id="rb_iconid_5" tabindex="1" onclick="swap_posticon('pi_5')" type="radio">
</td>

<td width="12%">
<label for="rb_iconid_5"><img title="Question" src="http://i.dpstatic.com/icon/icon5.png" alt="Question" id="pi_5" onclick="rb_iconid_5.click()"></label>
</td>
 
<td>
<input name="iconid" value="4" id="rb_iconid_4" tabindex="1" onclick="swap_posticon('pi_4')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_4"><img title="Exclamation" src="http://i.dpstatic.com/icon/icon4.png" alt="Exclamation" id="pi_4" onclick="rb_iconid_4.click()"></label>
</td>
 
<td>
<input name="iconid" value="3" id="rb_iconid_3" tabindex="1" onclick="swap_posticon('pi_3')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_3"><img title="Lightbulb" src="http://i.dpstatic.com/icon/icon3.png" alt="Lightbulb" id="pi_3" onclick="rb_iconid_3.click()"></label>
</td>

 
<td>
<input name="iconid" value="2" id="rb_iconid_2" tabindex="1" onclick="swap_posticon('pi_2')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_2"><img title="Arrow" src="http://i.dpstatic.com/icon/icon2.png" alt="Arrow" id="pi_2" onclick="rb_iconid_2.click()"></label>
</td>
 
<td>
<input name="iconid" value="14" id="rb_iconid_14" tabindex="1" onclick="swap_posticon('pi_14')" type="radio">
</td>
<td width="12%">
<label for="rb_iconid_14"><img title="Thumbs up" src="http://i.dpstatic.com/icon/icon14.png" alt="Thumbs up" id="pi_14" onclick="rb_iconid_14.click()"></label>
</td>
</tr> 


<tr>
<td colspan="14">

<label for="rb_iconid_0"><input name="iconid" value="0" id="rb_iconid_0" tabindex="1" onclick="swap_posticon(null)" checked="checked" type="radio">&nbsp;No icon</label>
</td>
</tr>
</tbody></table>
<p class="singledescription">You may choose an icon for your message from this list</p>
</div>
 

</div>
</div>

<div class="blockfoot actionbuttons">
<div class="group">
<input class="button" name="sbutton" id="vB_Editor_001_save" value="Save Changes" accesskey="s" tabindex="1" type="submit">
<input class="button" value="Preview Changes" name="preview" accesskey="r" tabindex="1" type="submit">
</div>
</div>
</asp:Content>

