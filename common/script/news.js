var news = [
	{
		date: new Date(2009, 10, 21), // November 21, 2009
		text: ["ChatZilla's codebase has recently been moved into a Mercurial repository hosted by Mozilla at <a href='http://hg.mozilla.org/chatzilla'>http://hg.mozilla.org/chatzilla</a>. Anyone working against the source code should update to use this instead of the CVS directory, which will no longer be updated."]
	}, {
		date: new Date(2008, 11, 24), // December 11, 2008
		text: ["It's been ages since we gave you some news so, as a little holiday surprise, here's an updated website. All the usual suspects are still here, although the FAQ has had some work done to it. We hope you like it!"]
	}, {
		date: new Date(2007, 3, 3), // April 3, 2007
		text: ["With the release of <b>ChatZilla 0.9.78</b>, many improvements have been made - some subtle, some not so. Probably the first one you will notice is that the old F-key tab switching shortcuts have been replaced with the browser's shortcuts (Alt + number on SeaMonkey and Linux Firefox, Control + number on Windows Firefox, and Command + number for Mac Firefox). The online/offline icon in the statusbar will also be easy to notice.", "Less clearly visible changes include the improvements to the text munger, which will now apply inline styles (like <b>*bold*</b>) with more consistency. Likewise, when <a href=\"" + linkBase + "faq/#colors\">sending of color codes</a> is enabled, the respective codes (%C, %B, etc.) will not be matched inside URLs, allowing them to be pasted without problems. As a final subtle change, ChatZilla can once again be <a href=\"" + linkBase + "faq/#inatab\">loaded into a browser tab</a>, but this is not officially supported until further work has been done."]
	}, {
		date: new Date(2006, 1, 9), // February 9, 2006
		text: ["This is just a heads-up for those of you that use the latest-and-greatest SeaMonkey or Firefox builds (usually called \"nightly builds\") - a change in the HTML parser rendered ChatZilla rather broken. We've already fixed the code, but until a new official release is out, you'll need to <a href=\"http://twpol.dyndns.org/mozilla/chatzilla/nightly\">fetch a nightlyChatZilla build</a>."]
	}, {
		date: new Date(2006, 0, 11), // January 11, 2006
		text: ["A lot has happened recently, and <b>ChatZilla 0.9.69.2</b> is now out. The big issues currently are <a href=\"https://bugzilla.mozilla.org/show_bug.cgi?id=321195\">motifs not displaying properly</a> and the <a href=\"https://bugzilla.mozilla.org/show_bug.cgi?id=318419\">timer problem</a> - luckly we've managed to get the first one fixed (for Firefox 1.5.0.1), and are making good headway with the second one. These are both Firefox (Gecko) bugs, but they only affect us seriously, which is why we get to do all the hard work!", "The other news is that starting with ChatZilla 0.9.69.2, 1% of all new users will be asked to enabled a \"startup ping\", which will send the client's version to one of our developer's servers each time it starts. Nothing except the client version, and the name and version of the host app (Firefox, Mozilla, XULRunner) is sent - certainly nothing that could identify the user - and there is the option to not send the ping. This data should help us to idenify what people are doing with ChatZilla - do they run it on older versions of Mozilla, for example, and how long they take to upgrade to the newest release. We should also be able to estimate the number of active users, which is much more useful that the simple \"download count\" we currently have."]
	}, {
		date: new Date(2004, 9, 30), // October 30, 2004
		text: ["<b>ChatZilla 0.9.66</b> includes a new version of the ChatZilla plugin API - you can find more details in the <a href=\"https://bugzilla.mozilla.org/show_bug.cgi?id=262037\">bug report</a>.", "<b>ChatZilla 0.9.66a</b> features a new channel list dialog, accessible from File > Join Channel, Ctrl-J, or <tt>/join</tt>. The dialog lets you search for channels containing certain text in their name or topic, as well as minimum and maximum user filters. Get the <a href=\"" + linkBase + "revisions\">latest version</a> to try it out."]
	}, {
		date: new Date(2004, 8, 5), // September 5, 2004
		text: ["<b>ChatZilla 0.9.64g</b> fixes the memory problems some people have experienced with <b>0.9.64f</b>, as well as many other fixes and improvements."]
	}, {
		date: new Date(2004, 7, 25), // August 25, 2004
		text: ["<b>ChatZilla 0.9.64f</b> has been causing problems for some people. If you are experiencing excessive memory or CPU usage when running <b>0.9.64f</b> you are advised to install <a href=\"" + linkBase + "revisions#0.9.64e\">0.9.64e</a> until we work out the exact cause and fix it properly. If you need the new features in <b>0.9.64f</b> (SSL and full Unicode nicknames), please check back regularly for <a href=\"" + linkBase + "revisions\">new revisions</a> that solve this problem."]
	}, {
		date: new Date(2004, 5, 10), // June 10, 2004
		text: ["<b>Firefox 0.9 support added</b>. With Firefox 0.9 being released in just a few days, we've now fixed the majority of issues with ChatZilla running on current versions of the Mozilla Firefox browser. <i>Update, June 17, 2004: some more compatibility fixes have been made, including fixing opening URLs in a new window.</i> Please get the <a href=\"" + linkBase + "revisions\">latest revision</a> to try it out.", "<b>Mozilla blocks XPInstall from \"untrusted\" hosts</b>. <a href=\"http://bugzilla.mozilla.org/show_bug.cgi?id=240552\">Bug 240552</a> blocks XPInstall from \"untrusted\" hosts, which means you can no longer install ChatZilla directly from this website with Mozilla 1.7 and newer. Instead, you need to download the XPI files and open them in Mozilla on your computer."]
	}, {
		date: new Date(2004, 3, 22), // April 22, 2004
		text: ["<b>ChatZilla now supports DCC File transfers</b>. Yes, it's finally here, but don't expect it to be perfect just yet - it's still very much a work-in-progress feature. Download the <a href=\"" + linkBase + "revisions\">latest revision</a> if you want to try it out."]
	}, {
		date: new Date(2003, 11, 25), // December 25, 2003
		text: ["<b>ChatZilla's preference window now works in Mozilla Firefox</b>. It took some time, but it's finally working. Anyone who uses ChatZilla in Mozilla Firefox should check out version <b>0.9.54c</b> or later, and we'd love to hear suggestions for making it better. <i>Note: all versions since <b>0.9.63</b> have this feature as standard, and work in the Mozilla Suite and Mozilla Firefox.</i>"]
	}, {
		date: new Date(2003, 10, 17), // November 17, 2003
		text: ["<b>ChatZilla has a new web page</b>.  \"You're soaking in it.\"&trade;  Check out the new <a href=\"" + linkBase + "motifs\">motifs</a> page when you have a minute. Returning visitors will notice that only recent revisions are shown in the table below.  You can still access the complete list on the <a href=\"" + linkBase + "revisions\">Revision History</a> page.  I've also added a way to <a href=\"" + linkBase + "donate\">donate</a> via PayPal, in case you want to contribute to the cause.", "<b>James Ross gets CVS access</b>.  James is the creator the ChatZilla pref panels, <a href=\"http://www.irc.org/tech_docs/005.html\">RPL_ISUPPORT</a> support, and halfop mode support.  He also contributes regurlarly in Bugzilla and on <a href=\"" + linkBase + "faq/#irc\">#chatzilla</a>, as <i>Silver</i>.", "<b>Server sockets are in!</b> Darin Fisher has added server sockets to Necko in the latest nightlies.  This makes it possible to add <b>DCC</b> support to ChatZilla. See bugs <a href=\"http://bugzilla.mozilla.org/show_bug.cgi?id=92928\">92928</a> and <a href=\"http://bugzilla.mozilla.org/show_bug.cgi?id=73257\">73257</a> for more information."]
	}
];
