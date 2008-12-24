function getQueryParam(name) {
	// Split the query into all the name=value pairs.
	var parts = String(document.location.search.substr(1)).split("&");
	
	// This RegExp will match name=value pairs and extract their name and 
	// value separately.
	var re = new RegExp("^([^=]*)=(.*)$");
	
	for (var i = 0; i < parts.length; i++) {
		var ary = parts[i].match(re);
		if (ary) {
			// We matched /name=value/, so we now need to unescape the value.
			if (ary[1] == name) {
				return URLUnescape(ary[2]);
			}
		} else {
			// If we didn't match /name=value/, we take it as /name/ and
			// give it the value 1. This allows for boolean params which are
			// either present or not.
			if (parts[1] == name) {
				return true;
			}
		}
	}
	return null;
}

//// UTF-8 and URL encoding/decoding code ////

function UnicodeToUTF8(val) {
	// Manual Unicode -> UTF-8 encoding, followed by manual byte -> encoded
	// bytes. Never trust the browser when it comes to character encoding.
	
	function utf8enc(character) {
		var code = character.charCodeAt(0);
		if (code < 0x00000080) {
			return String.fromCharCode(0x00 |  (code & 0x0000007F))
		}
		if (code < 0x00000800) {
			return String.fromCharCode(0xC0 | ((code & 0x000007C0) >>  6))
			     + String.fromCharCode(0x80 |  (code & 0x0000003F));
		}
		if (code < 0x00010000) {
			return String.fromCharCode(0xE0 | ((code & 0x0000F000) >> 12))
			     + String.fromCharCode(0x80 | ((code & 0x00000FC0) >>  6))
			     + String.fromCharCode(0x80 |  (code & 0x0000003F));
		}
		if (code < 0x00110000) {
			return String.fromCharCode(0xF0 | ((code & 0x001C0000) >> 18))
			     + String.fromCharCode(0x80 | ((code & 0x0003F000) >> 12))
			     + String.fromCharCode(0x80 | ((code & 0x00000FC0) >>  6))
			     + String.fromCharCode(0x80 |  (code & 0x0000003F));
		}
		// Invalid!
		return character;
	};
	
	return String(val).replace(/[^\x00-\x7F]/g, utf8enc);
}

function UTF8ToUnicode(val) {
	function utf8dec(string) {
		var code1 = string.charCodeAt(0);
		var elen = ((code1 & 0xF8) == 0xF0 ? 4 :
		           ((code1 & 0xF0) == 0xE0 ? 3 :
		           ((code1 & 0xE0) == 0xC0 ? 2 : 0)));
		// Invalid UTF-8! Treat as ISO8859-1 or something.
		if (elen != string.length) return string;
		var code2 = string.charCodeAt(1);
		if ((code2 & 0xC0) != 0x80) return string;
		if (elen == 2) {
			return String.fromCharCode(((code1 & 0x1F) << 6) + (code2 & 0x3F));
		}
		var code3 = string.charCodeAt(2);
		if ((code3 & 0xC0) != 0x80) return string;
		if (elen == 3) {
			return String.fromCharCode(((code1 & 0x0F) << 12) + ((code2 & 0x3F) << 6) + (code3 & 0x3F));
		}
		var code4 = string.charCodeAt(3);
		if ((code4 & 0xC0) != 0x80) return string;
		if (elen == 4) {
			return String.fromCharCode(((code1 & 0x03) << 18) + ((code2 & 0x3F) << 12) + ((code3 & 0x3F) << 6) + (code4 & 0x3F));
		}
		return string;
	};
	
	return String(val).replace(/[\xC2-\xF4][\x80-\xBF]*/g, utf8dec);
}

function URLEscape(val) {
	function urlenc(character) {
		var code = character.charCodeAt(0);
		var hex = "0123456789ABCDEF";
		return "%" + hex.charAt(code >> 4) + hex.charAt(code & 0x0F);
	};
	
	return UnicodeToUTF8(String(val)).replace(/[^-_.~!\*\'\(\);:@&=+$,\/\?\%\#\[\]A-Za-z0-9]/g, urlenc);
}

function URLUnescape(val) {
	function urldec(match, hex) {
		return String.fromCharCode(parseInt(hex, 16));
	};
	
	return UTF8ToUnicode(String(val).replace(/\+/g, " ").replace(/%([0-9a-f][0-9a-f])/gi, urldec));
}
