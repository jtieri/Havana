
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html" />
	<title>{{ site.siteName }}: Portable Client</title>

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
}

.text-column {
  float: left;
  margin-top:10px; 
  margin-bottom:10px; 
  margin-left:10px; 
  margin-right:10px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.collapsible-content {
  padding: 0 10px;
  width:90%;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}

.old-pc {
image-rendering:-moz-crisp-edges;          /* Firefox        */
image-rendering:-o-crisp-edges;            /* Opera          */
image-rendering:-webkit-optimize-contrast; /* Safari         */
image-rendering:optimize-contrast;         /* CSS3 Proposed  */
-ms-interpolation-mode:nearest-neighbor;   /* IE8+           */
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
			<li>
				<a href="{{ site.sitePath }}/help/install_shockwave">Shockwave Help</a></li>
			<li class="selected">
				Portable Client			</li>
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
					<h2 class="title">Portable Shockwave Client</h2>
					<div class="tutorial-text">	
						<div class="row">
							<div class="text-column" style="width: 120px">
								<img class="old-pc" src="https://i.imgur.com/XOTfbl8.png" alt="">
							</div>
							<div class="text-column" style="width: 260px">
								<p>As the years go by so do the browser plugins. Shockwave is a browser plugin that is deprecated in most modern browsers, due to this a portable program that runs Shockwave Habbo is avaliable.</p>
								<p>This is a Macromedia Projector program generated with Director MX 2004. Written in the same language that the Shockwave Habbo client is written in.</p>
							</div>
						</div>
						<p><b>How does it work?</b></p>
						<p>The program is a simple .exe that works as a light wrapper around the Shockwave client files.</p>
						<p>The app will work natively on Windows but will require Wine or Wineskin Winery to play on Linux/macOS.</p>
						<p>This method does not require any installs of Shockwave or an additional browser.</p>
						<p><b>Why should I use Shockwave?</b></p>
						<p>Early versions of Habbo Hotel were built with Macromedia Shockwave and so it is required to load the client.</p>
						<p>Perhaps one day we will have Ruffle-esque styled emulation for Shockwave but for now this is the best we have.</p>
						<p><b>Pictures</b></p>
						<p>Below are pictures of the program working in action.</p>
						<div class="article-body">
						<div id="article-wrapper">
						<div class="article-images clearfix">
						<a href="https://i.imgur.com/OrHYgxr.png" style="background-image: url(https://i.imgur.com/OrHYgxr.png); background-position: -0px -0px"></a>
						<a href="https://i.imgur.com/7yWmicl.png" style="background-image: url(https://i.imgur.com/7yWmicl.png); background-position: -0px -0px"></a>
						<a href="https://i.imgur.com/IXE91fD.png" style="background-image: url(https://i.imgur.com/IXE91fD.png); background-position: -0px -0px"></a></div>
						</div>
						</div>
						
						<script type="text/javascript" language="Javascript">
							document.observe("dom:loaded", function() {
								$$('.article-images a').each(function(a) {
									Event.observe(a, 'click', function(e) {
										Event.stop(e);
										Overlay.lightbox(a.href, "Image is loading");
									});
								});
								
								$$('a.article-5').each(function(a) {
									a.replace(a.innerHTML);
								});
							});
						</script>
					</div>
				</div>

			</div>
			<script type="text/javascript">if (!$(document.body).hasClassName('process-template')) { Rounder.init(); }</script>
			<div class="habblet-container ">		
				<div class="cbb clearfix ">
					<h2 class="title" style="background-color: lightblue">Changelog</h2>
					<div class="tutorial-text">	
						<div class="row">
							<div class="text-column">
								<img src="https://i.imgur.com/yDbopCD.png" alt="">
							</div>
							<div class="text-column" style="width: 365px;">
								<p>The desktop client was created in early 2023. Changes to the client over time can be found below.</p>
							</div>
						</div>
						<a class="new-button collapsible" id="warn-clear-hand-button" href="#"><b>Reveal Changelog</b><i></i></a>
						<div class="collapsible-content" style="margin-top: 25px">
						<p><b>v0.1.0 - March 2023</b></p>
						<p>- Initial release.</p>
						</div>
						<!-- <p>The features that Shockwave contains which are not present in the Flash version are listed below.</p>
						<div class="row">
							<div class="column" style="margin-top:10px; margin-bottom:10px; margin-right:10px">
								<img src="{{ site.staticContentPath }}/c_images/stickers/sticker_submarine.gif" alt="">
							</div>
							<div class="column" style="margin-top:10px; margin-bottom:10px; margin-left:10px; width: 275px;">
								<p><b>BattleBall, Diving, Wobble Squabble, Trax Machines, Jukeboxes, American Idol, Tic Tac Toe, Chess, Battleships, Poker</b> and some nostalgic Habbo components such as the hand and the Room-o-Matic.</p>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
		<div id="column2" class="column" style="width: 305px">	     		
			<div class="habblet-container ">		
				<div class="cbb clearfix">
					<h2 class="title" style="background-color: gray">Downloads</h2>
					<div class="tutorial-text">							</h2>
						<p style="margin-top:10px; margin-right:10px">At this time there is just one version of the portable client which can be used across Windows, Linux, & macOS.</p>
						<p><b>Portable Desktop Client:</b></p>
						<p>The download includes the Habbo Shockwave client files, furni & sound files, and the necessary Director Xtras required to function.</p>
						<p> - <a href="https://inf-o-matic.com/downloads/habbo-client-v0.1.0.zip"">Click here</a> to download (~170 MB)</p>
						<p><b>Basilisk Portable Browser:</b></p>
						<p>For those who possibly don't want to use the desktop client but also don't want to install Shockwave.</p>
						<p> - <a href="https://inf-o-matic.com/downloads/Basilisk-Portable.zip">Click here</a> to download (~220 MB)</p>
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
	
	var coll = document.getElementsByClassName("collapsible");
	var i;

	for (i = 0; i < coll.length; i++) {
		coll[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var content = this.nextElementSibling;
			if (content.style.maxHeight){
				content.style.maxHeight = null;
			} else {
				content.style.maxHeight = content.scrollHeight + "px";
			} 
		});
	}

</script>


</body>
</html>