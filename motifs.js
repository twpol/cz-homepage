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

var motifs = {
    "output-bluemoz": "Basic dark motif, plus mozilla background image.",
    "output-default": "Browser default colors.",
    "output-default-faces": "Browser default colors, moznet faces.",
    "output-default-larger": "Browser default colors, larger fonts.",
    "output-default-monospace": "Browser default colors, monospace fonts.",

    "output-dark": "Dark background, light text.",
    "output-dark-faces": "Dark background, light text, moznet faces.",
    "output-dark-larger": "Dark background, light text, larger fonts.",
    "output-dark-monospace": "Dark background, light text, monospace fonts.",

    "output-light": "Light background, dark text.",
    "output-light-faces": "Light background, dark text, moznet faces.",
    "output-light-larger": "Light background, dark text, larger fonts.",
    "output-light-monospace": "Light background, dark text, monospace fonts.",

    "output-lz": "A bright white, orange and blue themed motif, by Fergus Kelley.",
    "output-mullusko": "Light background, makes it slightly easier to see " +
                       "who is saying what.",
    "output-redmoz": "Red and orange, mozilla star in background.",
    "output-silver": "Variation on light motif.",
    "output-silver-gecko": "Variation on light motif, with gecko background image.",
    "output-sunshine": "A yellow motif made to match the new emoticons in ChatZilla, by Robin M.",
    "output-bug-triage": "A theme to put you in the mood for bugday, by Robin M.",
    "output-summer-sky": "A theme to reflect on the days of bygone summers.  Includes matching emoticons, by Robin M.",
    "output-trioptimum": "A Trioptimum (from <a href='http://www.sshock2.com/'>System Shock</a>) theme, by <a href='http://www.strangebedfellows.schwarzsilber.de/index.php?topic=66.msg124#msg124'>Kolya</a>.",
    "output-bliss": "A deep blue and green motif, with plenty of other colours, by Robin M."
}

function writeMotifs()
{
    var i = 0;
    var even = true;
    
    for (var name in motifs)
    {
        if (i == 2)
        {
            i = 0;
            even = !even;
        }
        i += 1;        
        
        document.write("<span class='motif' even='" + even +
                       "'><span class='motif-name'>" + 
                       name + "</span> " +

                       "<span class='motif-desc'>" + motifs[name] + "</span> " +

                       "<span class='motif-links'>" +
                       "[ <a href='javascript:tryMotif(\"" + name + "\")'>" + 
                       "preview</a> | <a href='motifs/" + name +
                       ".css'>css</a> ]" +
                       "</span>" +
                       "</span>");
    }
}

function tryMotif(name)
{
    var frame = document.getElementById("log");
    if (frame.hasAttribute("needinit"))
    {
        frame.setAttribute("src", "log.html?motifs/" + name + ".css");
        frame.removeAttribute("needinit");
    }
    else
    {
        var link = frame.contentDocument.getElementById("motif");
        link.setAttribute("href", "motifs/" + name + ".css");
    }
}
