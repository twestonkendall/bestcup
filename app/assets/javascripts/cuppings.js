function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".newsamplefields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
	$("form input:radio").hide()
	$("img[class=roast_level]").click(function () { 
		$(this).prev("form input:radio").attr("checked", "checked")
		$(this).parent("p").find("img").not($(this)).removeClass("shadow")
		$(this).addClass("shadow")
  });
}

$(document).ready(function() {
	$("form input:radio").hide()
	$("form input:radio:checked").next().addClass("shadow")
	
	$("img[class=roast_level]").click(function () { 
		$(this).prev("form input:radio").attr("checked", "checked")
	 	$(this).parent("section").find("img").not($(this)).removeClass("shadow")
	 	$(this).addClass("shadow")
	});
})

// .css({background:"yellow", border:"3px red solid"})
