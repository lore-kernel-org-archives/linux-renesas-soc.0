Return-Path: <>
From: Adnan Ali <adnan.ali@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, batareich batareich <vladimir.barinov@cogentembedded.com>, Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Subject: [V2]Fix RCAR-V3H SoC wrong IPSR9/10 registers
Date: Thu, 09 Aug 2018 08:10:43 +0000
Message-ID: <TYAPR01MB206446052847E74261A2F116DA250@TYAPR01MB2064.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/mixed; boundary="_004_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_"
MIME-Version: 1.0
Resent-Message-ID: <201808091152.44473.>
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <linux-renesas-soc.vger.kernel.org>

 
--_004_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_
Content-Type: multipart/alternative; boundary="_000_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_"

--_000_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Please review this V2 patch. This patch belongs to branch from elinux.org f=
or V3H condor.

Regards
Adnan



Renesas Electronics Europe GmbH,Geschaeftsfuehrer/President : Michael Hanna=
wald, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse =
10, 40472 Duesseldorf, Germany,Handelsregister/Commercial Register: Duessel=
dorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr.=
/WEEE reg. no.: DE 14978647

--_000_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please review this V2 patch. Th=
is patch belongs to branch from elinux.org for V3H condor.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Adnan<o:p></o:p></span></p>
</div>
<br>
<br>
<div></div>
<p style=3D"font-size:8pt;">Renesas Electronics Europe GmbH,Geschaeftsfuehr=
er/President : Michael Hannawald, Sitz der Gesellschaft/Registered office: =
Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany,Handelsregister/=
Commercial Register: Duesseldorf,
 HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE=
 reg. no.: DE 14978647
</p>
</body>
</html>

--_000_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_--

--_004_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_
Content-Type: application/octet-stream; name="0001-sh-pfc-pfc-r8a7798.c-Fix-RCAR-V3H-condor-wrong-IPSR9.patch"
Content-Description: 0001-sh-pfc-pfc-r8a7798.c-Fix-RCAR-V3H-condor-wrong-IPSR9.patch
Content-Disposition: attachment; creation-date="Thu, 09 Aug 2018 07:46:33 GMT"; filename="0001-sh-pfc-pfc-r8a7798.c-Fix-RCAR-V3H-condor-wrong-IPSR9.patch"; modification-date="Wed, 08 Aug 2018 12:44:31 GMT"; size="1284"
Content-Transfer-Encoding: base64

RnJvbSBlM2JkZWQ2MjUyZDBmYTcxZmZhOWM2ZTE1ZGFiMjE5NGQzNWFhNTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZG5hbiBBbGkgPGFkbmFuLmFsaUBicC5yZW5lc2FzLmNvbT4K
RGF0ZTogV2VkLCA4IEF1ZyAyMDE4IDEzOjE0OjQ3ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gc2gt
cGZjL3BmYy1yOGE3Nzk4LmMgRml4IFJDQVItVjNIIGNvbmRvciB3cm9uZyBJUFNSOS8xMCByZWcK
IHNldHRpbmdzCgpTaWduZWQtb2ZmLWJ5OiBBZG5hbiBBbGkgPGFkbmFuLmFsaUBicC5yZW5lc2Fz
LmNvbT4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvc2gtcGZjL3BmYy1yOGE3Nzk4LmMgfCAzMiArKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9zaC1w
ZmMvcGZjLXI4YTc3OTguYyBiL2RyaXZlcnMvcGluY3RybC9zaC1wZmMvcGZjLXI4YTc3OTguYwpp
bmRleCBmNmYxNTllLi4zZTJjZmQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvc2gtcGZj
L3BmYy1yOGE3Nzk4LmMKKysrIGIvZHJpdmVycy9waW5jdHJsL3NoLXBmYy9wZmMtcjhhNzc5OC5j
CkBAIC0zMTIyLDI0ICszMTIyLDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGlubXV4X2NmZ19y
ZWcgcGlubXV4X2NvbmZpZ19yZWdzW10gPSB7CiAJCUlQOF8zXzAgfQogCX0sCiAJeyBQSU5NVVhf
Q0ZHX1JFRygiSVBTUjkiLCAweGU2MDYwMjI0LCAzMiwgNCkgewotCQlJUDhfMzFfMjgKLQkJSVA4
XzI3XzI0Ci0JCUlQOF8yM18yMAotCQlJUDhfMTlfMTYKLQkJSVA4XzE1XzEyCi0JCUlQOF8xMV84
Ci0JCUlQOF83XzQKLQkJSVA4XzNfMCB9CisJCUlQOV8zMV8yOAorCQlJUDlfMjdfMjQKKwkJSVA5
XzIzXzIwCisJCUlQOV8xOV8xNgorCQlJUDlfMTVfMTIKKwkJSVA5XzExXzgKKwkJSVA5XzdfNAor
CQlJUDlfM18wIH0KIAl9LAogCXsgUElOTVVYX0NGR19SRUcoIklQU1IxMCIsIDB4ZTYwNjAyMjgs
IDMyLCA0KSB7Ci0JCUlQOF8zMV8yOAotCQlJUDhfMjdfMjQKLQkJSVA4XzIzXzIwCi0JCUlQOF8x
OV8xNgotCQlJUDhfMTVfMTIKLQkJSVA4XzExXzgKLQkJSVA4XzdfNAotCQlJUDhfM18wIH0KKwkJ
SVAxMF8zMV8yOAorCQlJUDEwXzI3XzI0CisJCUlQMTBfMjNfMjAKKwkJSVAxMF8xOV8xNgorCQlJ
UDEwXzE1XzEyCisJCUlQMTBfMTFfOAorCQlJUDEwXzdfNAorCQlJUDEwXzNfMCB9CiAJfSwKICN1
bmRlZiBGXwogI3VuZGVmIEZNCi0tIAoyLjcuNAoK

--_004_TYAPR01MB206446052847E74261A2F116DA250TYAPR01MB2064jpnp_--
