Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nickey Yang <nickey.yang@rock-chips.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH v3 14/20] drm: bridge: dw-hdmi: Detect AHB audio DMA using correct register
Date: Tue, 17 Jan 2017 10:29:04 +0200
Message-Id: <20170117082910.27023-15-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Bit 0 in CONFIG1_ID tells whether the IP core uses an AHB slave
interface for control. The correct way to identify AHB audio DMA support
is through bit 1 in CONFIG3_ID.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
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
