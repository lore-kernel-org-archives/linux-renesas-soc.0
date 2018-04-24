Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbeDXPkI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 11:40:08 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Use NULL for table initialisation
Date: Tue, 24 Apr 2018 16:40:03 +0100
Message-Id: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the initialisation of the vsps table with a NULL specifier.

Fixes the following warning:
 linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c:483:40:
    warning: Using plain integer as NULL pointer
      CC      drivers/gpu/drm/rcar-du/rcar_du_kms.o

Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index ef72dff00763..cf5b422fc753 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -480,7 +480,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 	struct {
 		struct device_node *np;
 		unsigned int crtcs_mask;
-	} vsps[RCAR_DU_MAX_VSPS] = { { 0, }, };
+	} vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
 	unsigned int vsps_count = 0;
 	unsigned int cells;
 	unsigned int i;
-- 
2.17.0
