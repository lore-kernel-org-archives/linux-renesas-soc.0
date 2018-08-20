Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45584 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbeHTTRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 15:17:03 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/2] drm: rcar-du: Refactor Feature and Quirk definitions
Date: Mon, 20 Aug 2018 17:00:43 +0100
Message-Id: <20180820160044.15783-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180820160044.15783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180820160044.15783-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

These flags are represented by bit fields. To make this clear, utilise
the BIT() macro.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
This patch fails checkpatch's 80-char limit, due to the line comments
extending across the 80-char boundary on RCAR_DU_FEATURE_EXT_CTRL_REGS

To preserve formatting - this warning has been ignored.

 drivers/gpu/drm/rcar-du/rcar_du_drv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index b3a25e8e07d0..78ea20abfb30 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -27,11 +27,11 @@ struct drm_device;
 struct drm_fbdev_cma;
 struct rcar_du_device;
 
-#define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	(1 << 0)	/* Per-CRTC IRQ and clock */
-#define RCAR_DU_FEATURE_EXT_CTRL_REGS	(1 << 1)	/* Has extended control registers */
-#define RCAR_DU_FEATURE_VSP1_SOURCE	(1 << 2)	/* Has inputs from VSP1 */
+#define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
+#define RCAR_DU_FEATURE_EXT_CTRL_REGS	BIT(1)	/* Has extended control registers */
+#define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(2)	/* Has inputs from VSP1 */
 
-#define RCAR_DU_QUIRK_ALIGN_128B	(1 << 0)	/* Align pitches to 128 bytes */
+#define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
 /*
  * struct rcar_du_output_routing - Output routing specification
-- 
2.17.1
