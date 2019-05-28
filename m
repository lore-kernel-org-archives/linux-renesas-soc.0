Return-Path: <SRS0=f7QG=T4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D58DC04AB6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 28 May 2019 14:13:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9F5D2081C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 28 May 2019 14:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WIkkaqd9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfE1ON2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 28 May 2019 10:13:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48970 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfE1ON2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:28 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51231FA6;
        Tue, 28 May 2019 16:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052806;
        bh=V7A4FvSE3DLgiRbObCpZHs3QCJSM7YQT38F2u3gEDho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WIkkaqd9nQCLAGBFMkQsrsxK5ZgL4p221mkDiZIFPJrHdc9oYO5JcQL5tSt/VgpkY
         vBxf1zJ+ErUwPUAcb+ODW4uQ8zgP3BzFUzjK46mOyTKyn/MJG9gxpotZT/tg1j993D
         u6P/L6JQH9S2IZqJj9szWMKwdGNztGB5bR1kI9DE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
Date:   Tue, 28 May 2019 17:12:31 +0300
Message-Id: <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In dual-link LVDS mode, the LVDS1 encoder is used as a companion for
LVDS0, and both encoders transmit data from DU0. The LVDS1 output of DU1
can't be used in that case, don't create an encoder and connector for
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changess since v2:

- Remove unneeded bridge NULL check
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 6c91753af7bc..0f00bdfe2366 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -16,6 +16,7 @@
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
 #include "rcar_du_kms.h"
+#include "rcar_lvds.h"
 
 /* -----------------------------------------------------------------------------
  * Encoder
@@ -97,6 +98,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		}
 	}
 
+	/*
+	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
+	 * companion for LVDS0 in dual-link mode.
+	 */
+	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
+		if (rcar_lvds_dual_link(bridge)) {
+			ret = -ENOLINK;
+			goto done;
+		}
+	}
+
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index f8f7fff34dff..95c81e59e2f1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -378,7 +378,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 	}
 
 	ret = rcar_du_encoder_init(rcdu, output, entity);
-	if (ret && ret != -EPROBE_DEFER)
+	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
 		dev_warn(rcdu->dev,
 			 "failed to initialize encoder %pOF on output %u (%d), skipping\n",
 			 entity, output, ret);
-- 
Regards,

Laurent Pinchart

