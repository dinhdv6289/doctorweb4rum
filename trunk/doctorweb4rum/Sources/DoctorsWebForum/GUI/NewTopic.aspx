<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewTopic.aspx.cs" Inherits="GUI_NewTopic" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form onsubmit="return vB_Editor['vB_Editor_001'].prepare_submit(this.subject.value, 10)"
        name="vbform" method="post" action="newthread.php?do=postthread&amp;f=21" class="vbform block">
        <h2 class="blockhead">
            Your Message</h2>
        <div class="blockbody formcontrols">
            <div class="section">

                <div class="blockrow">
                    You are creating a new thread in <span class="bold">General Marketing</span>
                    <div style="padding: 10px;">
                        <span class="bold">Description:</span> General category for marketing related topics.<br>
                        <br>
                        <li>
                            <label for="cb_confirm_forum">
                                <input type="checkbox" onclick="double_check_confirm();" tabindex="1" value="1" id="cb_confirm_forum"
                                    name="confirm_forum">
                                I believe <span class="bold">General Marketing</span> is the BEST section for this
                                topic</label>
                        </li>
                    </div>
                </div>
                <div class="blockrow">
                    <label class="full" for="subject">
                        Title:</label>
                    <input type="text" tabindex="1" maxlength="85" onblur="if(this.value=='')this.value='   [Something descriptive here will yield more responses]';"
                        onfocus="if(this.value=='   [Something descriptive here will yield more responses]')this.value='';"
                        value="   [Something descriptive here will yield more responses]" id="subject"
                        name="subject" class="primary full textbox" disabled="">
                    &nbsp;<img alt="" src="clear.gif" id="display_posticon">
                </div>
                <div class="blockrow texteditor" id="vB_Editor_001">

                    <!-- / Editor Scripts -->
                    <div class="editor">
                        <div id="vB_Editor_001_controls" class="editor_controls floatcontainer">
                            <div class="right right_editor_buttons">
                                <ul>
                                    <li>
                                        <div class="right_editor_button">
                                            <div>
                                                <img height="9" width="21" alt="Decrease Size" id="vB_Editor_001_cmd_resize_0_100"
                                                    class="imagebutton" src="http://i.dpstatic.com/editor/resize_0.gif" title="Decrease Size"></div>
                                            <div>
                                                <img height="9" width="21" alt="Increase Size" id="vB_Editor_001_cmd_resize_1_100"
                                                    class="imagebutton" src="http://i.dpstatic.com/editor/resize_1.gif" title="Increase Size"></div>
                                        </div>
                                        <img height="20" width="20" style="float: right;" alt="Switch Editor Mode" id="vB_Editor_001_cmd_switchmode"
                                            class="imagebutton" src="http://i.dpstatic.com/editor/switchmode.png" title="Switch Editor Mode">
                                    </li>
                                </ul>
                            </div>
                            <ul>
                                <li>
                                    <img height="20" width="20" alt="Remove Text Formatting" id="vB_Editor_001_cmd_removeformat"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/removeformat.png" title="Remove Text Formatting">
                                </li>
                                <li id="vB_Editor_001_popup_fontname" class="popupmenu menubutton fonts nomouseover editormenu">
                                    <div class="popupctrl" id="yui-gen14">
                                        <div id="vB_Editor_001_fontfield">
                                            Fonts</div>
                                    </div>
                                    <ul class="editorpopupbody popupbody" id="yui-gen13">
                                        <li style="display: none;">&nbsp;</li>
                                        <li style="font-family: Arial;" class="fontname"><a href="javascript://">Arial</a></li><li style="font-family: Arial Black;" class="fontname"><a href="javascript://">Arial
                                            Black</a></li><li style="font-family: Arial Narrow;" class="fontname"><a href="javascript://">Arial
                                            Narrow</a></li><li style="font-family: Book Antiqua;" class="fontname"><a href="javascript://">Book
                                            Antiqua</a></li><li style="font-family: Century Gothic;" class="fontname"><a href="javascript://">Century
                                            Gothic</a></li><li style="font-family: Comic Sans MS;" class="fontname"><a href="javascript://">Comic
                                            Sans MS</a></li><li style="font-family: Courier New;" class="fontname"><a href="javascript://">Courier
                                            New</a></li><li style="font-family: Fixedsys;" class="fontname"><a href="javascript://">Fixedsys</a></li><li style="font-family: Franklin Gothic Medium;" class="fontname"><a href="javascript://">
                                            Franklin Gothic Medium</a></li><li style="font-family: Garamond;" class="fontname"><a href="javascript://">Garamond</a></li><li style="font-family: Georgia;" class="fontname"><a href="javascript://">Georgia</a></li><li style="font-family: Impact;" class="fontname"><a href="javascript://">Impact</a></li><li style="font-family: Lucida Console;" class="fontname"><a href="javascript://">Lucida
                                            Console</a></li><li style="font-family: Lucida Sans Unicode;" class="fontname"><a href="javascript://">
                                            Lucida Sans Unicode</a></li><li style="font-family: Microsoft Sans Serif;" class="fontname"><a href="javascript://">
                                            Microsoft Sans Serif</a></li><li style="font-family: Palatino Linotype;" class="fontname"><a href="javascript://">
                                            Palatino Linotype</a></li><li style="font-family: System;" class="fontname"><a href="javascript://">System</a></li><li style="font-family: Tahoma;" class="fontname"><a href="javascript://">Tahoma</a></li><li style="font-family: Times New Roman;" class="fontname"><a href="javascript://">Times
                                            New Roman</a></li><li style="font-family: Trebuchet MS;" class="fontname"><a href="javascript://">Trebuchet
                                            MS</a></li><li style="font-family: Verdana;" class="fontname"><a href="javascript://">Verdana</a></li></ul>
                                </li>
                                <li id="vB_Editor_001_popup_fontsize" class="popupmenu menubutton sizes nomouseover editormenu">
                                    <div class="popupctrl" id="yui-gen16">
                                        <div id="vB_Editor_001_sizefield">
                                            Sizes</div>
                                    </div>
                                    <ul class="editorpopupbody popupbody" id="yui-gen15">
                                        <li style="display: none;">&nbsp;</li>
                                        <li class="fontsize"><a href="javascript://"><font size="1">1</font></a></li><li class="fontsize"><a href="javascript://"><font size="2">2</font></a></li><li class="fontsize"><a href="javascript://"><font size="3">3</font></a></li><li class="fontsize"><a href="javascript://"><font size="4">4</font></a></li><li class="fontsize"><a href="javascript://"><font size="5">5</font></a></li><li class="fontsize"><a href="javascript://"><font size="6">6</font></a></li><li class="fontsize"><a href="javascript://"><font size="7">7</font></a></li></ul>
                                </li>
                                <li style="position: relative;" id="vB_Editor_001_popup_forecolor" class="popupmenu menubutton colors imagemenu nomouseover editormenu">
                                    <img height="4" width="21" alt="" id="vB_Editor_001_color_bar" class="vbedit_colorbar"
                                        src="clear.gif">
                                    <div id="vB_Editor_001_colorfield" class="popupctrl">
                                        <img height="16" width="21" alt="" class="vbedit_colorbutton" id="vB_Editor_001_color_out"
                                            src="http://i.dpstatic.com/editor/color.png"></div>
                                    <ul class="editorpopupbody popupbody" id="colorrow">
                                        <li class="colorbutton" id="vB_Editor_001_color_Black">
                                            <div style="background-color: Black;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Sienna">
                                            <div style="background-color: Sienna;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkOliveGreen">
                                            <div style="background-color: DarkOliveGreen;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkGreen">
                                            <div style="background-color: DarkGreen;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkSlateBlue">
                                            <div style="background-color: DarkSlateBlue;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Navy">
                                            <div style="background-color: Navy;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Indigo">
                                            <div style="background-color: Indigo;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkSlateGray">
                                            <div style="background-color: DarkSlateGray;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkRed">
                                            <div style="background-color: DarkRed;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkOrange">
                                            <div style="background-color: DarkOrange;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Olive">
                                            <div style="background-color: Olive;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Green">
                                            <div style="background-color: Green;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Teal">
                                            <div style="background-color: Teal;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Blue">
                                            <div style="background-color: Blue;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_SlateGray">
                                            <div style="background-color: SlateGray;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DimGray">
                                            <div style="background-color: DimGray;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Red">
                                            <div style="background-color: Red;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_SandyBrown">
                                            <div style="background-color: SandyBrown;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_YellowGreen">
                                            <div style="background-color: YellowGreen;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_SeaGreen">
                                            <div style="background-color: SeaGreen;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_MediumTurquoise">
                                            <div style="background-color: MediumTurquoise;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_RoyalBlue">
                                            <div style="background-color: RoyalBlue;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Purple">
                                            <div style="background-color: Purple;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Gray">
                                            <div style="background-color: Gray;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Magenta">
                                            <div style="background-color: Magenta;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Orange">
                                            <div style="background-color: Orange;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Yellow">
                                            <div style="background-color: Yellow;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Lime">
                                            <div style="background-color: Lime;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Cyan">
                                            <div style="background-color: Cyan;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DeepSkyBlue">
                                            <div style="background-color: DeepSkyBlue;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_DarkOrchid">
                                            <div style="background-color: DarkOrchid;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Silver">
                                            <div style="background-color: Silver;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Pink">
                                            <div style="background-color: Pink;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Wheat">
                                            <div style="background-color: Wheat;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_LemonChiffon">
                                            <div style="background-color: LemonChiffon;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_PaleGreen">
                                            <div style="background-color: PaleGreen;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_PaleTurquoise">
                                            <div style="background-color: PaleTurquoise;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_LightBlue">
                                            <div style="background-color: LightBlue;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_Plum">
                                            <div style="background-color: Plum;">
                                            </div>
                                        </li>
                                        <li class="colorbutton" id="vB_Editor_001_color_White">
                                            <div style="background-color: White;">
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li id="vB_Editor_001_popup_smilie" class="popupmenu menubutton smilies imagemenu nomouseover editormenu">
                                    <div class="popupctrl" id="yui-gen18">
                                        <img height="20" width="20" alt="Smilies" src="http://i.dpstatic.com/editor/smilie.png"
                                            title="Smilies"></div>
                                    <ul class="editorpopupbody popupbody" id="yui-gen17">
                                        <li style="display: none;">&nbsp;</li>
                                        <li class="category">
                                            <div>
                                                Generic Smilies</div>
                                        </li>
                                        <li id="smilie_dropdown_1" class="smilie">
                                            <div>
                                                <img alt=":)" src="http://s.dpstatic.com/smilies/smile.png" title=":)">
                                                Smile</div>
                                        </li>
                                        <li id="smilie_dropdown_11" class="smilie">
                                            <div>
                                                <img alt=":(" src="http://s.dpstatic.com/smilies/frown.png" title=":(">
                                                Frown</div>
                                        </li>
                                        <li id="smilie_dropdown_10" class="smilie">
                                            <div>
                                                <img alt=":confused:" src="http://s.dpstatic.com/smilies/confused.png" title=":confused:">
                                                Confused</div>
                                        </li>
                                        <li id="smilie_dropdown_8" class="smilie">
                                            <div>
                                                <img alt=":mad:" src="http://s.dpstatic.com/smilies/mad.png" title=":mad:">
                                                Mad</div>
                                        </li>
                                        <li id="smilie_dropdown_5" class="smilie">
                                            <div>
                                                <img alt=":p" src="http://s.dpstatic.com/smilies/tongue.png" title=":p">
                                                Stick Out Tongue</div>
                                        </li>
                                        <li id="smilie_dropdown_4" class="smilie">
                                            <div>
                                                <img alt=";)" src="http://s.dpstatic.com/smilies/wink.png" title=";)">
                                                Wink</div>
                                        </li>
                                        <li id="smilie_dropdown_3" class="smilie">
                                            <div>
                                                <img alt=":D" src="http://s.dpstatic.com/smilies/biggrin.png" title=":D">
                                                Big Grin</div>
                                        </li>
                                        <li id="smilie_dropdown_2" class="smilie">
                                            <div>
                                                <img alt=":o" src="http://s.dpstatic.com/smilies/redface.png" title=":o">
                                                Embarrassment</div>
                                        </li>
                                        <li id="smilie_dropdown_7" class="smilie">
                                            <div>
                                                <img alt=":rolleyes:" src="http://s.dpstatic.com/smilies/rolleyes.png" title=":rolleyes:">
                                                Roll Eyes (Sarcastic)</div>
                                        </li>
                                        <li id="smilie_dropdown_6" class="smilie">
                                            <div>
                                                <img alt=":cool:" src="http://s.dpstatic.com/smilies/cool.png" title=":cool:">
                                                Cool</div>
                                        </li>
                                        <li id="smilie_dropdown_9" class="smilie">
                                            <div>
                                                <img alt=":eek:" src="http://s.dpstatic.com/smilies/eek.png" title=":eek:">
                                                EEK!</div>
                                        </li>
                                    </ul>
                                </li>
                                <li id="vB_Editor_001_popup_attach" class="popupmenu menubutton attach imagemenu nomouseover editormenu">
                                    <div class="popupctrl" id="yui-gen19">
                                        <img height="20" width="20" alt="Attachments" src="http://i.dpstatic.com/editor/attach.png"
                                            title="Attachments"></div>
                                    <ul class="editorpopupbody popupbody noempty" id="attachlist">
                                        <li style="display: none;" class="noempty">&nbsp;</li>
                                        <li id="manageattach" class="category noempty">
                                            <div>
                                                Manage Attachments</div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <img height="20" width="20" alt="Undo" id="vB_Editor_001_cmd_undo" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/undo.png" title="Undo">
                                    <img height="20" width="20" alt="Redo" id="vB_Editor_001_cmd_redo" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/redo.png" title="Redo">
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <img height="20" width="20" alt="" id="vB_Editor_001_cmd_bold" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/bold.png">
                                    <img height="20" width="20" alt="" id="vB_Editor_001_cmd_italic" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/italic.png">
                                    <img height="20" width="20" alt="" id="vB_Editor_001_cmd_underline" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/underline.png">
                                </li>
                                <li>
                                    <img height="20" width="20" alt="Align Left" id="vB_Editor_001_cmd_justifyleft" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/justifyleft.png" title="Align Left">
                                    <img height="20" width="20" alt="Align Center" id="vB_Editor_001_cmd_justifycenter"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/justifycenter.png" title="Align Center">
                                    <img height="20" width="20" alt="Align Right" id="vB_Editor_001_cmd_justifyright"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/justifyright.png" title="Align Right">
                                </li>
                                <li>
                                    <img height="20" width="20" alt="Ordered List" id="vB_Editor_001_cmd_insertorderedlist"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/insertorderedlist.png"
                                        title="Ordered List">
                                    <img height="20" width="20" alt="Unordered List" id="vB_Editor_001_cmd_insertunorderedlist"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/insertunorderedlist.png"
                                        title="Unordered List">
                                    <img height="20" width="20" alt="Decrease Indent" id="vB_Editor_001_cmd_outdent"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/outdent.png" title="Decrease Indent">
                                    <img height="20" width="20" alt="Increase Indent" id="vB_Editor_001_cmd_indent" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/indent.png" title="Increase Indent">
                                </li>
                                <li>
                                    <img height="20" width="20" alt="Insert Link" id="vB_Editor_001_cmd_createlink" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/createlink.png" title="Insert Link">
                                    <img height="20" width="20" alt="Remove Link" id="vB_Editor_001_cmd_unlink" class="imagebutton"
                                        src="http://i.dpstatic.com/editor/unlink.png" title="Remove Link">
                                    <img height="20" width="20" alt="Insert Email Link" id="vB_Editor_001_cmd_email"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/email.png" title="Insert Email Link">
                                    <img height="20" width="20" alt="Insert Image" id="vB_Editor_001_cmd_insertimage"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/insertimage.png" title="Insert Image">
                                    <img height="20" width="21" alt="Insert Video" id="vB_Editor_001_cmd_insertvideo"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/video.png" title="Insert Video">
                                </li>
                                <li>
                                    <img height="20" width="20" alt="Wrap [QUOTE] tags around selected text" id="vB_Editor_001_cmd_wrap0_quote"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/quote.png" title="Wrap [QUOTE] tags around selected text">
                                </li>
                                <li>
                                    <img height="20" width="20" alt="Wrap [CODE] tags around selected text" id="vB_Editor_001_cmd_wrap0_code"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/code.png" title="Wrap [CODE] tags around selected text">
                                    <img height="20" width="20" alt="Wrap [HTML] tags around selected text" id="vB_Editor_001_cmd_wrap0_html"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/html.png" title="Wrap [HTML] tags around selected text">
                                    <img height="20" width="20" alt="Wrap [PHP] tags around selected text" id="vB_Editor_001_cmd_wrap0_php"
                                        class="imagebutton" src="http://i.dpstatic.com/editor/php.png" title="Wrap [PHP] tags around selected text">
                                </li>
                            </ul>
                        </div>
                        <div class="editor_textbox_container">
                            <div class="editor_textbox editor_textbox_smilie">
                                <fieldset>
                                    <textarea tabindex="1" class="forum" dir="ltr" cols="80" rows="10" id="vB_Editor_001_textarea"
                                        name="message" disabled=""></textarea></fieldset>
                            </div>
                        </div>
                        <div class="editor_smiliebox">
                            <ul id="vB_Editor_001_smiliebox" class="smiliebox floatcontainer">
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Smile" alt=":)" id="vB_Editor_001_smilie_1" src="http://s.dpstatic.com/smilies/smile.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Frown" alt=":(" id="vB_Editor_001_smilie_11" src="http://s.dpstatic.com/smilies/frown.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Confused" alt=":confused:" id="vB_Editor_001_smilie_10" src="http://s.dpstatic.com/smilies/confused.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Mad" alt=":mad:" id="vB_Editor_001_smilie_8" src="http://s.dpstatic.com/smilies/mad.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Stick Out Tongue" alt=":p" id="vB_Editor_001_smilie_5" src="http://s.dpstatic.com/smilies/tongue.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Wink" alt=";)" id="vB_Editor_001_smilie_4" src="http://s.dpstatic.com/smilies/wink.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Big Grin" alt=":D" id="vB_Editor_001_smilie_3" src="http://s.dpstatic.com/smilies/biggrin.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Embarrassment" alt=":o" id="vB_Editor_001_smilie_2" src="http://s.dpstatic.com/smilies/redface.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Roll Eyes (Sarcastic)" alt=":rolleyes:" id="vB_Editor_001_smilie_7"
                                                src="http://s.dpstatic.com/smilies/rolleyes.png" style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="Cool" alt=":cool:" id="vB_Editor_001_smilie_6" src="http://s.dpstatic.com/smilies/cool.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="table">
                                        <div class="tablecell">
                                            <img border="" title="EEK!" alt=":eek:" id="vB_Editor_001_smilie_9" src="http://s.dpstatic.com/smilies/eek.png"
                                                style="cursor: pointer;">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <input type="hidden" value="0" id="vB_Editor_001_mode" name="wysiwyg">

                <script type="text/javascript">
&lt;!--
vB_Editor['vB_Editor_001'] = new vB_Text_Editor('vB_Editor_001', 0, '21', '1', undefined, '', 'forum');
//--&gt;
</script>

                <script type="text/javascript">
&lt;!--
function swap_posticon(imgid)
{
//
var out = fetch_object("display_posticon");
var img = fetch_object(imgid);
if (img)
{
out.src = img.src;
out.alt = img.alt;
}
else
{
out.src = "clear.gif";
out.alt = "";
}
}
// --&gt;
</script>

                <div class="blockrow posticons">
                    <label class="full">
                        Post Icons:</label>
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_1')" tabindex="1" id="rb_iconid_1"
                                        value="1" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_1">
                                        <img onclick="rb_iconid_1.click()" id="pi_1" alt="Post" src="http://i.dpstatic.com/icon/icon1.png"
                                            title="Post"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_13')" tabindex="1" id="rb_iconid_13"
                                        value="13" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_13">
                                        <img onclick="rb_iconid_13.click()" id="pi_13" alt="Thumbs down" src="http://i.dpstatic.com/icon/icon13.png"
                                            title="Thumbs down"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_12')" tabindex="1" id="rb_iconid_12"
                                        value="12" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_12">
                                        <img onclick="rb_iconid_12.click()" id="pi_12" alt="Wink" src="http://i.dpstatic.com/icon/icon12.png"
                                            title="Wink"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_11')" tabindex="1" id="rb_iconid_11"
                                        value="11" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_11">
                                        <img onclick="rb_iconid_11.click()" id="pi_11" alt="Red face" src="http://i.dpstatic.com/icon/icon11.png"
                                            title="Red face"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_10')" tabindex="1" id="rb_iconid_10"
                                        value="10" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_10">
                                        <img onclick="rb_iconid_10.click()" id="pi_10" alt="Talking" src="http://i.dpstatic.com/icon/icon10.png"
                                            title="Talking"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_9')" tabindex="1" id="rb_iconid_9"
                                        value="9" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_9">
                                        <img onclick="rb_iconid_9.click()" id="pi_9" alt="Unhappy" src="http://i.dpstatic.com/icon/icon9.png"
                                            title="Unhappy"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_8')" tabindex="1" id="rb_iconid_8"
                                        value="8" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_8">
                                        <img onclick="rb_iconid_8.click()" id="pi_8" alt="Angry" src="http://i.dpstatic.com/icon/icon8.png"
                                            title="Angry"></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_7')" tabindex="1" id="rb_iconid_7"
                                        value="7" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_7">
                                        <img onclick="rb_iconid_7.click()" id="pi_7" alt="Smile" src="http://i.dpstatic.com/icon/icon7.png"
                                            title="Smile"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_6')" tabindex="1" id="rb_iconid_6"
                                        value="6" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_6">
                                        <img onclick="rb_iconid_6.click()" id="pi_6" alt="Cool" src="http://i.dpstatic.com/icon/icon6.png"
                                            title="Cool"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_5')" tabindex="1" id="rb_iconid_5"
                                        value="5" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_5">
                                        <img onclick="rb_iconid_5.click()" id="pi_5" alt="Question" src="http://i.dpstatic.com/icon/icon5.png"
                                            title="Question"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_4')" tabindex="1" id="rb_iconid_4"
                                        value="4" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_4">
                                        <img onclick="rb_iconid_4.click()" id="pi_4" alt="Exclamation" src="http://i.dpstatic.com/icon/icon4.png"
                                            title="Exclamation"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_3')" tabindex="1" id="rb_iconid_3"
                                        value="3" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_3">
                                        <img onclick="rb_iconid_3.click()" id="pi_3" alt="Lightbulb" src="http://i.dpstatic.com/icon/icon3.png"
                                            title="Lightbulb"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_2')" tabindex="1" id="rb_iconid_2"
                                        value="2" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_2">
                                        <img onclick="rb_iconid_2.click()" id="pi_2" alt="Arrow" src="http://i.dpstatic.com/icon/icon2.png"
                                            title="Arrow"></label>
                                </td>
                                <td>
                                    <input type="radio" onclick="swap_posticon('pi_14')" tabindex="1" id="rb_iconid_14"
                                        value="14" name="iconid">
                                </td>
                                <td width="12%">
                                    <label for="rb_iconid_14">
                                        <img onclick="rb_iconid_14.click()" id="pi_14" alt="Thumbs up" src="http://i.dpstatic.com/icon/icon14.png"
                                            title="Thumbs up"></label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="14">
                                    <label for="rb_iconid_0">
                                        <input type="radio" checked="checked" onclick="swap_posticon(null)" tabindex="1"
                                            id="rb_iconid_0" value="0" name="iconid">&nbsp;No icon</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="singledescription">
                        You may choose an icon for your message from this list</p>
                </div>
                <div class="blockrow">
                    <label class="full" for="tagpopup_ctrl">
                        Tags:</label>
                    <div class="popupmenu nomouseover noclick nohovermenu" id="tagpopup">
                        <input type="text" tabindex="1" value="" id="tagpopup_ctrl" name="taglist" class="primary full textbox popupctrl"
                            autocomplete="off">
                        <div class="popupbody" id="tagpopup_body">
                        </div>
                    </div>

                    <script src="http://s.dpstatic.com/s/vbulletin_ajax_suggest.js?v=406" type="text/javascript"></script>

                    <script type="text/javascript">
&lt;!--
tag_add_comp = new vB_AJAX_TagSuggest('tag_add_comp', 'tagpopup_ctrl', 'tagpopup');
tag_add_comp.allow_multiple = true;
tag_add_comp.set_delimiters('');
//--&gt;
</script>

                    <p class="singledescription">
                        Separate tags using a comma. You may add 5 tag(s) to this thread.</p>
                </div>
            </div>
        </div>
        <div class="blockfoot actionbuttons">
            <div class="group">
                <input type="hidden" value="" name="s">
                <input type="hidden" value="1282594976-f160ce2d518fe65f14366bef75011416138b44d0"
                    name="securitytoken">
                <input type="hidden" value="21" name="f">
                <input type="hidden" value="postthread" name="do">
                <input type="hidden" value="cdf957bcb458be51a4998102c9978780" name="posthash">
                <input type="hidden" value="1282594976" name="poststarttime">
                <input type="hidden" value="451746" name="loggedinuser">
                <input type="submit" tabindex="1" accesskey="s" value="Submit New Thread" id="vB_Editor_001_save"
                    name="sbutton" class="button">
                <input type="submit" tabindex="1" accesskey="r" value="Preview Post" name="preview"
                    class="button">
            </div>
        </div>
        <h3 class="blockhead">
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

                <script src="http://s.dpstatic.com/s/vbulletin_attachment.js?v=406" type="text/javascript"></script>

                <script type="text/javascript">
&lt;!--
vB_Attachments = new vB_Attachment('attachlist', {
editorid     : '',
poststarttime: '1282594976',
posthash     : 'cdf957bcb458be51a4998102c9978780',
contentid    : '0',
userid       : '451746',
contenttypeid: '1',
insertinline : '1',
values       : 'values[f]=21',
enhanced     : '1'
});

//--&gt;
</script>

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
        </div>
        </div>
    </form>
</asp:Content>
