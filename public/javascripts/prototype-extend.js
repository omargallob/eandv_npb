Array.prototype.remove = function(from, to) {
  var rest = this.slice((to || from) + 1 || this.length);
  this.length = from < 0 ? this.length + from : from;
  return this.push.apply(this, rest);
};


Object.extend(document.viewport, {
  // Alias this method for consistency
  getScrollOffset: document.viewport.getScrollOffsets,

  setScrollOffset: function(offset) {
    Element.setScrollOffset(Prototype.Browser.WebKit ? document.body : document.documentElement, offset);
  },

  getScrollDimensions: function() {
    return Element.getScrollDimensions(Prototype.Browser.WebKit ? document.body : document.documentElement);
  }
});
/**
 * Namespace: Element Extensions
 * 
 * Element is a global object provided by the prototype.js library.  The
 * functions documented here are extensions to the Element object provided
 * by Jx to make cross-browser compatibility easier to achieve.
 */
Object.extend( Element, {
    /**
     * Function: getBoxSizing
     *
     * return the box sizing of an element, one of 'content-box' or 
     *'border-box'.
     *
     * Parameter: {Object} elem
     *
     * the element to get the box sizing of.
     *
     * Return: {String} the box sizing of the element.
     */
    getBoxSizing : function(elem) {
      var result = 'content-box';
      elem = $(elem);
      if (elem.currentStyle || window.opera) { 
          var cm = document["compatMode"];
          if (cm == "BackCompat" || cm == "QuirksMode") { 
              result = 'border-box'; 
          } else {
              result = 'content-box'; 
        }
      } else {
          if (arguments.length == 0) {
              node = document.documentElement; 
          }
          var sizing = Element.getStyle(elem, "-moz-box-sizing");
          if (!sizing) { 
              sizing = Element.getStyle(elem, "box-sizing"); 
          }
          result = (sizing ? sizing : 'content-box');
      }
      return result;
    },
    /**
     * Function: getContentBoxSize
     *
     * return the size of the content area of an element.  This is the size of
     * the element less margins, padding, and borders.
     *
     * Parameter: {Object} elem
     *
     * the element to get the content size of.
     *
     * Return: {Object} an object with two properties, width and height, that
     * are the size of the content area of the measured element.
     */
    getContentBoxSize : function(elem) {
      elem = $(elem);
      Element.toggleMeasurable(elem);
      var w = elem.offsetWidth;
      var h = elem.offsetHeight;
      var padding = Element.getPaddingSize(elem);
      var border = Element.getBorderSize(elem);
      Element.toggleMeasurable(elem);
      w = w - padding.left - padding.right - border.left - border.right;
      h = h - padding.bottom - padding.top - border.bottom - border.top;
      return {width: w, height: h};
    },
    /**
     * Function: getBorderBoxSize
     *
     * return the size of the border area of an element.  This is the size of
     * the element less margins.
     *
     * Parameter: {Object} elem
     *
     * the element to get the border sizing of.
     *
     * Return: {Object} an object with two properties, width and height, that
     * are the size of the border area of the measured element.
     */
    getBorderBoxSize: function(elem) {
      elem = $(elem);
      Element.toggleMeasurable(elem);
      var w = elem.offsetWidth;
      var h = elem.offsetHeight;
      Element.toggleMeasurable(elem);
      return {width: w, height: h}; 
    },
    /**
     * Function: setContentBoxSize
     *
     * set either or both of the width and height of an element to
     * the provided size.  This function ensures that the content
     * area of the element is the requested size and the resulting
     * size of the element may be larger depending on padding and
     * borders.
     *
     * Parameter: {Object} elem
     *
     * the element to set the content area of.
     *
     * Parameter: {Object} size
     *
     * an object with a width and/or height property that is the size to set
     * the content area of the element to.
     */
    setContentBoxSize : function(elem, size) {
        elem = $(elem);
        if (Element.getBoxSizing(elem) == 'border-box') {
            var padding = Element.getPaddingSize(elem);
            var border = Element.getBorderSize(elem);
            if (typeof size.width != 'undefined') {
                var width = (size.width + padding.left + padding.right + border.left + border.right);
                if (width < 0) {
                    width = 0;
                }
                elem.style.width = width + 'px';
            }
            if (typeof size.height != 'undefined') {
                var height = (size.height + padding.top + padding.bottom + border.top + border.bottom);
                if (height < 0) {
                    height = 0;
                }
                elem.style.height = height + 'px';
            }
        } else {
            if (typeof size.width != 'undefined') {
                elem.style.width = size.width + 'px';
            }
            if (typeof size.height != 'undefined') {
                elem.style.height = size.height + 'px';
            }
        }
    },
    /**
     * Function: setBorderBoxSize
     *
     * set either or both of the width and height of an element to
     * the provided size.  This function ensures that the border
     * size of the element is the requested size and the resulting
     * content areaof the element may be larger depending on padding and
     * borders.
     *
     * Parameter: {Object} elem
     *
     * the element to set the border size of.
     *
     * Parameter: {Object} size
     *
     * an object with a width and/or height property that is the size to set
     * the content area of the element to.
     */
    setBorderBoxSize : function(elem, size) {
		//console.log(arguments);
      elem = $(elem);
      if (Element.getBoxSizing(elem) == 'content-box') {
        var padding = Element.getPaddingSize(elem);
        var border = Element.getBorderSize(elem);
        var margin = Element.getMarginSize(elem);
        if (typeof size.width != 'undefined') {
          var width = (size.width - padding.left - padding.right - border.left - border.right - margin.left - margin.right);
          if (width < 0) {
            width = 0;
          }
		  elem.setStyle({width: width + 'px'});
        }
        if (typeof size.height != 'undefined') {
          var height = (size.height - padding.top - padding.bottom - border.top - border.bottom - margin.top - margin.bottom);
          if (height < 0) {
            height = 0;
          }
		  elem.setStyle({height: height + "px"});
        }
      } else {
        if (typeof size.width != 'undefined' && size.width >= 0) {
			elem.setStyle({width: size.width + "px"});
        }
        if (typeof size.height != 'undefined' && size.height >= 0) {
			elem.setStyle({height: size.height + "px"});
        }
      }
    },
    /**
     * Function: getPaddingSize
     *
     * returns the padding for each edge of an element
     *
     * Parameter: elem
     *
     * The element to get the padding for.
     *
     * Return: {Object} an object with properties left, top, right and bottom
     * that contain the associated padding values.
     */
    getPaddingSize : function (elem) {
      elem = $(elem);
      Element.toggleMeasurable(elem);
      var l = Element.getNumber(Element.getStyle(elem, 'padding-left'));
      var t = Element.getNumber(Element.getStyle(elem, 'padding-top'));
      var r = Element.getNumber(Element.getStyle(elem, 'padding-right'));
      var b = Element.getNumber(Element.getStyle(elem, 'padding-bottom'));
      Element.toggleMeasurable(elem);
      return {left:l, top:t, right: r, bottom: b};
    },
    /**
     * Function: getBorderSize
     *
     * returns the border size for each edge of an element
     *
     * Parameter: elem
     *
     * The element to get the borders for.
     *
     * Return: {Object} an object with properties left, top, right and bottom
     * that contain the associated border values.
     */
    getBorderSize : function(elem) {
      elem = $(elem);
      Element.toggleMeasurable(elem);
      var l = Element.getNumber(Element.getStyle(elem, 'border-left-width'));
      var t = Element.getNumber(Element.getStyle(elem, 'border-top-width'));
      var r = Element.getNumber(Element.getStyle(elem, 'border-right-width'));
      var b = Element.getNumber(Element.getStyle(elem, 'border-bottom-width'));
      Element.toggleMeasurable(elem);
      return {left:l, top:t, right: r, bottom: b};
    },
    /**
     * Function: getMarginSize
     *
     * returns the margin size for each edge of an element
     *
     * Parameter: elem
     *
     * The element to get the margins for.
     *
     * Return: {Object} an object with properties left, top, right and bottom
     * that contain the associated margin values.
     */
    getMarginSize : function(elem) {
      elem = $(elem);
      Element.toggleMeasurable(elem);
	  if(elem.getStyle("position") == 'relative') {
	  	return {left: 0, top: 0, right: 0, bottom: 0};
	  }
      var l = Element.getNumber(Element.getStyle(elem, 'margin-left'));
      var t = Element.getNumber(Element.getStyle(elem, 'margin-top'));
      var r = Element.getNumber(Element.getStyle(elem, 'margin-right'));
      var b = Element.getNumber(Element.getStyle(elem, 'margin-bottom'));
      Element.toggleMeasurable(elem);
      return {left:l, top:t, right: r, bottom: b};
    },
    /**
     * Function: getNumber
     *
     * safely parse a number and return its integer value.  A NaN value 
     * returns 0.  CSS size values are also parsed correctly.
     *
     * Parameter: {Mixed} n
     *
     * the string or object to parse.
     *
     * Return: {Integer} the integer value that the parameter represents
     */
    getNumber: function(n) {
      var result = n==null||isNaN(parseInt(n))?0:parseInt(n);
      return result;
    },
    /**
     * Function: getPageDimensions
     *
     * return the dimensions of the browser client area.
     *
     * Return: {Object} an object containing a width and height property 
     * that represent the width and height of the browser client area.
     */
    getPageDimensions: function() {
        return {width: Element.getInsideWindowWidth(), height: Element.getInsideWindowHeight()};
    },
    /**
     * Function: getInsideWindowWidth
     *
     * returns the width of the browser client area
     *
     * Return: {Integer} the width of the browser client area
     */
    getInsideWindowWidth: function() {
        if (window.innerWidth) {
            return window.innerWidth;
        } else if (document.compatMode && document.compatMode.indexOf("CSS1") >= 0) {
            // measure the html element's clientWidth
            return document.body.parentElement.clientWidth;
        } else if (document.body && document.body.clientWidth) {
            return document.body.clientWidth;
        }
        return 0; 
    },
    /**
     * Function: getInsideWindowHeight
     *
     * returns the height of the browser client area
     *
     * Return: {Integer} the height of the browser client area
     */
    getInsideWindowHeight: function() {
        if (window.innerHeight) {
            return window.innerHeight;
        } else if (document.compatMode && document.compatMode.indexOf("CSS1") >= 0) {
            // measure the html element's clientHeight
            return document.body.parentElement.clientHeight;
        } else if (document.body && document.body.clientHeight) {
            return document.body.clientHeight;
        }
        return 0; 
    },
    /**
     * Function: toggleMeasurable
     *
     * toggles an element's display style property so it can be
     * measured.  If the element has display: none, it is
     * changed to display: block and made temporarily visible
     * so that it can be measured.  Calling this function
     * a second time with the same element will revert the
     * changes.  This allows an element to be measured in
     * various ways.
     *
     * Parameter: {Object} elem
     *
     * the element to measure.
     */
    toggleMeasurable: function(elem) {
        if (Element.getStyle(elem, 'display') == 'none') {
            elem.old = {};
            elem.old.display = elem.style.display;
            elem.old.visibility = elem.style.visibility;
            elem.old.position = elem.style.position;
            elem.style.position = 'absolute';
            elem.style.visibility = 'hidden';
            elem.style.display = 'block';
        } else {
            if (elem.old) {
                elem.style.display = elem.old.display;
                elem.style.visibility = elem.old.visibility;
                elem.style.position = elem.old.position;
                elem.old = null;
            }
        }
    }
} );