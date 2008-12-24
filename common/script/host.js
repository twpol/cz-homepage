// JavaScript code to detect the host application.

function detectHost() {
	var rv = new Object();
	var ua = navigator.userAgent;
	var ary;
	
	rv.name = "";
	rv.ver = 0;
	rv.supported = false;
	rv.ie = 0;
	rv.gecko = 0;
	rv.moz = 0;
	rv.sm = 0;
	rv.ff = 0;
	
	ary = ua.match(/MSIE ([^ ;\)]+)/);
	if (ary) {
		rv.ie = ary[1];
		rv.name = "IE";
		rv.ver = rv.ie;
	}
	
	ary = ua.match(/Gecko\/([0-9]{8})/);
	if (ary) {
		rv.name = "embeded Gecko";
		rv.gecko = ary[1];
	}
	
	if (rv.gecko) {
		ary = ua.match(/rv:(([0-9\.]+)[^ ;\)]+)/);
		if (ary) {
			rv.moz = ary[1];
			rv.name = "Mozilla Suite";
			rv.ver = rv.moz;
			if (parseInt(ary[2]) >= 1.0) {
				rv.supported = true;
			}
		}
		
		ary = ua.match(/SeaMonkey\/(([0-9\.]+)[^ ;\)]+)/);
		if (ary) {
			rv.sm = ary[1];
			rv.name = "SeaMonkey";
			rv.ver = rv.sm;
			rv.supported = true;
		}
		
		ary = ua.match(/Firefox\/(([0-9\.]+)[^ ;\)]+)/);
		if (ary) {
			rv.ff = ary[1];
			rv.name = "Mozilla Firefox";
			rv.ver = rv.ff;
			if (parseInt(ary[2]) >= 0.9) {
				rv.supported = true;
			}
		}
	}
	
	return rv;
}
