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
Subject: [PATCH v3 06/20] drm: bridge: dw-hdmi: Don't forward HPD events to DRM core before attach
Date: Tue, 17 Jan 2017 10:28:56 +0200
Message-Id: <20170117082910.27023-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hotplug events should only be forwarded to the DRM core by the interrupt
handler when the bridge has been attached, otherwise the DRM device
pointer will be NULL, resulting in a crash.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index ef10bb866b2f..488dc1a9204f 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1805,7 +1805,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
 		dev_dbg(hdmi->dev, "EVENT=%s\n",
 			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
-		drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		if (hdmi->bridge.dev)
+			drm_helper_hpd_irq_event(hdmi->bridge.dev);
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
-- 
Regards,

Laurent Pinchart
