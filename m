Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:32858 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755052AbeDTOUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 10:20:54 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] video: fbdev: sh_mobile_meram: Drop SUPERH platform dependency
Date: Fri, 20 Apr 2018 16:20:51 +0200
Message-Id: <1524234051-14058-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C
board code"), the only remaining platforms using this driver are SuperH
SH-Mobile SoCs (sh7723).  As both SUPERH and ARCH_SHMOBILE are set for
these platforms, the SUPERH dependency can be dropped.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index d94254263ea5caa7..434e95b9320ead05 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2348,7 +2348,7 @@ source "drivers/video/fbdev/mmp/Kconfig"
 
 config FB_SH_MOBILE_MERAM
 	tristate "SuperH Mobile MERAM read ahead support"
-	depends on (SUPERH || ARCH_SHMOBILE)
+	depends on ARCH_SHMOBILE
 	select GENERIC_ALLOCATOR
 	---help---
 	  Enable MERAM support for the SuperH controller.
-- 
2.7.4
