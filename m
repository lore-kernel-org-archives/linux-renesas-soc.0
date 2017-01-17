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
Subject: [PATCH v3 01/20] drm: bridge: dw-hdmi: Merge __hdmi_phy_i2c_write and hdmi_phy_i2c_write
Date: Tue, 17 Jan 2017 10:28:51 +0200
Message-Id: <20170117082910.27023-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
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
