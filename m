Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B10C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D25B820663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dIl9Nct2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfCFXYK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfCFXYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:10 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FD9AF92;
        Thu,  7 Mar 2019 00:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914642;
        bh=XW/PLd6h3lE1ovyc/e+wmh/ZRUPJbonboPGxPjomFaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dIl9Nct2JGpsvte4mW79Z2DbuN8zoctlLm6+Iq9lEN6BgT+olSQ3fuCJil328Oqqr
         qaBNIQCk65BO4y874k0xVd9/0JQjqXr4Ikg7PvRRUKSFPcN7SiQ9ojKUnGT+FOkMfc
         IsH9dOrZ4aE4XSEX9lVVhULEiSGcmE/wEdhf5QQs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 12/15] drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
Date:   Thu,  7 Mar 2019 01:23:42 +0200
Message-Id: <20190306232345.23052-13-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 6c91753af7bc..fe046d194944 100644
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
+		if (bridge && rcar_lvds_dual_link(bridge)) {
+			ret = -ENOLINK;
+			goto done;
+		}
+	}
+
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3b7d50a8fb9b..7f9d43a1ee42 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -352,7 +352,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
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

