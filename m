Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40933 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752245AbdCCR3Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 12:29:16 -0500
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
Subject: [PATCH v5 01/10] drm: bridge: dw-hdmi: Remove unused functions
Date: Fri,  3 Mar 2017 19:19:58 +0200
Message-Id: <20170303172007.26541-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Most of the hdmi_phy_test_*() functions are unused. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
Tested-by: Nickey Yang <nickey.yang@rock-chips.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 9a9ec27d9e28..ce7496399ccf 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -837,32 +837,6 @@ static inline void hdmi_phy_test_clear(struct dw_hdmi *hdmi,
 		  HDMI_PHY_TST0_TSTCLR_MASK, HDMI_PHY_TST0);
 }
 
-static inline void hdmi_phy_test_enable(struct dw_hdmi *hdmi,
-					unsigned char bit)
-{
-	hdmi_modb(hdmi, bit << HDMI_PHY_TST0_TSTEN_OFFSET,
-		  HDMI_PHY_TST0_TSTEN_MASK, HDMI_PHY_TST0);
-}
-
-static inline void hdmi_phy_test_clock(struct dw_hdmi *hdmi,
-				       unsigned char bit)
-{
-	hdmi_modb(hdmi, bit << HDMI_PHY_TST0_TSTCLK_OFFSET,
-		  HDMI_PHY_TST0_TSTCLK_MASK, HDMI_PHY_TST0);
-}
-
-static inline void hdmi_phy_test_din(struct dw_hdmi *hdmi,
-				     unsigned char bit)
-{
-	hdmi_writeb(hdmi, bit, HDMI_PHY_TST1);
-}
-
-static inline void hdmi_phy_test_dout(struct dw_hdmi *hdmi,
-				      unsigned char bit)
-{
-	hdmi_writeb(hdmi, bit, HDMI_PHY_TST2);
-}
-
 static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
 {
 	u32 val;
-- 
Regards,

Laurent Pinchart
