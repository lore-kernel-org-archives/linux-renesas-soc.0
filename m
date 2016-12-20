Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
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
Subject: [PATCH v2 01/29] drm: bridge: dw-hdmi: Merge __hdmi_phy_i2c_write and hdmi_phy_i2c_write
Date: Tue, 20 Dec 2016 03:33:32 +0200
Message-Id: <20161220013400.28317-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The latter is just an int wrapper around the former void function that
unconditionally returns 0. As the return value is never checked, merge
the two functions into one.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index f5009ae39b89..a6685502571e 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -868,7 +868,7 @@ static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
 	return true;
 }
 
-static void __hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
+static void hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 				 unsigned char addr)
 {
 	hdmi_writeb(hdmi, 0xFF, HDMI_IH_I2CMPHY_STAT0);
@@ -882,13 +882,6 @@ static void __hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 	hdmi_phy_wait_i2c_done(hdmi, 1000);
 }
 
-static int hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
-			      unsigned char addr)
-{
-	__hdmi_phy_i2c_write(hdmi, data, addr);
-	return 0;
-}
-
 static void dw_hdmi_phy_enable_powerdown(struct dw_hdmi *hdmi, bool enable)
 {
 	hdmi_mask_writeb(hdmi, !enable, HDMI_PHY_CONF0,
-- 
Regards,

Laurent Pinchart
