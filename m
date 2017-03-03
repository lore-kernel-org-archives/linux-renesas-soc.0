Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40935 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752263AbdCCR3S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 12:29:18 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Archit Taneja <architt@codeaurora.org>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 03/10] drm: bridge: dw-hdmi: Enable CSC even for DVI
Date: Fri,  3 Mar 2017 19:20:00 +0200
Message-Id: <20170303172007.26541-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Neil Armstrong <narmstrong@baylibre.com>

If the input pixel format is not RGB, the CSC must be enabled in order to
provide valid pixel to DVI sinks.
This patch removes the hdmi only dependency on the CSC enabling.

Reviewed-by: Jose Abreu <joabreu@synopsys.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 906583beb08b..d863b3393aee 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1291,8 +1291,8 @@ static void dw_hdmi_enable_video_path(struct dw_hdmi *hdmi)
 		hdmi_writeb(hdmi, clkdis, HDMI_MC_CLKDIS);
 	}
 
-	/* Enable color space conversion if needed (for HDMI sinks only). */
-	if (hdmi->sink_is_hdmi && is_color_space_conversion(hdmi))
+	/* Enable color space conversion if needed */
+	if (is_color_space_conversion(hdmi))
 		hdmi_writeb(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
 			    HDMI_MC_FLOWCTRL);
 	else
-- 
Regards,

Laurent Pinchart
