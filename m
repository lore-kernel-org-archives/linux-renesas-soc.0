Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45639 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbeHVKpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 06:45:36 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 2/3] drm: rcar-du: Write ESCR register per channel
Date: Wed, 22 Aug 2018 09:21:48 +0200
Message-Id: <1534922509-15197-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ESCR registers offset definition is confusing, as each channel is
equipped with an ESCR register instance, but the names suggest only ESCR and
ESCR2 are taken into account.

Rename the offsets to a name that includes the channels they apply to, and
write them to each channel with 'rcar_du_crtc_write()'.

Cosmetic patch, no functional changes intended.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +--
 drivers/gpu/drm/rcar-du/rcar_du_regs.h | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 5454884..714c1fc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -294,8 +294,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		}
 	}
 
-	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? ESCR2 : ESCR,
-			    escr);
+	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? OTAR2 : OTAR, 0);
 
 	/* Signal polarities */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index 9dfd220..ebc4aea 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -492,8 +492,8 @@
  * External Synchronization Control Registers
  */
 
-#define ESCR			0x10000
-#define ESCR2			0x31000
+#define ESCR02			0x10000
+#define ESCR13			0x01000
 #define ESCR_DCLKOINV		(1 << 25)
 #define ESCR_DCLKSEL_DCLKIN	(0 << 20)
 #define ESCR_DCLKSEL_CLKS	(1 << 20)
-- 
2.7.4
