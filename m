Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45672 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727432AbeJVEPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:15:41 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] gpu: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:05 +0200
Message-Id: <20181021200012.1583-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I got tired of fixing this in Renesas drivers manually, so I took the big
hammer. Remove this cumbersome code pattern which got copy-pasted too much
already:

-	struct platform_device *pdev = to_platform_device(dev);
-	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
+	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);

A branch, tested by buildbot, can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git coccinelle/get_drvdata

I have been asked if it couldn't be done for dev_set_drvdata as well. I checked
it and did not find one occasion where it could be simplified like this. Not
much of a surprise because driver_data is usually set in probe() functions
which access struct platform_device in many other ways.

I am open for other comments, suggestions, too, of course.

Here is the cocci-script I created:

@@
struct device* d;
identifier pdev;
expression *ptr;
@@
(
-	struct platform_device *pdev = to_platform_device(d);
|
-	struct platform_device *pdev;
	...
-	pdev = to_platform_device(d);
)
	<... when != pdev
-	&pdev->dev
+	d
	...>

	ptr =
-	platform_get_drvdata(pdev)
+	dev_get_drvdata(d)

	<... when != pdev
-	&pdev->dev
+	d
	...>

Kind regards,

   Wolfram


Wolfram Sang (6):
  gpu: drm: msm: adreno: adreno_device: simplify getting .driver_data
  gpu: drm: msm: disp: dpu1: dpu_kms: simplify getting .driver_data
  gpu: drm: msm: disp: mdp5: mdp5_kms: simplify getting .driver_data
  gpu: drm: msm: dsi: dsi_host: simplify getting .driver_data
  gpu: drm: msm: msm_drv: simplify getting .driver_data
  gpu: drm: omapdrm: displays: panel-dsi-cm: simplify getting
    .driver_data

 drivers/gpu/drm/msm/adreno/adreno_device.c     |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  6 ++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c       |  6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c             |  6 ++----
 drivers/gpu/drm/msm/msm_drv.c                  |  3 +--
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ++++++------------
 6 files changed, 15 insertions(+), 30 deletions(-)

-- 
2.19.0
