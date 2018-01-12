Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40014 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753875AbeALUP6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 15:15:58 -0500
Received: by mail-lf0-f67.google.com with SMTP id v74so5228281lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2018 12:15:57 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180112201553.683979009@cogentembedded.com>
Date: Fri, 12 Jan 2018 23:12:05 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen2
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=drm-rcar-du-lvds-fix-LVDS-startup-on-R-Car-gen2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the latest revision 2.00 of the R-Car gen2 manual, the LVDS
must be enabled and the bias crcuit  enabled after the LVDS I/O pins are
enabled, not before --  fix the gen2 LVDS startup sequence accordingly.

Fixes: 90374b5c25c9 ("drm/rcar-du: Add internal LVDS encoder support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -59,11 +59,8 @@ static void rcar_du_lvdsenc_start_gen2(s
 
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
-	/*
-	 * Set the  LVDS mode, select the input, enable LVDS operation,
-	 * and turn bias circuitry on.
-	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
+	/* Select the input and set the LVDS mode. */
+	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
 	if (rcrtc->index == 2)
 		lvdcr0 |= LVDCR0_DUSEL;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
@@ -73,6 +70,10 @@ static void rcar_du_lvdsenc_start_gen2(s
 			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
 			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
 
+	/* Enable LVDS operation and turn bias circuitry on. */
+	lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
 	/*
 	 * Turn the PLL on, wait for the startup delay, and turn the output
 	 * on.
