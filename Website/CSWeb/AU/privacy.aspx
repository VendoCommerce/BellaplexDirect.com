<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.AU.Store.privacy" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<%@ Register Src="UserControls/BillingForm.ascx" TagName="BillingFormControl" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head id="Head1" runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Keranique</title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script type="text/javascript" src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-1.3.4.css" media="screen" />


    <script type="text/javascript">
        $(document).ready(function () {
            $("a.popup").fancybox({
                'width': 600,
                'height': 400,
                'margin': 20,
                'padding': 20,
                'overlayColor': '#333',
                'autoScale': false,
                'centerOnScroll': true,
                'transitionIn': 'none',
                'transitionOut': 'none',
                'type': 'iframe'
            });
        });
        function show_slide(slide_number) {
            if (slide_number == 1) {
                $("#slider_1").show();
                $("#slider_2").hide();
                $("#slider_3").hide();
            }

            if (slide_number == 2) {
                $("#slider_1").hide();
                $("#slider_2").show();
                $("#slider_3").hide();
            }

            if (slide_number == 3) {
                $("#slider_1").hide();
                $("#slider_2").hide();
                $("#slider_3").show();
            }
        }
	</script>

<link media="all" rel="stylesheet" href="Styles/cloudglobal_b2.css" type="text/css" />

 <script type='text/javascript' src='js/jwplayer.js'></script>
 
 <style>
	#part1 {
		background-image:url(Content/Images/part1.jpg);
	}
	div.slider{
		background: url("Content/Images/slider_bg.jpg") repeat-y scroll -45px top transparent;
    padding-bottom: 11px;
	}
	
	div#slider_2{
		display:none;
	}
	
	div#slider_3{
		display:none;
	}
	</style>
<script language="javascript">
<!--    begin

    var exit = true;
    function exitwindow() {
        var exit = false;
        var url = 'dontgo.html';
        var win = 'toolbar=0,directories=0,menubar=0,scrollbars=0,resizable=0,width=800,height=277';
        if (exit)
            open(url, 'WindowName', win);
    }

// end -->

</script>

</head>

  <body>
  <div id="container">
    <div id="part1">
      <div id="arrow"><img src="https://dd991rkqr6iba.cloudfront.net/Images/arrow.png" width="713" height="132" /></div>
      
        <uc:Header ID="Header1" runat="server" /> 


        <form id="form1" runat="server">
            <uc:BillingFormControl ID="ucForm" runat="server" RedirectUrl="Store/AddProduct.aspx" />


            <uc:TrackingPixels runat="server" />

        </form>


      
      <div class="video"> 
        <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -->

        <div id="mediaspace">This text will be replaced</div>
<script type="text/javascript">
    jwplayer('mediaspace').setup({
        'flashplayer': 'js/player.swf',
        'autostart': 'true',
        'file': 'jwplayer/keranique.mp4',
        'controlbar': 'bottom',
        'width': '350',
        'height': '198'
    });
</script>
        <!-- END OF THE PLAYER EMBEDDING --> 
      </div>
      <div class="doctor"> Approximately 50% of women experience some kind of hair loss by age 50. A woman’s hair loss can be triggered by a multitude of conditions and circumstances, but the Keranique™ System containing a product with 2% Minoxidil Solution was specifically formulated to address this!  Keranique™ hair products were specifically formulated to addess the embarrassing discovery of thinning hair for women of all ages and hair types. </div>
      <div class="name1 red">- Brenda W.</div>
        <div class="slider">
       <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="969" height="468" id="preloader" align="middle">
          <param name="movie" value="preloader.swf" />
          <param name="quality" value="high" />
          <param name="bgcolor" value="#ffffff" />
          <param name="play" value="true" />
          <param name="loop" value="true" />
          <param name="scale" value="showall" />
          <param name="menu" value="true" />
          <param name="devicefont" value="false" />
          <param name="salign" value="" />
          <param name="allowScriptAccess" value="sameDomain" />
          <param name="wmode" value="transparent" /> 
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="preloader.swf" width="969" height="468">
            <param name="movie" value="preloader.swf" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <param name="play" value="true" />
            <param name="loop" value="true" />
            <param name="scale" value="showall" />
            <param name="menu" value="true" />
            <param name="devicefont" value="false" />
            <param name="salign" value="" />
            <param name="allowScriptAccess" value="sameDomain" />
            <param name="wmode" value="transparent" />
            <!--<![endif]--> 
            <div id="slider_1"> 
              <img src="images/slider_image_1.jpg" border="0" usemap="#Map"  />
              <map name="Map" id="Map">
                <area shape="rect" coords="373,325,598,433" href="javascript:show_slide(2);" />
                <area shape="rect" coords="598,327,834,435" href="javascript:show_slide(3);" />
              </map>
            </div>
            <div id="slider_2"> 
              <img src="images/slider_image_2.jpg" border="0" usemap="#Map2"  />
              <map name="Map2" id="Map2">
                <area shape="rect" coords="147,325,375,433" href="javascript:show_slide(1);" />
                <area shape="rect" coords="601,327,837,435" href="javascript:show_slide(3);" />
              </map>
            </div>
            <div id="slider_3"> 
              <img src="images/slider_image_3.jpg" border="0" usemap="#Map3"  />
              <map name="Map3" id="Ma3p">
                <area shape="rect" coords="143,325,371,433" href="javascript:show_slide(1);" />
                <area shape="rect" coords="370,327,606,435" href="javascript:show_slide(2);" />
              </map>
            </div>
            <!--[if !IE]>-->
          </object>
          <!--<![endif]-->
        </object>
      </div>
    </div>
    <div id="part2">
      <div class="quote1 grey"> “I began using Keranique conditioner, shampoo, follicle booster, and minoxidil starting in August '2010 because my hair was falling out and had stopped growing (I am 52 yrs. young.) My only hope was that my hair loss would stop. Well, not only did my hair stop falling out but it began to grow like a weed. I love the fact that it contains no sulfates and doesn't strip my hair color. Keranique delivers - and then some. An absolutely amazing product.” </div>
      <div class="name2 red">- Nora N.</div>
      <div class="spacer"><img src="https://dd991rkqr6iba.cloudfront.net/Images/spacer.png" width="410" height="20" /></div>
      <div class="quote3 grey"> “I am presently using the shampoo, conditioner, follicle-boosting serum, and the fortifying mousse. I have only used it 3 times and already feel that my hair has more volume. I am anxious to see what results a full month of treatment brings.” </div>
      <div class="name3 red">- Brenda W.</div>
      <div class="quote2 grey"> “I am using the Keranique shampoo and conditioner. Within two weeks I can tell a difference. I would recommend these products.” </div>
      <div class="name4 red">- Barbara P.</div>
      <div class="spacer2"><img src="https://dd991rkqr6iba.cloudfront.net/Images/spacer.png" width="410" height="20" /></div>
      <div class="quote4 grey"> “I was having trouble with thinning hair, so I tried Keranique hair growth kit and I have been using it for two months. My hair looks so much healthier and I'm not having the breakage problems I was having before. Also it’s not falling out like it was. So far I’m very happy with the results.” </div>
      <div class="name5 red">- Deborah M.</div>
      <div class="btn-bottom"><a href="#container" class="scroll"></a></div>
            <div id="footer"> 
      <p style="float:left">
<a style="margin-left: 0" href="/index.aspx">Home</a>
|
<a href="/faq.aspx">FAQs</a>
|
<a href="/testimonials.aspx">Testimonials</a>
|
<a href="/contact.aspx">Contact Us</a>
|
<a href="/privacy.aspx">Privacy Policy</a>
|
<a href="/return.aspx">Return Policy</a>
</p>
      
        © 2012 All Rights Reserved. </div>
    </div>
 