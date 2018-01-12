Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:41915 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753875AbeALUPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 15:15:54 -0500
Received: by mail-lf0-f68.google.com with SMTP id h137so7181456lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2018 12:15:54 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180112201550.368547609@cogentembedded.com>
Date: Fri, 12 Jan 2018 23:12:04 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=drm-rcar-du-lvds-fix-LVDS-startup-on-R-Car-gen3.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the latest revisions of the R-Car gen3 manual, the LVDS mode
must be set before the LVDS I/O pins are enabled, not after --  fix  the
gen3 LVDS startup sequence accordingly...

While  at it,  also fix the comment  preceding the first LVDCR0 write in
the R-Car gen2 startup code that still talks about hardcoding the LVDS
mode 0...

Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode selection")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -60,8 +60,8 @@ static void rcar_du_lvdsenc_start_gen2(s
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
 	/*
-	 * Select the input, hardcode mode 0, enable LVDS operation and turn
-	 * bias circuitry on.
+	 * Set the  LVDS mode, select the input, enable LVDS operation,
+	 * and turn bias circuitry on.
 	 */
 	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
 	if (rcrtc->index == 2)
@@ -106,6 +106,9 @@ static void rcar_du_lvdsenc_start_gen3(s
 
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
+	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
 	/* Turn all the channels on. */
 	rcar_lvds_write(lvds, LVDCR1,
 			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
@@ -115,7 +118,8 @@ static void rcar_du_lvdsenc_start_gen3(s
 	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
 	 * delay and turn the output on.
 	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
+
+	lvdcr0 = | LVDCR0_PLLON;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
 	lvdcr0 |= LVDCR0_PWD;
