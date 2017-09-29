Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:58498 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751224AbdI2NvH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 09:51:07 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: kms-tests
Date: Fri, 29 Sep 2017 13:51:01 +0000
Message-ID: <TY1PR06MB0895979D15CBD4626FAC553FC07E0@TY1PR06MB0895.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/mixed;
        boundary="_002_TY1PR06MB0895979D15CBD4626FAC553FC07E0TY1PR06MB0895apcp_"
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--_002_TY1PR06MB0895979D15CBD4626FAC553FC07E0TY1PR06MB0895apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

I moved to an RZ/G1M based platform now. I am running the latest kernel wit=
h patches made by me to add support for r8a7743 DU.
In user space I have libdrm version 2.4.65, kmsxx commit 95de32aa7fbb1a2da5=
47418b296f649ee4be1feb, and the latest version of your tests.
I have patched your tests (see attachment, you might want to apply this pat=
ch too...) and they now run without throwing exceptions, but some of them f=
ail. Here is what I get:

# ./kms-test-allplanes.py
Testing composition on CRTC 45: FAIL
Testing composition on CRTC 46: FAIL
# cat AllPlanesTest.log
U [93.632468] Testing composition on CRTC 45
U [93.632876] Testing connector HDMI-A-1, CRTC 45, mode 1920x1080 with 8 pl=
anes
U [93.742849] Page flip complete
U [96.750507] Adding plane 30
U [96.764626] Page flip complete
U [97.770395] Adding plane 31
U [97.777833] Page flip complete
U [98.780461] Adding plane 33
U [98.791078] Page flip complete
U [99.800406] Adding plane 35
U [99.804292] Page flip complete
U [100.810348] Adding plane 37
U [100.817506] Page flip complete
U [101.820341] Adding plane 39
U [101.830734] Page flip complete
U [102.840333] Adding plane 41
U [102.843963] Page flip complete
U [103.850404] Test failed. Reason: atomic plane set failed with -16
U [103.859251] Testing composition on CRTC 46
U [103.859555] Testing connector HDMI-A-1, CRTC 46, mode 1920x1080 with 8 p=
lanes
U [103.976393] Test failed. Reason: atomic mode set failed with -22
# ./kms-test-connectors.py
Testing connector HDMI-A-1: SUCCESS
root@skrzg1m:/opt/kms-tests# ./kms-test-modes.py
Testing modes on connector HDMI-A-1: FAIL
# cat ModesTest.log
U [129.438752] Testing modes on connector HDMI-A-1
U [129.439202] Testing connector HDMI-A-1 on CRTC 45 with mode 1920x1080
U [129.542524] Atomic mode set complete
U [129.555120] Page flip complete
U [133.573745] Testing connector HDMI-A-1 on CRTC 45 with mode 1920x1080
U [133.677254] Test failed. Reason: atomic mode set failed with -22
# ./kms-test-modeset.py
Testing atomic mode set on connector HDMI-A-1: SUCCESS
# ./kms-test-pageflip.py
Testing page flip on connector HDMI-A-1: SUCCESS
# ./kms-test-planeposition.py
Testing plane positioning boundaries: FAIL
# cat PlanePositionTest.log
U [200.629998] Testing plane positioning boundaries
U [200.630468] Testing connector HDMI-A-1, CRTC 45, mode 1920x1080 with 9 p=
lanes
U [200.738781] Initial atomic mode set completed
U [205.751576] Root plane enabled
U [208.773490] Moved overlay plane to 50,50
U [211.795392] Moved overlay plane to 150,50
U [214.817314] Moved overlay plane to 50,150
U [217.821449] Moved overlay plane to -50,50
U [220.843378] Moved overlay plane to 50,-50
U [223.865305] Test failed. Reason: atomic plane set with invalid offset 19=
20,50 accepted

and here is what modetest dumps:
# modetest -M rcar-du
Encoders:
id      crtc    type    possible crtcs  possible clones
47      45      none    0x00000003      0x00000001

Connectors:
id      encoder status          name            size (mm)       modes   enc=
oders
48      47      connected       HDMI-A-1        520x320         27      47
  modes:
        name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  1920x1080 60 1920 1968 2000 2080 1080 1082 1087 1111 flags: phsync, nvsyn=
c; type: preferred, driver
  1920x1080 60 1920 2008 2052 2200 1080 1084 1089 1125 flags: phsync, pvsyn=
c; type: driver
  1920x1080 60 1920 2008 2052 2200 1080 1084 1089 1125 flags: phsync, pvsyn=
c; type: driver
  1280x1024 75 1280 1296 1440 1688 1024 1025 1028 1066 flags: phsync, pvsyn=
c; type: driver
  1280x1024 60 1280 1328 1440 1688 1024 1025 1028 1066 flags: phsync, pvsyn=
c; type: driver
  1152x864 75 1152 1216 1344 1600 864 865 868 900 flags: phsync, pvsync; ty=
pe: driver
  1280x720 60 1280 1390 1430 1650 720 725 730 750 flags: phsync, pvsync; ty=
pe: driver
  1280x720 60 1280 1390 1430 1650 720 725 730 750 flags: phsync, pvsync; ty=
pe: driver
  1280x720 50 1280 1720 1760 1980 720 725 730 750 flags: phsync, pvsync; ty=
pe: driver
  1024x768 75 1024 1040 1136 1312 768 769 772 800 flags: phsync, pvsync; ty=
pe: driver
  1024x768 70 1024 1048 1184 1328 768 771 777 806 flags: nhsync, nvsync; ty=
pe: driver
  1024x768 60 1024 1048 1184 1344 768 771 777 806 flags: nhsync, nvsync; ty=
pe: driver
  1080x607 60 1080 1120 1232 1384 607 608 611 629 flags: nhsync, pvsync; ty=
pe:
  832x624 75 832 864 928 1152 624 625 628 667 flags: nhsync, nvsync; type: =
driver
  800x600 75 800 816 896 1056 600 601 604 625 flags: phsync, pvsync; type: =
driver
  800x600 72 800 856 976 1040 600 637 643 666 flags: phsync, pvsync; type: =
driver
  800x600 60 800 840 968 1056 600 601 605 628 flags: phsync, pvsync; type: =
driver
  800x600 56 800 824 896 1024 600 601 603 625 flags: phsync, pvsync; type: =
driver
  720x576 50 720 732 796 864 576 581 586 625 flags: nhsync, nvsync; type: d=
river
  720x480 60 720 736 798 858 480 489 495 525 flags: nhsync, nvsync; type: d=
river
  720x480 60 720 736 798 858 480 489 495 525 flags: nhsync, nvsync; type: d=
river
  640x480 75 640 656 720 840 480 481 484 500 flags: nhsync, nvsync; type: d=
river
  640x480 73 640 664 704 832 480 489 492 520 flags: nhsync, nvsync; type: d=
river
  640x480 67 640 704 768 864 480 483 486 525 flags: nhsync, nvsync; type: d=
river
  640x480 60 640 656 752 800 480 490 492 525 flags: nhsync, nvsync; type: d=
river
  640x480 60 640 656 752 800 480 490 492 525 flags: nhsync, nvsync; type: d=
river
  720x400 70 720 738 846 900 400 412 414 449 flags: nhsync, pvsync; type: d=
river
  props:
        1 EDID:
                flags: immutable blob
                blobs:

                value:
                        00ffffffffffff003683832410101010
                        1416010380342078eeb725ac5130b426
                        105054bfef8068c0714f818001010101
                        010101010101e83580a070381f403020
                        250044682100001a000000ff00303031
                        30310a20202020202020000000fc0048
                        444d490a2020202020202020000000fd
                        00384c1e5317000a20202020202001cf
                        02031a71471003140513841223090707
                        8301000065030c0010008c0ad0902040
                        31200c40550036d431000018011d8018
                        711c1620582c250036d43100009e011d
                        80d0721c1620102c258036d43100009e
                        011d00bc52d01e20b828554036d43100
                        001ef339801871382d40582c4500c48e
                        2100001e000000000000000000000054
        2 DPMS:
                flags: enum
                enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
                value: 0
        5 link-status:
                flags: enum
                enums: Good=3D0 Bad=3D1
                value: 0

CRTCs:
id      fb      pos     size
45      53      (0,0)   (1920x1080)
  1920x1080 60 1920 1968 2000 2080 1080 1082 1087 1111 flags: phsync, nvsyn=
c; type: preferred, driver
  props:
46      0       (0,0)   (0x0)
   0 0 0 0 0 0 0 0 0 flags: ; type:
  props:

Planes:
id      crtc    fb      CRTC x,y        x,y     gamma size      possible cr=
tcs
29      45      53      0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 1
30      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 1
31      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        32 zpos:
                flags: range
                values: 1 7
                value: 1
33      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        34 zpos:
                flags: range
                values: 1 7
                value: 1
35      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        36 zpos:
                flags: range
                values: 1 7
                value: 1
37      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        38 zpos:
                flags: range
                values: 1 7
                value: 1
39      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        40 zpos:
                flags: range
                values: 1 7
                value: 1
41      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        42 zpos:
                flags: range
                values: 1 7
                value: 1
43      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        6 type:
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 0
        27 alpha:
                flags: range
                values: 0 255
                value: 255
        28 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        44 zpos:
                flags: range
                values: 1 7
                value: 1

Frame buffers:
id      size    pitch



Are the tests supposed to fail with my configuration?

Best regards,
Fab

> -----Original Message-----
> From: Fabrizio Castro
> Sent: 20 September 2017 12:18
> To: 'laurent.pinchart@ideasonboard.com' <laurent.pinchart@ideasonboard.co=
m>
> Cc: 'linux-renesas-soc@vger.kernel.org' <linux-renesas-soc@vger.kernel.or=
g>; Chris Paterson <Chris.Paterson2@renesas.com>; Biju
> Das <biju.das@bp.renesas.com>; David Donegan <david.donegan@renesas.com>
> Subject: kms-tests
>
> Hello Laurent,
>
> I hope you are well.
> I am looking into adding display support to the iWave RainboW-G22D-SODIMM=
 board based on RZ/G1E.
> My understanding is that the DU tests mentioned here:
> http://elinux.org/R-Car/Devices
> should work for such a platform too, therefore I am starting to play with=
:
> git://git.ideasonboard.com/renesas/kms-tests.git
>
> Going through the REAME file in kms-tests.git, the following URLs won't w=
ork for me:
> git://git.ideasonboard.com/renesas/du-tests.git
> http://git.ideasonboard.com/renesas/du-tests.git
> According to the README file, running " make install INSTALL_DIR=3D/path/=
to/target/directory" should install the scripts, but
> unfortunately it doesn't work for me. I have hacked file tests/Makefile a=
ccording to the attached patch file to make it do that.
>
> Going through the tests, here is what I get:
>
> # ./kms-test-allplanes.py
> Testing composition on CRTC 25: Traceback (most recent call last):
>   File "./kms-test-allplanes.py", line 83, in <module>
>     AllPlanesTest().execute()
>   File "/opt/kms-tests/kmstest.py", line 269, in execute
>     self.main()
>   File "./kms-test-allplanes.py", line 54, in main
>     ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>   File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
>     return req.commit(self, True)
> TypeError: Incompatible function arguments. The following argument types =
are supported:
>     1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : b=
ool =3D False) -> int
>
> # ./kms-test-connectors.py
> Testing connector Component-1: SUCCESS
>
> # ./kms-test-modes.py
> Testing modes on connector Component-1: 1/1Traceback (most recent call la=
st):
>   File "./kms-test-modes.py", line 65, in <module>
>     ModesTest().execute()
>   File "/opt/kms-tests/kmstest.py", line 269, in execute
>     self.main()
>   File "./kms-test-modes.py", line 58, in main
>     self.test_mode(connector, crtc, modes[i])
>   File "./kms-test-modes.py", line 21, in test_mode
>     ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>   File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
>     return req.commit(self, True)
> TypeError: Incompatible function arguments. The following argument types =
are supported:
>     1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : b=
ool =3D False) -> int
>
> # ./kms-test-modeset.py
> Testing atomic mode set on connector Component-1: Traceback (most recent =
call last):
>   File "./kms-test-modeset.py", line 58, in <module>
>     ModeSetTest().execute()
>   File "/opt/kms-tests/kmstest.py", line 269, in execute
>     self.main()
>   File "./kms-test-modeset.py", line 45, in main
>     ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, fb)
>   File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
>     return req.commit(self, True)
> TypeError: Incompatible function arguments. The following argument types =
are supported:
>     1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : b=
ool =3D False) -> int
>
> # ./kms-test-pageflip.py
> Testing page flip on connector Component-1: Traceback (most recent call l=
ast):
>   File "./kms-test-pageflip.py", line 118, in <module>
>     PageFlipTest().execute()
>   File "/opt/kms-tests/kmstest.py", line 269, in execute
>     self.main()
>   File "./kms-test-pageflip.py", line 87, in main
>     ret =3D self.atomic_crtc_mode_set(crtc, connector, mode, self.fbs[0])
>   File "/opt/kms-tests/kmstest.py", line 216, in atomic_crtc_mode_set
>     return req.commit(self, True)
> TypeError: Incompatible function arguments. The following argument types =
are supported:
>     1. (self : pykms.pykms.AtomicReq, data : int =3D 0, allow_modeset : b=
ool =3D False) -> int
>
> # ./kms-test-planeposition.py
> Testing plane positioning boundaries: FAIL
> # cat PlanePositionTest.log
> U [117.468550] Testing plane positioning boundaries
> U [117.469654] Testing connector Component-1, CRTC 25, mode 480x288 with =
4 planes
> U [117.513061] Initial atomic mode set completed
> U [122.526693] Root plane enabled
> U [125.532964] Moved overlay plane to 50,50
> U [128.537430] Moved overlay plane to 150,50
> U [131.541865] Moved overlay plane to 50,150
> U [134.546234] Moved overlay plane to -50,50
> U [137.550654] Moved overlay plane to 50,-50
> U [140.555092] Test failed. Reason: atomic plane set with invalid offset =
480,50 accepted
>
> I haven't looked into the tests implementation just yet, but maybe I am d=
oing something wrong therefore I wanted to check with you
> first, is my environment/system "sane" you think or there is something wr=
ong with it?
> The system is running kernel 4.4.6 at the moment.
>
> Thanks,
> Fabrizio



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.

--_002_TY1PR06MB0895979D15CBD4626FAC553FC07E0TY1PR06MB0895apcp_
Content-Type: application/octet-stream;
	name="0001-Fix-return-values-and-error-message.patch"
Content-Description: 0001-Fix-return-values-and-error-message.patch
Content-Disposition: attachment;
	filename="0001-Fix-return-values-and-error-message.patch"; size=1663;
	creation-date="Fri, 29 Sep 2017 13:39:16 GMT";
	modification-date="Fri, 29 Sep 2017 13:38:59 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2OWQzNWEzYWU5OTYxM2Y4YzQwOWEzMzIzZmIxYWIxYTc0NDhiN2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4KRGF0ZTogRnJpLCAyOSBTZXAgMjAxNyAwOTo1MzozNCArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIEZpeCByZXR1cm4gdmFsdWVzIGFuZCBlcnJvciBtZXNzYWdlCgpTaWduZWQtb2Zm
LWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KLS0t
CiB0ZXN0cy9rbXMtdGVzdC1tb2Rlcy5weSB8IDIgKy0KIHRlc3RzL2ttc3Rlc3QucHkgICAgICAg
IHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXMtdGVzdC1tb2Rlcy5weSBiL3Rlc3RzL2ttcy10ZXN0
LW1vZGVzLnB5CmluZGV4IDMxMTI4YTcuLjdjY2Q1NjYgMTAwNzU1Ci0tLSBhL3Rlc3RzL2ttcy10
ZXN0LW1vZGVzLnB5CisrKyBiL3Rlc3RzL2ttcy10ZXN0LW1vZGVzLnB5CkBAIC01Nyw3ICs1Nyw3
IEBAIGNsYXNzIE1vZGVzVGVzdChrbXN0ZXN0LktNU1Rlc3QpOgogICAgICAgICAgICAgICAgICAg
ICBzZWxmLnByb2dyZXNzKGkrMSwgbGVuKG1vZGVzKSkKICAgICAgICAgICAgICAgICAgICAgc2Vs
Zi50ZXN0X21vZGUoY29ubmVjdG9yLCBjcnRjLCBtb2Rlc1tpXSkKICAgICAgICAgICAgICAgICBl
eGNlcHQgUnVudGltZUVycm9yIGFzIGU6Ci0gICAgICAgICAgICAgICAgICAgIHNlbGYuZmFpbChl
Lm1lc3NhZ2UpCisgICAgICAgICAgICAgICAgICAgIHNlbGYuZmFpbChzdHIoZSkpCiAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAgIHNl
bGYuc3VjY2VzcygpCmRpZmYgLS1naXQgYS90ZXN0cy9rbXN0ZXN0LnB5IGIvdGVzdHMva21zdGVz
dC5weQppbmRleCBjYjBkOWE3Li41ZmUyYTYzIDEwMDc1NQotLS0gYS90ZXN0cy9rbXN0ZXN0LnB5
CisrKyBiL3Rlc3RzL2ttc3Rlc3QucHkKQEAgLTIxMyw3ICsyMTMsNyBAQCBjbGFzcyBLTVNUZXN0
KG9iamVjdCk6CiAgICAgICAgIGlmIHN5bmM6CiAgICAgICAgICAgICByZXR1cm4gcmVxLmNvbW1p
dF9zeW5jKFRydWUpCiAgICAgICAgIGVsc2U6Ci0gICAgICAgICAgICByZXR1cm4gcmVxLmNvbW1p
dChzZWxmLCBUcnVlKQorICAgICAgICAgICAgcmV0dXJuIHJlcS5jb21taXQoVHJ1ZSkKIAogICAg
IGRlZiBhdG9taWNfcGxhbmVfc2V0KHNlbGYsIHBsYW5lLCBjcnRjLCBzb3VyY2UsIGRlc3RpbmF0
aW9uLCBmYiwgc3luYz1GYWxzZSk6CiAgICAgICAgIHJlcSA9IHB5a21zLkF0b21pY1JlcShzZWxm
LmNhcmQpCkBAIC0yMzIsNyArMjMyLDcgQEAgY2xhc3MgS01TVGVzdChvYmplY3QpOgogICAgICAg
ICBpZiBzeW5jOgogICAgICAgICAgICAgcmV0dXJuIHJlcS5jb21taXRfc3luYygpCiAgICAgICAg
IGVsc2U6Ci0gICAgICAgICAgICByZXR1cm4gcmVxLmNvbW1pdChzZWxmKQorICAgICAgICAgICAg
cmV0dXJuIHJlcS5jb21taXQoKQogCiAgICAgZGVmIGF0b21pY19wbGFuZXNfZGlzYWJsZShzZWxm
LCBzeW5jPVRydWUpOgogICAgICAgICByZXEgPSBweWttcy5BdG9taWNSZXEoc2VsZi5jYXJkKQot
LSAKMi43LjQKCg==

--_002_TY1PR06MB0895979D15CBD4626FAC553FC07E0TY1PR06MB0895apcp_--
