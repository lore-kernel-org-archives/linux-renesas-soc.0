Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41469 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752966AbcLTBdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:46 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 14/29] drm: bridge: dw-hdmi: Detect AHB audio DMA using correct register
Date: Tue, 20 Dec 2016 03:33:45 +0200
Message-Id: <20161220013400.28317-15-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Bit 0 in CONFIG1_ID tells whether the IP core uses an AHB slave
interface for control. The correct way to identify AHB audio DMA support
is through bit 1 in CONFIG3_ID.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 6 +++---
 drivers/gpu/drm/bridge/dw-hdmi.h | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 1809247745b8..730a7558d4d4 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1836,7 +1836,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	u8 prod_id0;
 	u8 prod_id1;
 	u8 config0;
-	u8 config1;
+	u8 config3;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
@@ -1988,9 +1988,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	pdevinfo.id = PLATFORM_DEVID_AUTO;
 
 	config0 = hdmi_readb(hdmi, HDMI_CONFIG0_ID);
-	config1 = hdmi_readb(hdmi, HDMI_CONFIG1_ID);
+	config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);
 
-	if (config1 & HDMI_CONFIG1_AHB) {
+	if (config3 & HDMI_CONFIG3_AHBAUDDMA) {
 		struct dw_hdmi_audio_data audio;
 
 		audio.phys = iores->start;
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.h b/drivers/gpu/drm/bridge/dw-hdmi.h
index 91d7fabbd6e5..a4fd64a203c9 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/dw-hdmi.h
@@ -559,6 +559,10 @@ enum {
 /* CONFIG1_ID field values */
 	HDMI_CONFIG1_AHB = 0x01,
 
+/* CONFIG3_ID field values */
+	HDMI_CONFIG3_AHBAUDDMA = 0x02,
+	HDMI_CONFIG3_GPAUD = 0x01,
+
 /* IH_FC_INT2 field values */
 	HDMI_IH_FC_INT2_OVERFLOW_MASK = 0x03,
 	HDMI_IH_FC_INT2_LOW_PRIORITY_OVERFLOW = 0x02,
-- 
Regards,

Laurent Pinchart
