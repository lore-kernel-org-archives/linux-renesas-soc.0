Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56844 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751035AbdCBKtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 05:49:09 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 3/4] drm: bridge: vga-dac: Add adi,adv7123 compatible string
Date: Thu,  2 Mar 2017 12:47:27 +0200
Message-Id: <20170302104728.7150-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
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
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/bridge/dumb-vga-dac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index 86e9f9c7b59c..63e113bd21d2 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -237,6 +237,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
 
 static const struct of_device_id dumb_vga_match[] = {
 	{ .compatible = "dumb-vga-dac" },
+	{ .compatible = "adi,adv7123" },
 	{ .compatible = "ti,ths8135" },
 	{},
 };
-- 
Regards,

Laurent Pinchart
