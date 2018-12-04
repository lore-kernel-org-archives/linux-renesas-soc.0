Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37906 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbeLDQgM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 11:36:12 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH v2] drm: rcar-du: dw-hdmi: Reject modes with a too high clock frequency
Date: Tue,  4 Dec 2018 18:36:40 +0200
Message-Id: <20181204163640.316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Implement a .mode_valid() handler in the R-Car glue layer to reject
modes with an unsupported clock frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

Changes since v1:

- Add a comment to explain where the limit comes from

diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 75490a3e0a2a..603bb340e8cf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -35,6 +35,20 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
 	{ ~0UL,      0x0000, 0x0000, 0x0000 },
 };
 
+static enum drm_mode_status
+rcar_hdmi_mode_valid(struct drm_connector *connector,
+		     const struct drm_display_mode *mode)
+{
+	/*
+	 * The maximum supported clock frequency is 297 MHz, as shown in the PHY
+	 * parameters table.
+	 */
+	if (mode->clock > 297000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
 				   const struct dw_hdmi_plat_data *pdata,
 				   unsigned long mpixelclock)
@@ -59,6 +73,7 @@ static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
 }
 
 static const struct dw_hdmi_plat_data rcar_dw_hdmi_plat_data = {
+	.mode_valid = rcar_hdmi_mode_valid,
 	.configure_phy	= rcar_hdmi_phy_configure,
 };
 
-- 
Regards,

Laurent Pinchart
