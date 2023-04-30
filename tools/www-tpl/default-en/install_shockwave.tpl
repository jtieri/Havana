
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html" />
	<title>{{ site.siteName }}: Shockwave Help</title>

<script type="text/javascript">
var andSoItBegins = (new Date()).getTime();
</script>
    <link rel="shortcut icon" href="{{ site.staticContentPath }}/web-gallery/v2/favicon.ico" type="image/vnd.microsoft.icon" />
    <link rel="alternate" type="application/rss+xml" title="{{ site.siteName }}: RSS" href="{{ site.sitePath }}/articles/rss.xml" />
<script src="{{ site.staticContentPath }}/web-gallery/static/js/libs2.js" type="text/javascript"></script>
<script src="{{ site.staticContentPath }}/web-gallery/static/js/visual.js" type="text/javascript"></script>
<script src="{{ site.staticContentPath }}/web-gallery/static/js/libs.js" type="text/javascript"></script>
<script src="{{ site.staticContentPath }}/web-gallery/static/js/common.js" type="text/javascript"></script>
<script src="{{ site.staticContentPath }}/web-gallery/static/js/fullcontent.js" type="text/javascript"></script>
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/style.css" type="text/css" />
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/buttons.css" type="text/css" />
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/boxes.css" type="text/css" />
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/tooltips.css" type="text/css" />
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/styles/local/com.css" type="text/css" />

<script src="{{ site.staticContentPath }}/web-gallery/js/local/com.js" type="text/javascript"></script>

<script type="text/javascript">
document.habboLoggedIn = {{ session.loggedIn }};
var habboName = "{{ session.loggedIn ? playerDetails.getName() : "" }}";
var ad_keywords = "";
var habboReqPath = "{{ site.sitePath }}";
var habboStaticFilePath = "{{ site.staticContentPath }}/web-gallery";
var habboImagerUrl = "{{ site.staticContentPath }}/habbo-imaging/";
var habboPartner = "";
window.name = "habboMain";
if (typeof HabboClient != "undefined") { HabboClient.windowName = "client"; }

</script>

<style>
.tutorial-text {
  margin-left: 10px;
  margin-right: 10px;
}
/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 137px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>


<meta name="description" content="Join the world's largest virtual hangout where you can meet and make friends. Design your own rooms, collect cool furniture, throw parties and so much more! Create your FREE {{ site.siteName }} today!" />
<meta name="keywords" content="{{ site.siteName }}, virtual, world, join, groups, forums, play, games, online, friends, teens, collecting, social network, create, collect, connect, furniture, virtual, goods, sharing, badges, social, networking, hangout, safe, music, celebrity, celebrity visits, cele" />

<!--[if IE 8]>
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/ie8.css" type="text/css" />
<![endif]-->
<!--[if lt IE 8]>
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/ie.css" type="text/css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" href="{{ site.staticContentPath }}/web-gallery/v2/styles/ie6.css" type="text/css" />
<script src="{{ site.staticContentPath }}/web-gallery/static/js/pngfix.js" type="text/javascript"></script>
<script type="text/javascript">
try { document.execCommand('BackgroundImageCache', false, true); } catch(e) {}
</script>

<style type="text/css">
body { behavior: url({{ site.staticContentPath }}/web-gallery/js/csshover.htc); }
</style>
<![endif]-->
<meta name="build" content="HavanaWeb" />
</head>

{% if session.loggedIn == false %}
<body id="home" class="anonymous ">
{% else %}
<body id="home" class=" ">
{% endif %}

{% include "base/header.tpl" %}

<div id="content-container">
	<div id="navi2-container" class="pngbg">
    <div id="navi2" class="pngbg clearfix">
		<ul>
			<li class="selected">
				Shockwave Help</li>
			<li>
				<a href="{{ site.sitePath }}/help/shockwave_app">Portable Client</a></li>
			<li class=" last">
				<a href="{{ site.sitePath }}/help/1">FAQ</a>
			</li>
		</ul>
    </div>
</div>

<div id="container">
	<div id="content" style="position: relative" class="clearfix">
		<div id="column1" class="column" style="width: 50%">
			<div class="habblet-container ">		
				<div class="cbb clearfix blue ">
					<h2 class="title">How to use Shockwave</h2>
					<div class="tutorial-text">	
						<p style="margin-top: 10px">In order to load the Shockwave hotel, you must follow these steps and ensure you have the prequisities required.</p>
						<p><b>Pale Moon</b></p>
						<p>Pale Moon is a necessity to run Shockwave correctly, as it's one of the few browsers that still supports NPAPI plugins correctly.</p>
						<p>Since Shockwave is quite old, the <b>32-bit</b> version of Pale Moon is required, here you can download the <a href="https://www.palemoon.org/download.shtml#Portable_versions">Portable</a> or the <a href="https://www.palemoon.org/download.shtml">Full</a> version.</p>
						<p><b>Shockwave 12</b></p>
						<p>You must install the Shockwave 12 MSI first and then proceed to install the Visual Studio 2008 C++ x86 redist.</p>
						<p><i>Download list</i></p>
						<p>Adobe Shockwave 12.3 MSI: <a href="https://inf-o-matic.com/downloads/Shockwave_Installer_Full_12.3.0.000.msi" target="_blank">Download</a></p>
						<p>Microsoft Visual C++ 2008 Redistributable Package (x86): <a href="https://www.microsoft.com/en-us/download/details.aspx?id=26368" target="_blank">Download</a></p>
						<p>Also please make sure you <b>do not have a browser open</b> when installing the Shockwave MSI, as you will need to start a fresh Windows installation, since the current installation breaks with a browser open.</p>
						<p><b>Shockwave 11</b></p>
						<p>While Shockwave 11.6 is older than the latest version that is Shockwave 12, the latest version experiences issues with crashing while playing music from the Trax Machine or Jukebox, and also messsages in the instant messenger are always stuck at 12:00.</p>
						<p>For these reasons, Shockwave 11 is recommended to install instead since these issues are not present in this version.</p>
						<p>You can download the official Shockwave 11.6 installer MSI <a href="https://inf-o-matic.com/downloads/Shockwave_Installer_Full_11.6.0.000.msi">here</a>.</p>
						
						<!-- <p><b>Shockwave 12</b></p>
						<p>If the Shockwave 11 steps do not work, there is another option to install Shockwave 12, but this version brings issues that Shockwave 11 does not have.</p>
						<p>You can download the official Shockwave 12 Full installer <a href="https://www.palemoon.org/download.shtml">here</a>.</p>
						<p>Please download the <a href="">Xtras</a> and extract these folders into <i>C:/Windows</i>, these will apply the Shockwave files that would otherwise be automatically downloaded.</p>
						<p></p> -->
					</div>
				</div>

			</div>
			<script type="text/javascript">if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			<div class="habblet-container ">		
				<div class="cbb clearfix red ">
					<h2 class="title">What is the best method to play?</h2>
					<div class="tutorial-text">
						<p style="margin-top: 10px">It is <b>highly</b> recommended to use the Basilisk portable browser or Pale Moon 32-bit with Shockwave 11.6.</p>
						<p>The Basilisk browser requires no downloads and comes with Shockwave & Flash already configured which is why it's the preferred method.</p>
						<p>Read more about the Basilisk portable browser <a href="https://forum.ragezone.com/f353/portable-browser-with-flash-shockwave-1192727/">here</a>.</p>
						<p>If you prefer to use a desktop client then check out the portable client we have built.</p>
						<div class="row">
							<div class="column" style="margin-top:10px; margin-bottom:10px; margin-right:10px">
								<img src="{{ site.staticContentPath }}/c_images/stickers/sticker_submarine.gif" alt="">
							</div>
							<div class="column" style="margin-top:10px; margin-bottom:10px; margin-left:10px; width: 275px;">
								<p><b>Both Basilisk and the portable desktop client have been tested on Linux/macOS with Wine, if you're having trouble connecting to the hotel please visit us in Discord.</b></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="column2" class="column" style="width: 305px">	     		
			<div class="habblet-container ">		
				<div class="cbb clearfix">
					<h2 class="title" style="background-color: darkorange">Prerequisities</h2>
					<div class="tutorial-text">							</h2>
						<div class="row">
							<div class="column" style="width: 100px; margin-top:10px; margin-bottom:10px; margin-right:10px">
								<img class="credits-image" src="https://i.imgur.com/6zrNiqZ.gif" alt="" width="100" height="100">
							</div>
							<div class="column" style="width: 165px;">
								<p style="margin-top: 10px">The items listed below are required to use Shockwave.</p>
								<p>If you fail to meet these requirements you will not be able to play.</p>
							</div>
						</div>
						<p><b>Requirements</b></p> 
						<p> - Microsoft Windows; or WINE for Linux and macOS</p>
						<p> - Shockwave (at least 11.6 or higher)</p>
						<p> - Pale Moon 32-bit</p>
						<p>   or one of the following</p>
						<p> - Basilisk Portable Browser. (Download <a href="https://inf-o-matic.com/downloads/Basilisk-Portable.zip">here</a>)</p>
						<p> - Habbo Desktop Client. (Download <a href="https://inf-o-matic.com/downloads/habbo-client-v0.1.0.zip">here</a>)</p>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
		HabboView.run();

		</script>
		<div id="column3" class="column">
						<div class="habblet-container ">
								<div class="ad-container">
								{% include "base/ads_container.tpl" %}
								</div>
						</div>
						<script type="text/javascript">if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
		</div>
		<!--[if lt IE 7]>
		<script type="text/javascript">
		Pngfix.doPngImageFix();
		</script>
		<![endif]-->
	</div>
</div>
{% include "base/footer.tpl" %}

<script type="text/javascript">
	HabboView.run();
</script>


</body>
</html>