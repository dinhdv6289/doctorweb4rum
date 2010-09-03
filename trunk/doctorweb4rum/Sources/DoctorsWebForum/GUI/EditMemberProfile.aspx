<%@ Page Language="C#" MasterPageFile="~/GUI/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditMemberProfile.aspx.cs" Inherits="GUI_EditMemberProfile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="breadcrumb" class="breadcrumb">
        <ul class="floatcontainer">
            <li class="navbithome"><a href="" accesskey="1">
                <img src="http://m.dpstatic.com/misc/navbit-home.png" alt="Home" /></a></li>
            <li class="navbit"><a href="usercp.php">Settings</a></li>
            <li class="navbit lastnavbit"><span>Edit Profile</span></li>
        </ul>
        <hr />
    </div>
    <div id="usercp_content">
        <div class="cp_content">
            <form action="profile.php?do=updateprofile" method="post" id="profileform" class="block">
                <h2 class="blockhead">
                    Edit Profile letcomvn</h2>
                <div class="blockbody formcontrols settings_form_border">
                    <h3 class="blocksubhead">
                        Registration Required Information - All fields are required.</h3>
                    <div class="section">
                        <div class="blockrow singlebutton">
                            <label>
                                Email &amp; Password:</label>
                            <div class="rightcol">
                                <!-- DO NOT REMOVE -->
                                <input type="image" style="width: 1px; height: 1px;" src="clear.gif" />
                                <!-- / DO NOT REMOVE -->
                                <input type="submit" class="button" tabindex="1" value="Edit Email &amp; Password"
                                    name="gotopassword" />
                            </div>
                            <p class="description">
                                Please click this button to edit your email address and password. Any changes you've
                                made on this page will not be saved.
                            </p>
                        </div>
                    </div>
                    <h3 class="blocksubhead">
                        Authentication Hash</h3>
                    <div class="blockrow">
                        <label for="cfield_hash">
                            Hash</label>
                        <input type="text" class="primary textbox" name="userfield[field3]" readonly="true"
                            id="cfield_hash" value="567e8e7cff27744dfa026288d4f48d78" maxlength="100" />
                        <p class="description">
                            This can be used by external applications to authenticate your account. One example
                            is you can run a small application on your computer to log to your profile what
                            you are listening to. You can find more info about it <a href="/faq.php?faq=dp_faq#faq_music_reporter">
                                over here</a>.</p>
                    </div>
                    <h3 class="blocksubhead">
                        Optional Information - All information will be viewable by other forum members.</h3>
                    <div class="section">

                        <script type="text/javascript">
<!--
function clear_birthday()
{
fetch_object('bd_month').selectedIndex = 0;
fetch_object('bd_day').selectedIndex = 0;
fetch_object('bd_year').value = '';
}
//-->
                        </script>

                        <div class="blockrow">
                            <label for="bd_month">
                                Date of Birth:</label>
                            <div class="rightcol">
                                <ul class="multifield group floatcontainer">
                                    <li>
                                        <label for="bd_month">
                                            Month</label>
                                        <select name="month" id="bd_month" tabindex="1">
                                            <option value="-1" selected="selected"></option>
                                            <option value="01">January</option>
                                            <option value="02">February</option>
                                            <option value="03">March</option>
                                            <option value="04">April</option>
                                            <option value="05">May</option>
                                            <option value="06">June</option>
                                            <option value="07">July</option>
                                            <option value="08">August</option>
                                            <option value="09">September</option>
                                            <option value="10">October</option>
                                            <option value="11">November</option>
                                            <option value="12">December</option>
                                        </select>
                                    </li>
                                    <li>
                                        <label for="bd_day">
                                            Day</label>
                                        <select name="day" id="bd_day" tabindex="1">
                                            <option value="-1" selected="selected"></option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">27</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                            <option value="31">31</option>
                                        </select>
                                    </li>
                                    <li>
                                        <label for="bd_year">
                                            Year (Optional)</label>
                                        <input type="text" class="textbox numeric" name="year" value="" size="4" maxlength="4"
                                            id="bd_year" tabindex="1" />
                                    </li>
                                </ul>
                                <input type="hidden" name="oldbirthday" value="" />
                            </div>
                            <p class="description">
                                Your date of birth and age are displayed in several places on the forum. Only the
                                administrator will have access to your date of birth should you choose to hide it
                                via the privacy option below.</p>
                            <label for="showbirthday">
                                Privacy:</label>
                            <select name="showbirthday" class="primary" id="showbirthday" tabindex="1">
                                <option value="0" selected="selected">Hide Age and Date of Birth</option>
                                <option value="1">Display Only Age</option>
                                <option value="3">Display Only Day and Month of Birth</option>
                                <option value="2">Display Age and Full Date of Birth</option>
                            </select>
                        </div>
                        <div class="blockrow">
                            <label for="tb_homepage">
                                Home Page URL:</label>
                            <input type="text" class="primary textbox" name="homepage" id="tb_homepage" value=""
                                maxlength="200" dir="ltr" tabindex="1" />
                            <p class="description">
                                If you would like to let other visitors to this site know the URL of your own web
                                site, enter it here.
                            </p>
                        </div>
                        <fieldset class="blockrow">
                            <legend>Instant Messaging</legend>
                            <ul class="group">
                                <li>
                                    <label for="icq">
                                        ICQ Number:</label>
                                    <input type="text" class="primary textbox" id="icq" name="icq" value="" maxlength="30"
                                        dir="ltr" tabindex="1" />
                                </li>
                                <li>
                                    <label for="aim">
                                        AIM Screen Name:</label>
                                    <input type="text" class="primary textbox" id="aim" name="aim" value="" maxlength="30"
                                        dir="ltr" tabindex="1" />
                                </li>
                                <li>
                                    <label for="msn">
                                        MSN Messenger Handle:</label>
                                    <input type="text" class="primary textbox" id="msn" name="msn" value="" maxlength="50"
                                        dir="ltr" tabindex="1" />
                                </li>
                                <li>
                                    <label for="yahoo">
                                        Yahoo! Messenger Handle:</label>
                                    <input type="text" class="primary textbox" id="yahoo" name="yahoo" value="" maxlength="30"
                                        dir="ltr" tabindex="1" />
                                </li>
                                <li>
                                    <label for="skype">
                                        Skype Name:</label>
                                    <input type="text" class="primary textbox" id="skype" name="skype" value="" maxlength="32"
                                        dir="ltr" tabindex="1" />
                                </li>
                            </ul>
                            <p class="description">
                                You may enter your registered identity for the instant messaging networks if you
                                would like other visitors to be able to contact you using that medium.
                            </p>
                        </fieldset>
                    </div>
                    <!-- start if customfields -->
                    <h3 class="blocksubhead">
                        Additional Information</h3>
                    <div class="section">
                        <div class="blockrow">
                            <label>
                                Biography:</label>
                            <div class="rightcol">
                                <input type="text" class="primary textbox" name="userfield[field1]" id="cfield_1"
                                    value="" maxlength="100" tabindex="1" />
                                <p class="description">
                                    A few details about yourself</p>
                                <input type="hidden" name="userfield[field1_set]" value="1" />
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Location:</label>
                            <div class="rightcol">
                                <input type="text" class="primary textbox" name="userfield[field2]" id="cfield_2"
                                    value="" maxlength="40" tabindex="1" />
                                <p class="description">
                                    Where you live</p>
                                <input type="hidden" name="userfield[field2_set]" value="1" />
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Interests:</label>
                            <div class="rightcol">
                                <input type="text" class="primary textbox" name="userfield[field3]" id="cfield_3"
                                    value="" maxlength="100" tabindex="1" />
                                <p class="description">
                                    Your hobbies, etc</p>
                                <input type="hidden" name="userfield[field3_set]" value="1" />
                            </div>
                        </div>
                        <div class="blockrow">
                            <label>
                                Occupation:</label>
                            <div class="rightcol">
                                <input type="text" class="primary textbox" name="userfield[field4]" id="cfield_4"
                                    value="" maxlength="100" tabindex="1" />
                                <p class="description">
                                    Your job</p>
                                <input type="hidden" name="userfield[field4_set]" value="1" />
                            </div>
                        </div>
                    </div>
                    <!-- end if custom fields -->
                </div>
                <div class="blockfoot actionbuttons settings_form_border">
                    <div class="group">
                        <input type="submit" class="button" value="Save Changes" tabindex="1" accesskey="s" />
                        <input type="reset" class="button" value="Reset Fields" tabindex="1" accesskey="r" />
                        <input type="hidden" name="s" value="" />
                        <input type="hidden" name="securitytoken" value="1283535642-6b7944220583efc465f94e1daf582879f5e9f7d1" />
                        <input type="hidden" name="do" value="updateprofile" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="usercp_nav">
        <div class="block">
            <h2 class="blockhead">
                My Settings</h2>
            <div class="blockbody">
                <ul>
                    <li>
                        <h3 class="blocksubhead profile">
                            <img class="usercpimage" src="http://i.dpstatic.com/site_icons/profile.png" alt="My Profile"
                                border="0" />
                            My Profile</h3>
                        <ul class="blockrow">
                            <li class="active"><a href="profile.php?do=editprofile">Edit Profile</a></li>
                            <li class="inactive"><a href="profile.php?do=editprofilepic">Edit Profile Picture</a></li>
                            <li class="inactive"><a href="profile.php?do=editavatar">Edit Avatar</a></li>
                            <li class="inactive"><a href="faq.php?faq=signatures#faq_signature_broken">Edit Signature</a></li>
                            <li class="inactive"><a href="profile.php?do=privacy">Profile Privacy</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="blocksubhead">
                            <img class="usercpimage" src="http://i.dpstatic.com/site_icons/account.png" alt="My Account"
                                border="0" />
                            My Account</h3>
                        <ul class="blockrow">
                            <li class="inactive"><a href="profile.php?do=editpassword">Edit Email &amp; Password</a></li>
                            <li class="inactive"><a href="profile.php?do=editoptions">General Settings</a></li>
                            <li class="inactive"><a href="profile.php?do=editconnections">Edit Connections</a></li>
                            <li class="inactive"><a href="profile.php?do=ignorelist">Edit Ignore List</a></li>
                            <li class="inactive"><a href="payments.php">Paid Subscriptions</a></li>
                            <li class="inactive"><a href="badge.php">Profile Badge</a></li>
                            <li class="inactive"><a href="profile.php?do=editdirectory">Directory Listing</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="blocksubhead">
                            <img class="usercpimage" src="http://i.dpstatic.com/site_icons/network.png" alt="Networking"
                                border="0" />
                            Networking</h3>
                        <ul class="blockrow">
                            <li class="inactive"><a href="profile.php?do=buddylist">Friends &amp; Contacts</a></li>
                            <li class="inactive"><a href="calendar.php?do=viewreminder">Event Reminders</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="blocksubhead">
                            <img class="usercpimage" src="http://i.dpstatic.com/site_icons/cart.png" alt="Marketplace"
                                border="0" />
                            Marketplace</h3>
                        <ul class="blockrow">
                            <li class=""><a href="marketplace.php?do=settings">Settings</a></li>
                            <li class=""><a href="marketplace.php?do=won">Items Won</a></li>
                            <li class=""><a href="marketplace.php?do=payments">Payment History</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="blocksubhead">
                            <img class="usercpimage" src="http://i.dpstatic.com/site_icons/forum.png" alt="Forums"
                                border="0" />
                            Miscellaneous</h3>
                        <ul class="blockrow">
                            <li class="inactive"><a href="profile.php?do=editattachments">Attachments</a></li>
                        </ul>
                    </li>
                    <li>
                        <h4 class="blocksubhead">
                            <img class="usercpimage" src="http://i.dpstatic.com/cms/widget-blog.png" alt="Blog"
                                border="0" />
                            <a href="http://blogs.digitalpoint.com/blog_usercp.php" class="usercp_blog">Blog</a></h4>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
