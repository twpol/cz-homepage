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
		<title>ChatZilla Releases</title>
		<link>${linkBase}</link>
		<description>Recent ChatZilla releases</description>
		<language>en-gb</language>
RSSHEADER

my @lines;
if (open(REVS, "<../common/script/revs.js") or open(REVS, "<common/script/revs.js")) {
	@lines = <REVS>;
	close(REVS);
}

my $revs = join('', @lines);
my @revs = ($revs =~ /{(.*?)}/gsi);
my $maxrevs = 10;
my %conds = ( G => "stable", Y => "unstable", R => "experimental");

foreach my $rev (@revs) {
	$rev =~ s/&/&amp;/gsi;
	$rev =~ s/</&lt;/gsi;
	$rev =~ s/>/&gt;/gsi;
	$rev =~ s/\\"/&quot;/gsi;
	next if ($rev =~ /\bhidden:\s+true\b/);
	
	# Extract various bits of the release.
	my $id   = ($rev =~ /id:\s+"(.*?)"/gsi)[0] || "";
	my $date = ($rev =~ /date:\s+"(.*?)"/gsi)[0] || "";
	my $cond = ($rev =~ /condition:\s+(\w+)/gsi)[0] || "";
	my $bugs = ($rev =~ /bugs:\s+\[(.*?)\]/gsi)[0] || "";
	my $desc = ($rev =~ /desc:\s+"([^"]+(?:".*?"[^"]+)*)"/gsi)[0] || "";
	$desc =~ s/"\s*\+\s*linkBase\s*\+\s*"/$linkBase/gs;
	$desc =~ s/".*?\+.*?"//gsi;
	$desc =~ s/``/&#x201C;/gsi;
	$desc =~ s/''/&#x201D;/gsi;
	$desc =~ s/'/&apos;/gsi;
	
	my ($dateY, $dateM, $dateD) = ($date =~ /(\d\d\d\d)-(\d\d)-(\d\d)/);
	
	# Extract all the bug numbers.
	my @bugs = ($bugs =~ /(\d+)/g);
	# Link all the bug#s.
	@bugs = map { "&lt;a href=\"https:\/\/bugzilla.mozilla.org\/show_bug.cgi?id=$_\"&gt;$_&lt;\/a&gt;" } @bugs;
	# Make nice list and count the bugs.
	$bugs = join(", ", @bugs);
	my $bugCount = scalar(@bugs);
	
	# Tue, 03 Jun 2003 09:39:21 GMT
	my $dateStr = strftime("%a, %d %b %Y %H:%M:%S ", 0, 0, 0, $dateD, $dateM - 1, $dateY - 1900);
	my $tz = strftime("%Z", 0, 0, 0, $dateD, $dateM - 1, $dateY);
	$tz =~ s/ .*//;
	$dateStr .= $tz;
	
	$date = strftime("%A, %d %b %Y", 0, 0, 0, $dateD, $dateM - 1, $dateY - 1900);
	
	print <<RSSITEM;
		<item>
			<title>ChatZilla $id ($conds{$cond}, $bugCount bugs fixed)</title>
			<pubDate>$dateStr</pubDate>
			<description>ChatZilla revision $id, released on $date, $desc&lt;br/&gt;&lt;br/&gt;Bugs fixed: $bugs.</description>
			<link>${linkBase}revisions#$id</link>
		</item>
RSSITEM
	
	last if (--$maxrevs <= 0);
}

print <<RSSFOOTER;
	</channel>
</rss>
RSSFOOTER
