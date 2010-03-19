// Each page and virtual site section should have an entry here. An extra must
// have a "key", "url" and "title". Optional items are "showHeader" and
// "showInHeader" followed by a number (e.g. "showInHeader0", "showInHeader1").
//
// The breadcrumb trail is based on the key heirachy, going from "root" up to
// the item for the current page. Note that the array must be in heirachical
// order.
//
// The url indicates the location of the page relative to the site root (which
// is not fixed). "" is the root page, "foo" is a file in the top level or a
// single-level directory, "foo/bar" is a file one level down, or a 2nd level
// directory, etc.
//
// The title is displayed in the header, if a showInHeader<number> item is
// present, and always in the breadcrumbs if appropriate.
//
// showHeader defines which header bar to show; 0 is the default. Only items
// with showInHeader<number> for the correct number are shown. The
// siteSections array defines the title displayed against each header.
// 

var siteSections = [
		{ title: "" },
		{ title: "Developers" }
	];

var sitePages = [
		{
			key: "root",
			url: "",
			title: "Home"
		}, {
			key: "root/news",
			url: "news",
			title: "News"
		}, {
			key: "root/donate",
			url: "donate",
			title: "Donate",
			showInHeader0: true
		}, {
			key: "root/localization",
			url: "localization",
			title: "Localization Guide"
		}, {
			key: "root/screenshots",
			url: "screenshots/?M=D",
			title: "Screenshots",
			showInHeader0: true
		}, {
			key: "root/users",
			url: null,
			title: "Users"
		}, {
			key: "root/users/intro",
			url: "intro",
			title: "Introduction",
			showInHeader0: true
		}, {
			key: "root/users/faq",
			url: "faq",
			title: "Frequently Asked Questions",
			showInHeader0: true
//		}, {
//			key: "root/users/help",
//			url: "help",
//			title: "General Help",
//			showInHeader0: true
		}, {
			key: "root/users/motifs",
			url: "motifs",
			title: "Motifs",
			showInHeader0: true
//		}, {
//			key: "root/users/scripts",
//			url: "scripts",
//			title: "Scripts",
//			showInHeader0: true
		}, {
			key: "root/users/revisions",
			url: "revisions",
			title: "All Versions of ChatZilla"
		}, {
			key: "root/developers",
			url: "developers",
			title: "Developers",
			showHeader: 1,
			showInHeader0: true
		}, {
			key: "root/developers/api",
			url: "developers/api",
			title: "API",
			showHeader: 1,
			showInHeader1: true
//		}, {
//			key: "root/developers/plugins",
//			url: "developers/plugins",
//			title: "Plugins",
//			showHeader: 1,
//			showInHeader1: true
//		}, {
//			key: "root/developers/nightly",
//			url: "developers/nightly",
//			title: "Nightly Builds",
//			showHeader: 1,
//			showInHeader1: true
//		}, {
//			key: "root/developers/bugs",
//			url: "developers/bugs",
//			title: "Bug Status",
//			showHeader: 1,
//			showInHeader1: true
//		}, {
//			key: "root/developers/developers",
//			url: "developers/developers",
//			title: "List of Developers",
//			showHeader: 1,
//			showInHeader1: true
		}
	];

var currentPage = null;
var currentPageURL = "";
var currentPageNesting = "";
var currentHeader = 0;

var linkBase = "";

function sanitiseURL(url) {
	if (url.indexOf("?") != -1) {
		url = url.substr(0, url.indexOf("?"));
	}
	if (url.indexOf("#") != -1) {
		url = url.substr(0, url.indexOf("#"));
	}
	return url;
}

function getSiteItemByKey(key) {
	for (var i = 0; i < sitePages.length; i++) {
		if (sitePages[i].key == key) {
			return sitePages[i];
		}
	}
	return null;
}

function getSiteItemByURL(url) {
	if (url.substr(url.length - 1) != "/") {
		url += "/";
	}
	
	var page = null;
	for (var i = 0; i < sitePages.length; i++) {
		if (sitePages[i].url == null)
			continue;
		
		var pageURL = "/" + sitePages[i].url + (sitePages[i].url ? "/" : "");
		if (url.substr(url.length - pageURL.length) == pageURL) {
			page = sitePages[i];
		}
	}
	return page;
}

function writeHeader() {
	// Init
	currentPageURL = sanitiseURL(document.location.href);
	currentPage = getSiteItemByURL(currentPageURL);
	if (currentPage) {
		// Get correct header number.
		if (typeof currentPage.showHeader != "undefined") {
			currentHeader = currentPage.showHeader;
		}
		
		// Find out how deep we are in.
		currentPageNesting = "";
		if (currentPage.url) {
			var parts = currentPage.url.split("/");
			for (var i = 1; i < parts.length; i++) {
				currentPageNesting += "../";
			}
			if (currentPageURL.substr(currentPageURL.length - 1, 1) == "/") {
				currentPageNesting += "../";
			} else if (parts.length == 1) {
				currentPageNesting += "./";
			}
		}
		
		linkBase = currentPageNesting;
		//document.write("<LI>[url: '" + currentPage.url + "'] [rel: '" + linkBase + "']</LI>");
	}
	
	// Header
	document.write("<H1><A HREF=\"" + linkBase + "\" CLASS=\"logo\">ChatZilla!</A></H1>");
	
	document.write("<DIV CLASS=\"nav\">");
	
	document.write("<UL CLASS=\"sections\">");
	if (siteSections[currentHeader].title) {
		document.write("<LI><STRONG>" + siteSections[currentHeader].title + ":</STRONG></LI>");
	}
	for (var i = 0; i < sitePages.length; i++) {
		if (typeof sitePages[i]["showInHeader" + currentHeader] != "undefined") {
			document.write("<LI><A HREF=\"" + linkBase + sitePages[i].url + "\">" +
			               sitePages[i].title + "</A></LI>");
		}
	}
	document.write("</UL>");
	
	var trail = new Array();
	var nesting = "";
	
	document.write("<UL CLASS=\"breadcrumbs\">");
	
	if (currentPage) {
		var key = currentPage.key.split("/");
		var page;
		while (key.length > 0) {
			page = getSiteItemByKey(key.join("/"));
			trail.push(page);
			key.pop();
		}
	}
	
	for (var i = trail.length - 1; i >= 0; i--) {
		if ((i > 0) && (trail[i].url != null)) {
			document.write("<LI><A HREF=\"" + linkBase + trail[i].url + "\">" + trail[i].title + "</A></LI>");
		} else {
			document.write("<LI>" + trail[i].title + "</LI>");
		}
		if (i > 0) {
			document.write("<LI>&gt;</LI>");
		}
	}
	document.write("</UL>");
	
	document.write("</DIV>");
}

function writeFooter() {
	// Does nothing so far.
	
	document.write("<table width='100%'>");
	document.write("  <tr id='footer'>");
	document.write("    <td>");
	document.write("      Want to make a ");
	document.write("      <a href='" + linkBase + "donate'>");
	document.write("      Donation</a>?");
	document.write("    </td>");
	document.write("    <td nowrap align='right'>");
	document.write("      <div>");
	document.write("      Hosting services provided by <a href='http://omnistep.com/main.html'>OmniStep, Inc.</a>");
	document.write("      </div>");
	document.write("    </td>");
	document.write("  </tr>");
	document.write("</table>");
}
