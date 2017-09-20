Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:60299 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751902AbdITLRw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 07:17:52 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        David Donegan <david.donegan@renesas.com>
Subject: kms-tests
Date: Wed, 20 Sep 2017 11:17:47 +0000
Message-ID: <TY1PR06MB089595CDA217CE15B98BE386C0610@TY1PR06MB0895.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/mixed;
        boundary="_002_TY1PR06MB089595CDA217CE15B98BE386C0610TY1PR06MB0895apcp_"
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--_002_TY1PR06MB089595CDA217CE15B98BE386C0610TY1PR06MB0895apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

I hope you are well.
I am looking into adding display support to the iWave RainboW-G22D-SODIMM b=
oard based on RZ/G1E.
My understanding is that the DU tests mentioned here:
http://elinux.org/R-Car/Devices
should work for such a platform too, therefore I am starting to play with:
git://git.ideasonboard.com/renesas/kms-tests.git

Going through the REAME file in kms-tests.git, the following URLs won't wor=
k for me:
git://git.ideasonboard.com/renesas/du-tests.git
http://git.ideasonboard.com/renesas/du-tests.git
According to the README file, running " make install INSTALL_DIR=3D/path/to=
/target/directory" should install the scripts, but unfortunately it doesn't=
 work for me. I have hacked file tests/Makefile according to the attached p=
atch file to make it do that.

Going through the tests, here is what I get:

# ./kms-test-allplanes.py
Testing composition on CRTC 25: Traceback (most recent call last):
  File "./kms-test-allplanes.py", line 83, in <module>
    AllPlanesTest().execute()
  File "/opt/kms-tests/kmstest.py", line 269, in execute
    self.main()
  File "./kms-test-allplanes.py", line 54, in main
    ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
  File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
    return req.commit(self, True)
TypeError: Incompatible function arguments. The following argument types ar=
e supported:
    1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : boo=
l =3D False) -> int

# ./kms-test-connectors.py
Testing connector Component-1: SUCCESS

# ./kms-test-modes.py
Testing modes on connector Component-1: 1/1Traceback (most recent call last=
):
  File "./kms-test-modes.py", line 65, in <module>
    ModesTest().execute()
  File "/opt/kms-tests/kmstest.py", line 269, in execute
    self.main()
  File "./kms-test-modes.py", line 58, in main
    self.test_mode(connector, crtc, modes[i])
  File "./kms-test-modes.py", line 21, in test_mode
    ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
  File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
    return req.commit(self, True)
TypeError: Incompatible function arguments. The following argument types ar=
e supported:
    1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : boo=
l =3D False) -> int

# ./kms-test-modeset.py
Testing atomic mode set on connector Component-1: Traceback (most recent ca=
ll last):
  File "./kms-test-modeset.py", line 58, in <module>
    ModeSetTest().execute()
  File "/opt/kms-tests/kmstest.py", line 269, in execute
    self.main()
  File "./kms-test-modeset.py", line 45, in main
    ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
  File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
    return req.commit(self, True)
TypeError: Incompatible function arguments. The following argument types ar=
e supported:
    1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : boo=
l =3D False) -> int

# ./kms-test-pageflip.py
Testing page flip on connector Component-1: Traceback (most recent call las=
t):
  File "./kms-test-pageflip.py", line 118, in <module>
    PageFlipTest().execute()
  File "/opt/kms-tests/kmstest.py", line 269, in execute
    self.main()
  File "./kms-test-pageflip.py", line 87, in main
    ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, self.fbs[0])
  File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
    return req.commit(self, True)
TypeError: Incompatible function arguments. The following argument types ar=
e supported:
    1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : boo=
l =3D False) -> int

# ./kms-test-planeposition.py
Testing plane positioning boundaries: FAIL
# cat PlanePositionTest.log
U [117.468550] Testing plane positioning boundaries
U [117.469654] Testing connector Component-1, CRTC 25, mode 480x288 with 4 =
planes
U [117.513061] Initial atomic mode set completed
U [122.526693] Root plane enabled
U [125.532964] Moved overlay plane to 50,50
U [128.537430] Moved overlay plane to 150,50
U [131.541865] Moved overlay plane to 50,150
U [134.546234] Moved overlay plane to -50,50
U [137.550654] Moved overlay plane to 50,-50
U [140.555092] Test failed. Reason: atomic plane set with invalid offset 48=
0,50 accepted

I haven't looked into the tests implementation just yet, but maybe I am doi=
ng something wrong therefore I wanted to check with you first, is my enviro=
nment/system "sane" you think or there is something wrong with it?
The system is running kernel 4.4.6 at the moment.

Thanks,
Fabrizio



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.

--_002_TY1PR06MB089595CDA217CE15B98BE386C0610TY1PR06MB0895apcp_
Content-Type: application/octet-stream; name="0001-Fix-install-task.patch"
Content-Description: 0001-Fix-install-task.patch
Content-Disposition: attachment; filename="0001-Fix-install-task.patch";
	size=480; creation-date="Wed, 20 Sep 2017 10:51:46 GMT";
	modification-date="Wed, 20 Sep 2017 10:51:29 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlNjRhMzE5MTU5NjdjMDlkZjUxMGQ0YmFjMjFlMzkxYmZhZmUwY2VhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4KRGF0ZTogVHVlLCAxOSBTZXAgMjAxNyAxNDoxMzoyMyArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIEZpeCBpbnN0YWxsIHRhc2sKCi0tLQogdGVzdHMvTWFrZWZpbGUgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90ZXN0cy9NYWtlZmlsZSBiL3Rlc3RzL01ha2VmaWxlCmluZGV4IDY1ODZiMjkuLjUyMTc2MWEg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL01ha2VmaWxlCisrKyBiL3Rlc3RzL01ha2VmaWxlCkBAIC0xLDQg
KzEsNCBAQAotU0NSSVBUUz0kKHdpbGRjYXJkICouc2gpCitTQ1JJUFRTPSQod2lsZGNhcmQgKi5w
eSkKIAogYWxsOgogCi0tIAoxLjkuMQoK

--_002_TY1PR06MB089595CDA217CE15B98BE386C0610TY1PR06MB0895apcp_--
