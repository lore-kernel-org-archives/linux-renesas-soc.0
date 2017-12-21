Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39105 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753633AbdLUUXu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 15:23:50 -0500
Received: by mail-lf0-f65.google.com with SMTP id m20so16142002lfi.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 12:23:49 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171221202343.596842084@cogentembedded.com>
Date: Thu, 21 Dec 2017 23:23:30 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] drm: rcar-du: lvds: fix LVDCR1 for R-Car gen3
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=drm-rcar-du-lvds-fix-LVDCR1-for-R-Car-gen3.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The LVDCR1 register for the R-Car gen3 SoCs was documented as having the
layout different from the gen2 SoCs in  the early R-Car gen3 manuals but
since v0.52 the LVDCR1 layout is described as being the same as on the gen2
SoCs; the old CHn control values are said to be prohibited now (and there
seems to be no valid output signal when they are used).

Fixes: 6bc2e15cf21c ("drm: rcar-du: lvds: Add R-Car Gen3 support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   10 ++++------
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h  |    6 ++----
 2 files changed, 6 insertions(+), 10 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -70,9 +70,8 @@ static void rcar_du_lvdsenc_start_gen2(s
 
 	/* Turn all the channels on. */
 	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY_GEN2(3) | LVDCR1_CHSTBY_GEN2(2) |
-			LVDCR1_CHSTBY_GEN2(1) | LVDCR1_CHSTBY_GEN2(0) |
-			LVDCR1_CLKSTBY_GEN2);
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
 
 	/*
 	 * Turn the PLL on, wait for the startup delay, and turn the output
@@ -109,9 +108,8 @@ static void rcar_du_lvdsenc_start_gen3(s
 
 	/* Turn all the channels on. */
 	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY_GEN3(3) | LVDCR1_CHSTBY_GEN3(2) |
-			LVDCR1_CHSTBY_GEN3(1) | LVDCR1_CHSTBY_GEN3(0) |
-			LVDCR1_CLKSTBY_GEN3);
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
 
 	/*
 	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
@@ -26,10 +26,8 @@
 
 #define LVDCR1				0x0004
 #define LVDCR1_CKSEL			(1 << 15)		/* Gen2 only */
-#define LVDCR1_CHSTBY_GEN2(n)		(3 << (2 + (n) * 2))	/* Gen2 only */
-#define LVDCR1_CHSTBY_GEN3(n)		(1 << (2 + (n) * 2))	/* Gen3 only */
-#define LVDCR1_CLKSTBY_GEN2		(3 << 0)		/* Gen2 only */
-#define LVDCR1_CLKSTBY_GEN3		(1 << 0)		/* Gen3 only */
+#define LVDCR1_CHSTBY(n)		(3 << (2 + (n) * 2))
+#define LVDCR1_CLKSTBY			(3 << 0)
 
 #define LVDPLLCR			0x0008
 #define LVDPLLCR_CEEN			(1 << 14)
