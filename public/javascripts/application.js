// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function load_video(){
  var flashvars = {};
		flashvars.xml = "config.xml";
		flashvars.font = "font.swf";		
		var attributes = {};
		attributes.wmode = "transparent";
		attributes.bgcolor = "#c72e42";
		attributes.id = "slider";
		swfobject.embedSWF("cu3er.swf", "cuber", "961", "359", "9", "expressInstall.swf", flashvars, attributes);
  
}

function load_image_gallery(){
  new SlideShow('listOfImages', {
     crossFade: true, 
     pauseOnMouseover: true,
     slideDuration: 8,
     transitionDuration: 1,
  });
}	
		
function test_jquery(){
  $("cuber").hide();
 

}

function mycarousel_initCallback(carousel)
{
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};


$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

});