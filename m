Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35070 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938712AbcJSOON (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:14:13 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/8] drm: bridge: vga-dac: Add adi,adv7123 compatible string
Date: Wed, 19 Oct 2016 17:07:50 +0300
Message-Id: <1476886076-24178-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ADV7123 is a transparent VGA DAC. Unlike dumb VGA DACs it can be
controlled through a power save pin, and requires a power supply.
However, on most boards where the device is used neither the power save
signal nor the power supply are controllable.

To avoid developing a separate device-specific driver add an
"adi,adv7123" compatible entry to the dumb-vga-dac driver. This will
allow supporting most ADV7123-based boards easily, while allowing future
development of an adv7123 driver when needed without breaking backward
compatibility.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dumb-vga-dac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index afec232185a7..b33e3f829e4f 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -204,6 +204,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
 
 static const struct of_device_id dumb_vga_match[] = {
 	{ .compatible = "dumb-vga-dac" },
+	{ .compatible = "adi,adv7123" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dumb_vga_match);
-- 
Regards,

Laurent Pinchart
