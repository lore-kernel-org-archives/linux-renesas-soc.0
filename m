Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:42769 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752977AbeEKKBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 06:01:17 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] vin-tests: Add D3 Draak support
Date: Fri, 11 May 2018 12:00:34 +0200
Message-Id: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Niklas,
    this series extends the vin-test suites to allow capture from HDMI
input on D3 Draak board.

I have re-used as much as possible of the existing scripts, but had to extend
and generalize some assumptions, as so far Gen3 had only been used and tested
with CSI-2 inputs.

To capture from D3:

[root@alarm ~]# ./vin-tests/yavta-hdmi
Board: D3
Board: D3
'adv7612 0-004c':1 -> 'VIN4 output':0 : OKEY - Link set 1
Opening media device /dev/media1
Enumerating entities
looking up device: 81:9
looking up device: 81:10
Found 2 entities
Enumerating pads and links
Setting up format RGB888_1X24 640x480 on pad adv7612 0-004c/1
Format set: RGB888_1X24 640x480
Device /dev/video3 opened.
Device `R_Car_VIN' on `platform:e6ef4000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: XBGR32 (34325258) 640x480 (stride 2560) field none buffer size 1228800
Video format: XBGR32 (34325258) 640x480 (stride 2560) field none buffer size 1228800
Device /dev/video3 opened.
Device `R_Car_VIN' on `platform:e6ef4000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
iedeo [fo rma5t5:5 4X.B0GR323 (3453621532]5 8)W  6=4 06x4408 0 ;( st rHi d=e  24560)8 0f
  ld none buffer size 1228800
4 buffers requested.
length: 1228800 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffaa668000.
length: 1228800 offset: 1228800 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffaa53c000.
length: 1228800 offset: 2457600 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffaa410000.
length: 1228800 offset: 3686400 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffaa2e4000.
0 (1) [-] none 0 1228800 B 5554.099816 5554.099894 24.195 fps ts mono/EoF
1 (2) [-] none 1 1228800 B 5554.116503 5554.122945 59.927 fps ts mono/EoF
2 (0) [-] none 2 1228800 B 5554.133188 5554.146213 59.934 fps ts mono/EoF
3 (3) [-] none 3 1228800 B 5554.149875 5554.169601 59.927 fps ts mono/EoF
4 (1) [-] none 5 1228800 B 5554.183247 5554.192933 29.965 fps ts mono/EoF
5 (2) [-] none 6 1228800 B 5554.199918 5554.216359 59.984 fps ts mono/EoF
6 (0) [-] none 8 1228800 B 5554.233291 5554.239657 29.964 fps ts mono/EoF
7 (3) [-] none 9 1228800 B 5554.249975 5554.262959 59.938 fps ts mono/EoF
8 (1) [-] none 10 1228800 B 5554.266665 5554.286175 59.916 fps ts mono/EoF
9 (2) [-] none 12 1228800 B 5554.300167 5554.309427 29.849 fps ts mono/EoF
Captured 10 frames in 0.250941 seconds (39.849961 fps, 48967631.968874 B/s).
4 buffers released.
0
b1d594f1ef685c5dc9a12e2f20f73da1  /tmp/vin-tests/frame-000000.bin
70eab01ac30be086e3c26001b8c8d018  /tmp/vin-tests/frame-000001.bin
b43d9423a64ace2627b585ba855e2ae5  /tmp/vin-tests/frame-000002.bin
b43d9423a64ace2627b585ba855e2ae5  /tmp/vin-tests/frame-000003.bin
25528dc1bf8677435cbc19d46c712fad  /tmp/vin-tests/frame-000004.bin
b43d9423a64ace2627b585ba855e2ae5  /tmp/vin-tests/frame-000005.bin
b43d9423a64ace2627b585ba855e2ae5  /tmp/vin-tests/frame-000006.bin
b43d9423a64ace2627b585ba855e2ae5  /tmp/vin-tests/frame-000007.bin
25528dc1bf8677435cbc19d46c712fad  /tmp/vin-tests/frame-000008.bin
b43d9423a64ace2627b585ba855e2ae5  /tmp/vin-tests/frame-000009.bin
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000000.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000001.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000002.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000003.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000004.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000005.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000006.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000007.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000008.pnm'...
0 padding bytes detected at end of line
Image size: 640x480, bytes per pixel: 32, format: BGR32 (32  BGR-8-8-8-8)
Writing to file `/tmp/vin-tests/frame-000009.pnm'...

Thanks
   j

Jacopo Mondi (5):
  boards: Add R8A77995 D3 Draak board
  vin-tests: Add function to propagate digital format
  gen3-links: Support linking for digital input
  yavta-hdmi: Generalize capture parameters
  convert: Accept destination format as parameter

 convert.sh           |  3 ++-
 gen3-links.sh        | 14 ++++++++++----
 scripts/boards.sh    | 31 +++++++++++++++++++++++++++++++
 scripts/vin-tests.sh |  9 +++++++++
 yavta-hdmi           |  6 +++---
 5 files changed, 55 insertions(+), 8 deletions(-)

--
2.7.4
