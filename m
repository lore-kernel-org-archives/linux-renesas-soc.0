Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41472 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754628AbcLTBdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:45 -0500
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
Subject: [PATCH v2 13/29] drm: bridge: dw-hdmi: Reject invalid product IDs
Date: Tue, 20 Dec 2016 03:33:44 +0200
Message-Id: <20161220013400.28317-14-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DWC HDMI TX can be recognized by the two product identification
registers. If the registers don't read as expect the IP will be very
different than what the driver has been designed for, or will be
misconfigured in a way that makes it non-operational (invalid memory
address, incorrect clocks, ...). We should reject this situation with an
error.

While this isn't critical for proper operation with supported IPs at the
moment, the driver will soon gain automatic device-specific handling
based on runtime device identification. This change makes it easier to
implement that without having to default to a random guess in case the
device can't be identified.

While at it print a readable version number in the device identification
message instead of raw register values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 25 +++++++++++++++++++------
 drivers/gpu/drm/bridge/dw-hdmi.h |  8 ++++++++
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 06c252f560ad..1809247745b8 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1832,6 +1832,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	int irq;
 	int ret;
 	u32 val = 1;
+	u16 version;
+	u8 prod_id0;
+	u8 prod_id1;
 	u8 config0;
 	u8 config1;
 
@@ -1914,12 +1917,22 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	}
 
 	/* Product and revision IDs */
-	dev_info(dev,
-		 "Detected HDMI controller 0x%x:0x%x:0x%x:0x%x\n",
-		 hdmi_readb(hdmi, HDMI_DESIGN_ID),
-		 hdmi_readb(hdmi, HDMI_REVISION_ID),
-		 hdmi_readb(hdmi, HDMI_PRODUCT_ID0),
-		 hdmi_readb(hdmi, HDMI_PRODUCT_ID1));
+	version = (hdmi_readb(hdmi, HDMI_DESIGN_ID) << 8)
+		| (hdmi_readb(hdmi, HDMI_REVISION_ID) << 0);
+	prod_id0 = hdmi_readb(hdmi, HDMI_PRODUCT_ID0);
+	prod_id1 = hdmi_readb(hdmi, HDMI_PRODUCT_ID1);
+
+	if (prod_id0 != HDMI_PRODUCT_ID0_HDMI_TX ||
+	    (prod_id1 & ~HDMI_PRODUCT_ID1_HDCP) != HDMI_PRODUCT_ID1_HDMI_TX) {
+		dev_err(dev, "Unsupported HDMI controller (%04x:%02x:%02x)\n",
+			version, prod_id0, prod_id1);
+		ret = -ENODEV;
+		goto err_iahb;
+	}
+
+	dev_info(dev, "Detected HDMI TX controller v%x.%03x %s HDCP\n",
+		 version >> 12, version & 0xfff,
+		 prod_id1 & HDMI_PRODUCT_ID1_HDCP ? "with" : "without");
 
 	initialize_hdmi_ih_mutes(hdmi);
 
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.h b/drivers/gpu/drm/bridge/dw-hdmi.h
index 08235aef2fa3..91d7fabbd6e5 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/dw-hdmi.h
@@ -545,6 +545,14 @@
 #define HDMI_I2CM_FS_SCL_LCNT_0_ADDR            0x7E12
 
 enum {
+/* PRODUCT_ID0 field values */
+	HDMI_PRODUCT_ID0_HDMI_TX = 0xa0,
+
+/* PRODUCT_ID1 field values */
+	HDMI_PRODUCT_ID1_HDCP = 0xc0,
+	HDMI_PRODUCT_ID1_HDMI_RX = 0x02,
+	HDMI_PRODUCT_ID1_HDMI_TX = 0x01,
+
 /* CONFIG0_ID field values */
 	HDMI_CONFIG0_I2S = 0x10,
 
-- 
Regards,

Laurent Pinchart
