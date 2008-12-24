function fixupDownloadBox() {
	var host = detectHost();
	
	if (!host.supported) {
		// If the host is not supported, just show the static download content.
		return;
	}
	
	var rev = getLatestVersion();
	
	// Supported host.
	document.write("<DIV CLASS=\"breakout-box-arrow\"></DIV>\n");
	document.write("<P><A HREF=\"https://addons.mozilla.org/addon/16\">Install ChatZilla " + rev.id + " from Add-ons</A></P>\n");
	document.write("<P CLASS=\"footnote\">(It's only " + rev.size + "KB.)</P>\n");
	document.write("<P>ChatZilla works on <STRONG>" + host.name + " " + host.ver + "</STRONG>.</P>\n");
	
	// Do this last, so if anything goes wrong, the static content is still visible.
	var noJSBox = document.getElementById("download-no-js");
	//if (typeof noJSBox.removeChild == "function") {
	//	while (noJSBox.lastChild) {
	//		noJSBox.removeChild(noJSBox.lastChild);
	//	}
	//} else {
		noJSBox.innerHTML = "";
	//}
}
