Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 01/22] drm: bridge: dw-hdmi: Merge __hdmi_phy_i2c_write and hdmi_phy_i2c_write
Date: Fri,  2 Dec 2016 01:43:16 +0200
Message-Id: <1480635817-1258-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The latter is just an int wrapper around the former void function that
unconditionally returns 0. As the return value is never checked, merge
the two functions into one.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
