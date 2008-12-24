function fixMotifBrowserSize() {
	if (fixMotifBrowserSize.busy) {
		return;
	}
	
	fixMotifBrowserSize.busy = true;
	var motifBrowser = document.getElementById("motif-browser");
	var motifList = document.getElementById("motif-list");
	var motifBrowserLog = document.getElementById("motif-browser-log");
	
	// Reset height of container so we compute the right value even when
	// shrinking the window.
	motifBrowser.style.height = "";
	motifList.style.height = "1px";
	motifBrowserLog.style.height = "";
	
	var browserHeight = motifBrowser.offsetHeight;
	var space = 0;
	
	if (typeof window.innerHeight == "number") {
		space = window.innerHeight - document.body.offsetHeight - 10;
	} else if (document.documentElement && (typeof document.documentElement.clientHeight == "number")) {
		space = document.documentElement.clientHeight - document.body.offsetHeight;
	}
	
	if (space > 0) {
		motifBrowser.style.height = (space + browserHeight) + "px";
	}
	motifList.style.height = (motifList.parentNode.offsetHeight - motifList.offsetTop - 4) + "px";
	motifBrowserLog.style.height = (motifBrowserLog.parentNode.offsetHeight - motifBrowserLog.offsetTop - 4) + "px";
	
	setTimeout("fixMotifBrowserSize.busy = false", 1000);
}

fixMotifBrowserSize.busy = false;


var motifSelected = -1;
function writeMotifs() {
	for (var i = 0; i < motifs.length; i++) {
		writeMotif(i);
	}
}

function writeMotif(index) {
	var motif = motifs[index];
	document.write("<DIV CLASS=\"motif\" ID=\"motif_" + index + "\" ONCLICK=\"loadMotif(" + index + ")\">");
	document.write("<A CLASS=\"motif-name\" HREF=\"" + motif.file + "\" ONCLICK=\"return false\">" + motif.name + "</A>");
	document.write("<SPAN CLASS=\"motif-desc\">" + motif.desc + "</SPAN>");
	document.write("</DIV>");
}

function updateMotifBrowser() {
	var frame = document.getElementById("motif-browser-log");
	var url = String(frame.contentWindow.document.location);
	
	if (url.substr(url.length - 15) != "/log-blank.html") {
		url = URLUnescape(url.replace(/^.*file=/, "").replace(/&.*$/, ""));
		
		for (var i = 0; i < motifs.length; i++) {
			if (motifs[i].file == url) {
				selectMotif(i);
				return;
			}
		}
	}
	selectMotif(-1);
}

function loadMotif(index) {
	if (index >= 0) {
		var frame = document.getElementById("motif-browser-log");
		frame.setAttribute("src", "log.html?file=" + URLEscape(motifs[index].file) + "&name=" + URLEscape(motifs[index].name) + "#test");
	} else {
		var frame = document.getElementById("motif-browser-log");
		frame.setAttribute("src", "log-blank.html");
	}
}

function selectMotif(index) {
	if (index == motifSelected) {
		return;
	}
	if (motifSelected >= 0) {
		document.getElementById("motif_" + motifSelected).className = "motif";
	}
	motifSelected = index;
	if (motifSelected >= 0) {
		document.getElementById("motif_" + motifSelected).className = "motif motif-selected";
		
		document.getElementById("motif-browser-title").innerHTML = "Preview of &ldquo;" + motifs[motifSelected].name + "&rdquo;";
	} else {
		document.getElementById("motif-browser-title").innerHTML = "&nbsp;";
	}
}

