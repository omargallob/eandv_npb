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