Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56844 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751799AbdCBKtS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 05:49:18 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 4/4] drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string
Date: Thu,  2 Mar 2017 12:47:28 +0200
Message-Id: <20170302104728.7150-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The THC63LVDM83D is a transparent LVDS encoder. Unlike dumb LVDS
encoders it can be controlled through a few pins (power down, LVDS
swing, clock edge selection) and requires power supplies. However, on
several boards where the device is used neither the control pins nor the
power supply are controllable.

To avoid developing a separate device-specific driver add a
"thine,thc63lvdm83d" compatible entry to the lvds-encoder driver. This
will allow supporting many THC63LVDM83D-based boards easily, while
allowing future development of an thc63lvdm83d driver when needed
without breaking backward compatibility.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/lvds-encoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
index d817d78b893d..6ec2aafcfe85 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -190,6 +190,7 @@ static int lvds_encoder_remove(struct platform_device *pdev)
 
 static const struct of_device_id lvds_encoder_match[] = {
 	{ .compatible = "lvds-encoder" },
+	{ .compatible = "thine,thc63lvdm83d" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvds_encoder_match);
-- 
Regards,

Laurent Pinchart
