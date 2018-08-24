Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:57237 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbeHXN6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 09:58:32 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] vin-tests: Add D3 Draak support
Date: Fri, 24 Aug 2018 12:24:18 +0200
Message-Id: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,
   with these patches I can use yavta-hdmi script on Draak D3 board.

Compared to v1 I have rebased on top of your latest changes, with the V3M
integration that greatly simplified my life.

There are a few hack though [3/4] in particular, so I let you judge if you
want to include these changes or not.

For the record, the capture procedure on D3 is:

[root@alarm vin-tests]# ./set-edid
EDID set successfully.

[root@alarm vin-tests]# ./yavta-hdmi 4
WARING: overriding parallel format to: RGB888_1X24
format: RGB888_1X24 size: 640x480/640x480 field: none/none vdev: /dev/video3
Device /dev/video3 opened.
Device `R_Car_VIN' on `platform:e6ef4000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: XBGR32 (34325258) 640x480 (stride 2560) field none buffer size 1228800
Video format: XBGR32 (34325258) 640x480 (stride 2560) field none buffer size 1228800
Device /dev/video3 opened.
Device `R_Car_VIN' on `platform:e6ef4000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: XBGR32 (34325258) 640x480 (stride 2560) field none buffer size 1228800
4 buffers requested.
length: 1228800 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffa3034000.
length: 1228800 offset: 1228800 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffa2f08000.
length: 1228800 offset: 2457600 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffa2ddc000.
length: 1228800 offset: 3686400 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffa2cb0000.
0 (1) [-] none 0 1228800 B 6196.484974 6196.485053 22.681 fps ts mono/EoF
1 (2) [-] none 1 1228800 B 6196.501657 6196.508303 59.941 fps ts mono/EoF
2 (0) [-] none 2 1228800 B 6196.518341 6196.531824 59.938 fps ts mono/EoF
3 (3) [-] none 3 1228800 B 6196.535027 6196.555485 59.930 fps ts mono/EoF
4 (1) [-] none 5 1228800 B 6196.568386 6196.579076 29.977 fps ts mono/EoF
5 (2) [-] none 6 1228800 B 6196.585073 6196.602437 59.927 fps ts mono/EoF
6 (0) [-] none 8 1228800 B 6196.618447 6196.625953 29.963 fps ts mono/EoF
7 (3) [-] none 9 1228800 B 6196.635130 6196.649540 59.941 fps ts mono/EoF
8 (1) [-] none 11 1228800 B 6196.668488 6196.673171 29.978 fps ts mono/EoF
9 (2) [-] none 12 1228800 B 6196.685175 6196.696770 59.927 fps ts mono/EoF
Captured 10 frames in 0.255885 seconds (39.080054 fps, 48021569.750941 B/s).

And I have converted images with:
$for i in `ls frame-*.bin`; do raw2rgbpnm -f BGR32 -s640x480 $i /tmp/$i.pnm; done

I am not sure about the formats I have used, but they give me the best results,
even if the images are flickered and not completely centered :/

Thanks
  j

Jacopo Mondi (4):
  vin-tests: Add support for D3 Draak
  vin-tests: Fix vdev name in propagate_parallel
  vin-tests: Add capture format for parallel input
  vin-tests: yavta-hdmi: Add VIN4 and parallel link

 scripts/boards.sh    | 11 +++++++++++
 scripts/vin-tests.sh |  3 ++-
 yavta-hdmi           | 13 +++++++++++--
 3 files changed, 24 insertions(+), 3 deletions(-)

--
2.7.4
