var G = 0;
var Y = 1;
var R = 2;

var conditions = [
	{ title: "Stable",      cssClass: "green",  desc: "Stable" },
	{ title: "Unstable",    cssClass: "yellow", desc: "Unstable" },
	{ title: "Development", cssClass: "red",    desc: "Development" }
];

function getLatestVersion() {
	return revs[0];
}

function writeAllRevisions() {
	var status = { foundLatestStable: false };
	for (var i = 0; i < revs.length; i++) {
		writeRev(revs[i], status);
	}
}

function writeRev(rev, status) {
	var latestStable = false;
	if (status) {
		if (!status.foundLatestStable && (rev.condition == G)) {
			status.foundLatestStable = true;
			latestStable = true;
		}
	}
	document.write("<A NAME=\"" + rev.id + "\"></A>");
	document.write("<DIV CLASS=\"revision rev-" + conditions[rev.condition].cssClass + "\">");
	document.write("<DIV CLASS=\"rev-image-" + conditions[rev.condition].cssClass + "\"");
	document.write(" TITLE=\"" + conditions[rev.condition].title + "\"></DIV>");
	document.write("<DIV CLASS=\"rev-id\">" + rev.id + "</DIV>");
	document.write("<DIV CLASS=\"rev-date\">" + rev.date + "</DIV>");
	document.write("<DIV CLASS=\"rev-size\">" + (rev.size ? rev.size + "KB" : "") + "</DIV>");
	document.write("<DIV CLASS=\"rev-bugs\">" + (rev.bugs && rev.bugs.length ? "<A HREF=\"http://bugzilla.mozilla.org/buglist.cgi?bug_id=" + rev.bugs.sort().join(",") + "\">" + rev.bugs.length + " bug" + (rev.bugs.length != 1 ? "s" : "") + " fixed</A>" : "") + "</DIV>");
	document.write("<DIV CLASS=\"rev-install\">" + (latestStable ? "<SPAN>Latest stable version</SPAN> " : "") + "<A HREF=\"" + linkBase + "xpi/chatzilla-" + rev.id + ".xpi\">Install " + rev.id + "</A></DIV>");
	document.write("<DIV CLASS=\"rev-desc\">Revision " + rev.id + " " + rev.desc + "</DIV>");
	document.write("</DIV>");
}
