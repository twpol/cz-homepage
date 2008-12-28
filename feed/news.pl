#!/usr/bin/perl

use warnings;
use strict;
use POSIX qw/strftime/;

my $linkBase = "http://chatzilla.hacksrus.com/";

print "Content-Type: application/xml\r\n";
print "Status: 200 OK\r\n";
print "\r\n";

print <<RSSHEADER;
<rss version="2.0">
	<channel>
		<title>ChatZilla News</title>
		<link>${linkBase}</link>
		<description>Recent news about ChatZilla</description>
		<language>en-gb</language>
RSSHEADER

my @lines;
if (open(NEWS, "<../common/script/news.js") or open(NEWS, "<common/script/news.js")) {
	@lines = <NEWS>;
	close(NEWS);
}

my $news = join('', @lines);
my @news = ($news =~ /{(.*?)}/gsi);
my $maxnews = 10;

foreach my $news (@news) {
	$news =~ s/&/&amp;/gsi;
	$news =~ s/</&lt;/gsi;
	$news =~ s/>/&gt;/gsi;
	$news =~ s/\\"/&quot;/gsi;
	
	# Extract various bits of the news.
	my $date = ($news =~ /date:\s+new Date\((.*?)\)/gsi)[0] || "";
	my $desc = ($news =~ /text:\s+\["([^"]+(?:".*?"[^"]+)*)"\]/gsi)[0] || "";
	$desc =~ s/"\s*\+\s*linkBase\s*\+\s*"/$linkBase/gs;
	$desc =~ s/".*?\+.*?"//gsi;
	$desc =~ s/"\s*,\s*"/<br\/><br\/>/gsi;
	$desc =~ s/``/&#x201C;/gsi;
	$desc =~ s/''/&#x201D;/gsi;
	$desc =~ s/'/&apos;/gsi;
	
	my ($dateY, $dateM, $dateD) = ($date =~ /(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/);
	$dateM++;
	
	# Tue, 03 Jun 2003 09:39:21 GMT
	my $dateStr = strftime("%a, %d %b %Y %H:%M:%S ", 0, 0, 0, $dateD, $dateM - 1, $dateY - 1900);
	my $tz = strftime("%Z", 0, 0, 0, $dateD, $dateM - 1, $dateY);
	$tz =~ s/ .*//;
	$dateStr .= $tz;
	
	$date = strftime("%A, %d %b %Y", 0, 0, 0, $dateD, $dateM - 1, $dateY - 1900);
	
	print <<RSSITEM;
		<item>
			<title>ChatZilla News</title>
			<pubDate>$dateStr</pubDate>
			<description>$date: $desc</description>
			<link>${linkBase}</link>
		</item>
RSSITEM
	
	last if (--$maxnews <= 0);
}

print <<RSSFOOTER;
	</channel>
</rss>
RSSFOOTER
