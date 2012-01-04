// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require_tree .

/* modernizr-test_position_fixed_ios.js
* Original by Daniel Ott (https://gist.github.com/1333800)
* 3 March 2011
* Updated by Philipp Söhnlein 3 November 2011
* Custom Tests using Modernizr's addTest API
*/
/* iOS
* There may be times when we need a quick way to reference whether iOS is in play or not.
* While a primative means, will be helpful for that.
*/
Modernizr.addTest('ipad', function () {
  return !!navigator.userAgent.match(/iPad/i);
});
Modernizr.addTest('iphone', function () {
  return !!navigator.userAgent.match(/iPhone/i);
});
Modernizr.addTest('ipod', function () {
  return !!navigator.userAgent.match(/iPod/i);
});
Modernizr.addTest('appleios', function () {
  return (Modernizr.ipad || Modernizr.ipod || Modernizr.iphone);
});
/* CSS position:fixed
* Not supported in older IE browsers, nor on Apple's iOS devices.
* Actually the token example on the Modernizr docs. http://www.modernizr.com/docs/
*/
Modernizr.addTest('positionfixed', function () {
    var test = document.createElement('div'),
        control = test.cloneNode(false),
        fake = false,
        root = document.body || (function () {
            fake = true;
            return document.documentElement.appendChild(document.createElement('body'));
        }());

    var oldCssText = root.style.cssText;
    root.style.cssText = 'padding:0;margin:0';
    test.style.cssText = 'position:fixed;top:42px';
    root.appendChild(test);
    root.appendChild(control);
    
    var ret = test.offsetTop !== control.offsetTop;

    root.removeChild(test);
    root.removeChild(control);
    root.style.cssText = oldCssText;
    
    if (fake) {
        document.documentElement.removeChild(root);
    }
    
    /* Uh-oh. iOS < 5 would return a false positive here.
    * If it's about to return true, we'll explicitly test for known iOS User Agent strings.
    * "UA Sniffing is bad practice" you say. Agreeable, but sadly this feature has made it to
    * Modernizr's list of undectables, so we're reduced to having to use this. */
    navigator.userAgent.match(/OS (\d)/i);
    return ret && (!Modernizr.appleios || (Modernizr.appleios && RegExp.$1 >= 5));
});
if (Modernizr.positionfixed) {
	$(document).ready(function() {
		$("nav").hide();
		$("nav").css("border-top-right-radius","0em")
		$("footer").css({position:"fixed", bottom:"0px"});
		$("footer").css("max-height", "100%");
		$("footer").prepend('<div class="more_less"><p>^</p></div>');
		$("footer").before('<div class="more_less_margin"></div>');
		$("div.more_less").click(function() {
			if ($('nav').is(":hidden")){
				$("nav").slideDown();
				$("body").children(':not(footer)').css("opacity", "0.2");
				$("body").css("overflow", "hidden");
				$("footer").css("overflow","auto");
				$(this).find("p").css("-webkit-transform", "rotate(180deg)").css({position:"relative", bottom:"33px"});
			}
			else {
				$("nav").slideUp();
				$("footer").css("overflow","hidden");
				$("body").css("overflow", "inherit");
				$("body").children(':not(footer)').css("opacity", "1.0");
				$(this).find("p").css("-webkit-transform", "rotate(0deg)").css("position","inherit");
			}
		});
	});
};