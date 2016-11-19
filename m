Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55231 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752778AbcKSDsS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:48:18 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/9] drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string
Date: Sat, 19 Nov 2016 05:48:17 +0200
Message-Id: <1479527302-7674-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
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
index 33e8025c8a6d..f3026ad82fe1 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -184,6 +184,7 @@ static int lvds_encoder_remove(struct platform_device *pdev)
 
 static const struct of_device_id lvds_encoder_match[] = {
 	{ .compatible = "lvds-encoder" },
+	{ .compatible = "thine,thc63lvdm83d" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvds_encoder_match);
-- 
Regards,

Laurent Pinchart
