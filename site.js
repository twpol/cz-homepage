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
 * The Original Code is hacksrus.com/~ginda website
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

var FAQ = ["faq/chatzilla-faq.html", "FAQ"];
var DOCS = ["faq/chatzilla-faq.html#moredocs", "Documentation"];
var SHOTS = ["screenshots/?M=D", "Screenshots"];
var MOTIFS = ["motifs.html", "Motifs"];
var IRC = ["faq/chatzilla-faq.html#irc", "IRC Channel"];
var DONATE = ["donate.html", "Donate"];
var RELEASES = ["revs.html", "Revision History"];
var HOME = ["index.html", "ChatZilla Home"];

var defaultMenu = [HOME, SHOTS, MOTIFS, RELEASES, FAQ, DOCS, IRC, DONATE];

var pages =
    {
        "index.html": {
            title: "ChatZilla!",
            toplevel: ""
        },
        
        "oldnews.html": {
            title: "Older News",
            toplevel: ""
        },
        
        "revs.html": {
            title: "Revision History",
            toplevel: ""
        },

        "motifs.html": {
            title: "Motifs",
            toplevel: ""
        },

        "donate.html": {
            title: "Donations",
            toplevel: ""
        },

        "chatzilla-faq.html": {
            title: "ChatZilla Frequently Asked Questions",
            toplevel: "../"
        }
    };

var fileName = getCurrentFileName();

var header =
"<table id='page' cellspacing='0' cellpadding='0'>" +
"  <tr>" +
"    <td id='header' colspan='2'>" +
"      <div id='title'>$title</div>" +
"      $menu" +
"    </td>" +
"  </tr>" +
"  <tr>" +
"    <td id='body' height='100%' valign='top' colspan='2'>";

var footer =
"    </td>" +
"  </tr>" +
"  <tr id='footer'>" +
"    <td>" +
"      Want to make a " +
"      <a href='http://www.hacksrus.com/~ginda/chatzilla/donate.html'>" +
"      Donation</a>?" +
"    </td>" +
"    <td nowrap align='right'>" +
"      <div>" +
"      Hosting services provided by <a href='http://omnistep.com/main.html'>OmniStep, Inc.</a>"
"      </div>"
"    </td>" +
"  </tr>" +
"</table>";

function getCurrentFileName()
{
    var pos = document.location.pathname.lastIndexOf("/");
    var filename = document.location.pathname.substr(pos + 1);
    if (!filename)
        return "index.html";
    
    return filename;
}

function writeHeader()
{
    var page = pages[fileName];
    
    var output = header.replace("$title", page.title);
    output = output.replace("$menu", getMenu(page));

    document.write(output);
}

function writeFooter()
{
    document.write(footer);
}

function getMenu(page)
{
    var menu = ("menu" in page) ? page.menu : defaultMenu;
    var str = "<div id='menu'>[ ";
    for (var i = 0; i < menu.length; ++i)
    {
        var url = page.toplevel + menu[i][0];
        var desc = menu[i][1];
        if (url != fileName)
            str += "<a href='" + url + "'>" + desc + "</a>";
        else
            str += "<span class='currentpage'>" + desc + "</span>";
        
        if (i != menu.length - 1)
            str += " | ";
    }

    str += " ]</div>";
    return str;
}

