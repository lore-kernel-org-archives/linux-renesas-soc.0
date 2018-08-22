Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38977 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbeHVKpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 06:45:38 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 3/3] drm: rcar-du: Write OTAR register per channel
Date: Wed, 22 Aug 2018 09:21:49 +0200
Message-Id: <1534922509-15197-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The OTAR registers offset definition is confusing, as each channel is
equipped with an OTAR register instance, but the names suggest only OTAR and
OTAR2 are taken into account.

Rename the offsets to a name that includes the channels they apply to, and
write them to each channel with 'rcar_du_crtc_write()'.

Cosmetic patch, no functional changes intended.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 714c1fc..e2d9653 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -295,7 +295,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	}
 
 	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
-	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? OTAR2 : OTAR, 0);
+	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
 
 	/* Signal polarities */
 	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index ebc4aea..4144950 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -504,8 +504,8 @@
 #define ESCR_SYNCSEL_EXHSYNC	(3 << 8)
 #define ESCR_FRQSEL_MASK	(0x3f << 0)
 
-#define OTAR			0x10004
-#define OTAR2			0x31004
+#define OTAR02			0x10004
+#define OTAR13			0x01004
 
 /* -----------------------------------------------------------------------------
  * Dual Display Output Control Registers
-- 
2.7.4
