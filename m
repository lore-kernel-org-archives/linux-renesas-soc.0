Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:43024 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388198AbeKXBTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 20:19:08 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH] drm: rcar-du: dw-hdmi: Reject modes with a too high clock frequency
Date: Fri, 23 Nov 2018 16:34:59 +0200
Message-Id: <20181123143459.13133-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Implement a .mode_valid() handler in the R-Car glue layer to reject
modes with an unsupported clock frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 75490a3e0a2a..8a603235f22d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -35,6 +35,16 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
 	{ ~0UL,      0x0000, 0x0000, 0x0000 },
 };
 
+static enum drm_mode_status
+rcar_hdmi_mode_valid(struct drm_connector *connector,
+		     const struct drm_display_mode *mode)
+{
+	if (mode->clock > 297000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
 				   const struct dw_hdmi_plat_data *pdata,
 				   unsigned long mpixelclock)
@@ -59,6 +69,7 @@ static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
 }
 
 static const struct dw_hdmi_plat_data rcar_dw_hdmi_plat_data = {
+	.mode_valid = rcar_hdmi_mode_valid,
 	.configure_phy	= rcar_hdmi_phy_configure,
 };
 
-- 
Regards,

Laurent Pinchart
