(function(c, e, d) {
	c.fn.qdata = function() {
		var j = {};
		var k = c(this).attr("data");
		if(k) {
			var f = k.split(";");
			for(var h = 0; h < f.length; h++) {
				if(f[h]) {
					var g = f[h].split(":");
					j[g[0]] = g[1]
				}
			}
		}
		return j
	};
	var b = e.bsp = {};
	b.ajaxoptions = {
		url: "",
		data: {},
		type: "post",
		dataType: "json",
		async: false
	};
	b.ajaxopt = function(f) {
		var g = c.extend({}, b.ajaxoptions);
		if(typeof f == "string") {
			g.url = f
		} else {
			c.extend(g, f)
		}
		return g
	};
	b.ajax = function(f) {
		if(!f) {
			alert("need options")
		} else {
			var g;
			c.ajax(b.ajaxopt(f)).done(function(h) {
				g = h
			});
			return g
		}
	};
	b.on = function(h, g, f) {
		c(document).off(g, h).on(g, h, f)
	};
	var a = 0;
	b.on("body", "shown.bs.modal", function() {
		a++
	});
	b.on("body", "hidden.bs.modal", function() {
		a--;
		setTimeout(function() {
			if(a > 0) {
				c("body").addClass("modal-open")
			}
		}, 100)
	})
})(jQuery, window, document);
Bdiag = {};
Bdiag.Result = function(b, a) {
	this.success = b || true;
	this.msg = a || ""
};
Bdiag.modaloptions = {
	url: "",
	fade: "fade",
	close: true,
	title: "title",
	hasBtn: true,
	hasCancelBtn: false,
	okbtn: "\u786e\u5b9a",
	cancelbtn: "\u53d6\u6d88",
	msg: "",
	big: false,
	show: false,
	remote: false,
	backdrop: "static",
	keyboard: true,
	style: "",
	diagId: "bsmodal",
	adjustTop: false,
	adjustStep: 2,
	marginTop: 30,
};
Bdiag.modalstr = function(b) {
	var f = $('div[role="dialog"]');
	var i = 0;
	if(b.adjustTop) {
		if(f && f.length > 0) {
			$.each(f, function(j, k) {
				if(!$(k).is(":hidden")) {
					i += b.adjustStep
				}
			})
		}
	}
	var a = '<div class="modal ' + b.fade + '" id="' + b.diagId + '" tabindex="-1" role="dialog" aria-labelledby="bsmodaltitle" aria-hidden="true" style="position:fixed;top:' + i + "px;" + b.style + '">';
	var d = ' style="margin-top:' + b.marginTop + 'px"';
	if(b.big) {
		a += '<div class="modal-lg"' + d + '><div class="modal-content">'
	} else {
		a += '<div class="modal-dialog self-modal"' + d + '><div class="modal-content">'
	}
	var c = "</div></div></div>";
	var g = '<div class="modal-header">';
	if(b.close) {
		g += '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'
	}
	g += '<h4 class="modal-title" id="bsmodaltitle">' + b.title + "</h4></div>";
	var e = '<div class="modal-body clearfix">' + b.msg + "</div>";
	var h = '<div class="modal-footer">';
	if(b.hasCancelBtn) {
		h += '<button type="button" class="btn btn-default bscancel">' + b.cancelbtn + "</button>"
	}
	h += '<button type="button" class="btn btn-primary bsok" style="margin-bottom:0;margin-left:5px;">' + b.okbtn + "</button>";
	h += "</div>";
	return a + g + e + h + c
};
Bdiag.modalphonebox = function(e) {
	var f = '<div class="modal m-modal ' + e.fade + '" id="' + e.diagId + '" tabindex="-1" role="dialog" aria-labelledby="bsmodaltitle" aria-hidden="true" style="position:fixed;top:20px;' + e.style + '">';
	if(e.big) {
		f += '<div class="modal-lg"><div class="modal-content">'
	} else {
		f += '<div class="modal-dialog"><div class="modal-content">'
	}
	var b = "</div></div></div>";
	var d = '<div class="modal-header">';
	if(e.close) {
		d += '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'
	}
	d += '<h4 class="modal-title" id="bsmodaltitle">' + e.title + "</h4></div>";
	var a = '<div class="modal-body clearfix">' + e.msg + "</div>";
	var c = '<div class="modal-footer">';
	if(e.hasCancelBtn) {
		c += '<button type="button" class="m-btn bscancel">' + e.cancelbtn + "</button>"
	}
	c += '<button type="button" class="m-btn bsok">' + e.okbtn + "</button>";
	c += "</div>";
	return f + d + a + c + b
};
Bdiag.modalbox = function(d) {
	var e = '<div class="modal ' + d.fade + '" id="' + d.diagId + '" tabindex="-1" role="dialog" aria-labelledby="bsmodaltitle" aria-hidden="true" style="position:fixed;top:50px;width:600px; margin:30px auto;' + d.style + '">';
	if(d.big) {
		e += '<div class="modal-lg"><div class="modal-content">'
	} else {
		e += '<div class="modal-dialog self-modal"><div class="modal-content">'
	}
	var b = "</div></div></div>";
	var c = '<div class="modal-header">';
	if(d.close) {
		c += '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>'
	}
	c += '<h4 class="modal-title" id="bsmodaltitle">' + d.title + "</h4></div>";
	var a = '<div class="modal-body clearfix">' + d.msg + "</div>";
	return e + c + a + b
};
Bdiag.modal = function(b, e, g) {
	var c = $.extend({}, Bdiag.modaloptions);
	if(typeof b == "string") {
		c.msg = b
	} else {
		$.extend(c, b)
	}
	var d = c.diagId;
	if(d == "bsmodal") {
		d = "bsmodal-" + Math.ceil(Math.random() * 10000000);
		c.diagId = d
	}
	if(c.hasBtn) {
		$("body").append(Bdiag.modalstr(c))
	} else {
		$("body").append(Bdiag.modalbox(c))
	}
	var f = "#" + d + " ";
	var a = $("#" + d);
	a.modal(c);
	bsp.on(f + "button.bsok", "click", function() {
		var i = $(this);
		if(e && $.isFunction(e)) {
			var h = e(a, i);
			if(h) {
				if(h.success === true) {
					a.modal("hide")
				} else {
					if(h.msg) {
						$.tips.error(h.msg, i)
					}
				}
			} else {
				a.modal("hide")
			}
		} else {
			a.modal("hide")
		}
	});
	bsp.on(f + "button.bscancel", "click", function() {
		a.modal("hide")
	});
	if(c.close) {
		bsp.on("#" + d, "hidden.bs.modal", function() {
			a.remove()
		})
	}
	a.on("hide.bs.modal", function() {
		if(g && $.isFunction(g)) {
			g(a)
		}
	});
	a.modal("show")
};
Bdiag.alert = function(b, e) {
	var c = $.extend({}, Bdiag.modaloptions);
	c.title = "\u8b66\u544a";
	if(typeof b == "string") {
		c.msg = b
	} else {
		$.extend(c, b)
	}
	$("body").append(Bdiag.modalstr(c));
	var d = c.diagId;
	var f = "#" + d + " ";
	var a = $("#" + d);
	a.modal(c);
	bsp.on(f + "button.bsok", "click", function() {
		if(e) {
			e()
		}
		a.modal("hide")
	});
	bsp.on("#" + d, "hidden.bs.modal", function() {
		a.remove()
	});
	a.modal("show")
};
Bdiag.confirm = function(b, d, f) {
	var c = $.extend({}, Bdiag.modaloptions);
	c.title = "\u786e\u8ba4\u64cd\u4f5c";
	if(typeof b == "string") {
		c.msg = b
	} else {
		$.extend(c, b)
	}
	c.hasCancelBtn = true;
	$("body").append(Bdiag.modalstr(c));
	var e = c.diagId;
	var a = $("#" + e);
	var g = "#" + e + " ";
	a.modal(c);
	a.addClass("order-modal");
	bsp.on(g + "button.bsok", "click", function() {
		if(d) {
			d()
		}
		a.modal("hide")
	});
	bsp.on(g + "button.bscancel", "click", function() {
		if(f) {
			f()
		}
		a.modal("hide")
	});
	bsp.on("#" + e, "hidden.bs.modal", function() {
		a.remove()
	});
	a.modal("show")
};
Bdiag.dialog = function(b, e) {
	var c = $.extend({}, Bdiag.modaloptions, b);
	c.big = true;
	$("body").append(Bdiag.modalstr(c));
	var d = c.diagId;
	var f = "#" + d + " ";
	$(f + "div.modal-body").empty().append(html);
	var a = $("#" + d);
	a.modal(c);
	bsp.on(f + "button.bsok", "click", function() {
		var g = true;
		if(e) {
			g = e()
		}
		if(g) {
			a.modal("hide")
		}
	});
	bsp.on("#" + d, "hidden.bs.modal", function() {
		a.remove()
	});
	a.modal("show")
};
Bdiag.modalphone = function(b, e) {
	var c = $.extend({}, Bdiag.modaloptions);
	if(typeof b == "string") {
		c.msg = b
	} else {
		$.extend(c, b)
	}
	if(c.hasBtn) {
		$("body").append(Bdiag.modalphonebox(c))
	} else {
		$("body").append(Bdiag.modalbox(c))
	}
	var d = c.diagId;
	var a = $("#" + d);
	var f = "#" + d + " ";
	a.modal(c);
	bsp.on(f + "button.bsok", "click", function() {
		var h = $(this);
		if(e && $.isFunction(e)) {
			var g = e(a, h);
			if(g) {
				if(g.success === true) {
					a.modal("hide")
				} else {
					$.tips.error(g.msg, h)
				}
			} else {
				a.modal("hide")
			}
		} else {
			a.modal("hide")
		}
	});
	bsp.on(f + "button.bscancel", "click", function() {
		a.modal("hide")
	});
	if(c.hasCancelBtn) {
		bsp.on("#" + d, "hidden.bs.modal", function() {
			a.remove()
		})
	}
	a.modal("show")
};