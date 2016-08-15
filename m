Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0136.outbound.protection.outlook.com ([104.47.2.136]:23744
	"EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752768AbcHOLxo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 07:53:44 -0400
From: "Baumann, Christoph (C.)" <cbaumann@visteon.com>
To: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] sh-sci: fix transition from noflow to HW flow control
Date: Mon, 15 Aug 2016 11:20:57 +0000
Message-ID: <HE1PR0601MB268306974695DFE9C0C9D0B0D0120@HE1PR0601MB2683.eurprd06.prod.outlook.com>
Content-Language: de-DE
Content-Type: multipart/mixed;
	boundary="_002_HE1PR0601MB268306974695DFE9C0C9D0B0D0120HE1PR0601MB2683_"
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--_002_HE1PR0601MB268306974695DFE9C0C9D0B0D0120HE1PR0601MB2683_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

working on getting RTS/CTS run on r8a7795 I had some annoying issues.
Measuring with a scope showed that RTS would become low on opening the tty =
device (regardless of having CRTSCTS set or not). So far this is expected.
But if I used tcsetattr() to set/unset the CRTSCTS flag the RTS pin would b=
ecome hi and stayed so.
I then looked into the sh-sci driver and added some debug output.
My analysis was that upon opening the tty device the functions set_termios =
and set_mctrl are called.
In the sh-sci driver the set_mctrl function is the only place where the int=
ernal 'autorts' flag is actually written to a register.
As obviously the RTSCTS flow control flag can only be set after the device =
is opened, the flag isn't propagated to the corresponding register.
To make it more confusing the flag is kept in .c_cflag even after closing t=
he device and is then taken care of the next time the device is opened agai=
n.
To fix this I set the bit in set_termios after the line where it was previo=
usly only stored in the bool variable 'autorts' (see attachment).



Regards,
Christoph

--_002_HE1PR0601MB268306974695DFE9C0C9D0B0D0120HE1PR0601MB2683_
Content-Type: application/octet-stream; name="sh-sci_fix_RTSCTS_init.patch"
Content-Description: sh-sci_fix_RTSCTS_init.patch
Content-Disposition: attachment; filename="sh-sci_fix_RTSCTS_init.patch";
	size=1266; creation-date="Mon, 15 Aug 2016 08:11:23 GMT";
	modification-date="Mon, 15 Aug 2016 08:11:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlOWRhMjkwZTQxMjAzMTdjOGE3Mzc2YmIzNzVlMjE2NjgwNGY0YjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpc3RvcGggQmF1bWFubiA8Y2JhdW1hbm5AdmlzdGVvbi5j
b20+CkRhdGU6IEZyaSwgMTIgQXVnIDIwMTYgMTY6NTg6MzkgKzAyMDAKU3ViamVjdDogW1BBVENI
XSBmaXggbm9mbG93LT5mbG93IChSVFMvQ1RTKSB0cmFuc2l0aW9uCgotLS0KIGRyaXZlcnMvdHR5
L3NlcmlhbC9zaC1zY2kuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gt
c2NpLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMKaW5kZXggYjk4MWZjYS4uZWVhOGUx
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jCisrKyBiL2RyaXZlcnMv
dHR5L3NlcmlhbC9zaC1zY2kuYwpAQCAtMTg4Myw4ICsxODgzLDkgQEAgc3RhdGljIHZvaWQgc2Np
X3NldF9tY3RybChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCB1bnNpZ25lZCBpbnQgbWN0cmwpCiAK
IAltY3RybF9ncGlvX3NldChzLT5ncGlvcywgbWN0cmwpOwogCi0JaWYgKCEocy0+Y2ZnLT5jYXBh
YmlsaXRpZXMgJiBTQ0l4X0hBVkVfUlRTQ1RTKSkKKwlpZiAoIShzLT5jZmctPmNhcGFiaWxpdGll
cyAmIFNDSXhfSEFWRV9SVFNDVFMpKSB7CiAJCXJldHVybjsKKwl9CiAKIAlpZiAoIShtY3RybCAm
IFRJT0NNX1JUUykpIHsKIAkJLyogRGlzYWJsZSBBdXRvIFJUUyAqLwpAQCAtMjMyOCw3ICsyMzI5
LDcgQEAgZG9uZToKIAlzLT5hdXRvcnRzID0gZmFsc2U7CiAJcmVnID0gc2NpX2dldHJlZyhwb3J0
LCBTQ0ZDUik7CiAJaWYgKHJlZy0+c2l6ZSkgewotCQl1bnNpZ25lZCBzaG9ydCBjdHJsID0gc2Vy
aWFsX3BvcnRfaW4ocG9ydCwgU0NGQ1IpOworCQl1MTYgY3RybCA9IHNlcmlhbF9wb3J0X2luKHBv
cnQsIFNDRkNSKTsKIAogCQlpZiAoKHBvcnQtPmZsYWdzICYgVVBGX0hBUkRfRkxPVykgJiYKIAkJ
ICAgICh0ZXJtaW9zLT5jX2NmbGFnICYgQ1JUU0NUUykpIHsKQEAgLTIzMzYsNiArMjMzNyw4IEBA
IGRvbmU6CiAJCQlwb3J0LT5zdGF0dXMgfD0gVVBTVEFUX0FVVE9DVFM7CiAJCQkvKiBNQ0UgaXMg
ZW5hYmxlZCB3aGVuIFJUUyBpcyByYWlzZWQgKi8KIAkJCXMtPmF1dG9ydHMgPSB0cnVlOworCQkJ
Y3RybCB8PSBTQ0ZDUl9NQ0U7CisJCQlzY2lfc2V0X3J0cyhwb3J0LCAxKTsKIAkJfQogCiAJCS8q
Ci0tIAoyLjkuMwoK

--_002_HE1PR0601MB268306974695DFE9C0C9D0B0D0120HE1PR0601MB2683_--
