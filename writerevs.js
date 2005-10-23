/* -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/ 
 * 
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License. 
 *
 * The Original Code is Revision Writer
 * 
 * The Initial Developer of the Original Code is Robert Ginda
 * Portions created by Robert Ginda are
 * Copyright (C) 2003 Robert Ginda
 *
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU Public License (the "GPL"), in which case the
 * provisions of the GPL are applicable instead of those above.
 * If you wish to allow use of your version of this file only
 * under the terms of the GPL and not to allow others to use your
 * version of this file under the MPL, indicate your decision by
 * deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL.  If you do not delete
 * the provisions above, a recipient may use your version of this
 * file under either the MPL or the GPL.
 *
 */

var G = 0;
var Y = 1;
var R = 2;

var ONE_DAY = 86400000;
var ONE_WEEK = 7 * ONE_DAY;

var conditions =
[
 ["green", 
  "<br><img alt='Condition Green' " +
  "title='Revision is expected to be stable' src='green.png'>"],
 ["yellow",
  "<br><img alt='Condition Yellow' title='Revision is probably " +
  "stable, but may contain some bugs' src='yellow.png'>"],
 ["red",
  "<br><img alt='Condition Red' title='Build is known or expected to " +
  "contain some possibly large bugs' src='red.png'>"]
 ];

function writeMostRecent()
{
    var green;
    
    for (var i in revs)
    {
        if (revs[i].condition == G)
        {
            green = revs[i];
            break;
        }
    }
    
    document.write("Most recent stable version is <a href='#" + green.id +
                   "'>" + green.id + "</a>.");
}

function writeByDate(maxDelta)
{
    var today = new Date();
    var count = 0;
    var wroteGreen = false;
    
    calculateCumulativeBugs(revs);
    
    for (var i in revs)
    {
        var d = new Date(revs[i].date);
        if (today - d < maxDelta)
        {
            writeRev(revs[i]);
            ++count;
            if (revs[i].condition == G)
                wroteGreen = true;
        }
        else
        {            
            if (!count || !wroteGreen)
            {
                /* Rather than show nothing when there is nothing new, we
                 * write out everything up to (and including) the first green
                 * revision.
                 */
                writeRev(revs[i]);
                if (revs[i].condition == G)
                    break;
            }
            else
            {
                break;
            }
        }
    }
}

    
function writeRevs ()
{
    calculateCumulativeBugs(revs);
    
    for (var i in revs)
        writeRev(revs[i]);
}

function writeRev(rev)
{
    var id;

    if (!("condition" in rev))
        rev.condition = Y;
        
    var cond = conditions[rev.condition];
        
    id = rev.id;
    document.writeln("<tr class='" + cond[0] + "'>");
    document.writeln("<td class='rev'>cz" + id + "<br>" +
                     rev.date);
    document.writeln(cond[1]);
    document.writeln("</td>");
            
    document.writeln ("<td class='desc'>" +
                      "<a name='" + rev.id + "'></a>" +
                      "Revision " + id + " " + rev.desc);

    if (rev.bugsCumulative || rev.bugs)
       document.write("<p class='bugs'>");
    
    if (rev.bugsCumulative)
    {
        document.write(" [<a href='" +
                       "http://bugzilla.mozilla.org/buglist.cgi?bug_id=" + 
                       rev.bugsCumulative.sort().join(",") + "' title='List of bugs " +
                       "fixed since last green release''>" + 
                       rev.bugsCumulative.length + " cumulative fixed bug(s)</a>]");
    }
    
    if (rev.bugs)
    {
        document.write(" [<a href='" +
                       "http://bugzilla.mozilla.org/buglist.cgi?bug_id=" + 
                       rev.bugs.sort().join(",") + "'>" + 
                       rev.bugs.length + " fixed bug(s)</a>]");
    }

    document.writeln ("</td>");
    
    document.writeln ("<td class='dnld'><a href='xpi/chatzilla-" + id +
                      ".xpi'>" + "install " + id + "</a></td>");
    
    document.writeln ("</tr>");
}

function calculateCumulativeBugs(revs)
{
    var cumulative;
    
    for (var i = revs.length - 1; i >= 0; i--)
    {
        if (!("bugs" in revs[i]))
            revs[i].bugs = [];
        if (!("condition" in revs[i]))
            revs[i].condition = G;
        revs[i].bugsCumulative = null;
        if (revs[i].condition == G)
        {
            cumulative = new Object();
        }
        else
        {
            if (revs[i].bugs)
            {
                for (var b = 0; b < revs[i].bugs.length; b++)
                    cumulative[revs[i].bugs[b]] = 1;
                if (keys(cumulative).length > revs[i].bugs.length)
                    revs[i].bugsCumulative = keys(cumulative);
            }
        }
    }
}

function keys(o) {
    var rv = new Array();
    for (var p in o)
        rv.push(p);
    return rv;
}
