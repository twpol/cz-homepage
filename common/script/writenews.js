function writeLatestNews() {
	var dateCount = 0;
	for (var i = 0; i < news.length; i++) {
		if (news[i].date) {
			dateCount++;
			if (dateCount > 2) {
				break;
			}
			if (dateCount > 1) {
				document.write("</UL>");
			}
			document.write("<H3>" + news[i].date.toLocaleDateString() + "</H3>");
			document.write("<UL>");
		}
		if (typeof news[i].text == "string") {
			document.write("<LI>" + news[i].text + "</LI>");
		} else {
			for (var j = 0; j < news[i].text.length; j++) {
				document.write("<LI>" + news[i].text[j] + "</LI>");
			}
		}
	}
	if (dateCount > 0) {
		document.write("</UL>");
	}
}

function writeNews() {
	var dateCount = 0;
	for (var i = 0; i < news.length; i++) {
		if (news[i].date) {
			dateCount++;
			if (dateCount > 1) {
				document.write("</UL>");
			}
			document.write("<H3>" + news[i].date.toLocaleDateString() + "</H3>");
			document.write("<UL>");
		}
		if (typeof news[i].text == "string") {
			document.write("<LI>" + news[i].text + "</LI>");
		} else {
			for (var j = 0; j < news[i].text.length; j++) {
				document.write("<LI>" + news[i].text[j] + "</LI>");
			}
		}
	}
	if (dateCount > 0) {
		document.write("</UL>");
	}
}
