Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:40032 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751377AbdKZAjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:39:36 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] rcar-csi2: split Mbps calculation to separate function
Date: Sun, 26 Nov 2017 01:39:17 +0100
Message-Id: <20171126003918.21976-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20171126003918.21976-1-niklas.soderlund+renesas@ragnatech.se>
References: <20171126003918.21976-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The calculation of the Mbps to configured the link with needs to be
split out if other configuration procedures on new SoCs are to be able
to reuse the calculation procedure.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 32 +++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index f1363cc58eb74977..9afbd03d2dedf4cb 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -348,11 +348,8 @@ static int rcar_csi2_wait_phy_start(struct rcar_csi2 *priv)
 	return -ETIMEDOUT;
 }
 
-static int rcar_csi2_calc_phypll(struct rcar_csi2 *priv, unsigned int bpp,
-				 u32 *phypll)
+static int rcar_csi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
 {
-
-	const struct phypll_hsfreqrange *hsfreq;
 	struct media_pad *pad, *source_pad;
 	struct v4l2_subdev *source = NULL;
 	struct v4l2_ctrl *ctrl;
@@ -382,19 +379,26 @@ static int rcar_csi2_calc_phypll(struct rcar_csi2 *priv, unsigned int bpp,
 	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
 	do_div(mbps, priv->lanes * 1000000);
 
+	return mbps;
+}
+
+static int rcar_csi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
+{
+	const struct phypll_hsfreqrange *hsfreq;
+
 	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
 		if (hsfreq->mbps >= mbps)
 			break;
 
 	if (!hsfreq->mbps) {
-		dev_err(priv->dev, "Unsupported PHY speed (%llu Mbps)", mbps);
+		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
 
-	dev_dbg(priv->dev, "PHY HSFREQRANGE requested %llu got %u Mbps\n", mbps,
+	dev_dbg(priv->dev, "PHY HSFREQRANGE requested %u got %u Mbps\n", mbps,
 		hsfreq->mbps);
 
-	*phypll = PHYPLL_HSFREQRANGE(hsfreq->reg);
+	rcar_csi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
 
 	return 0;
 }
@@ -402,10 +406,10 @@ static int rcar_csi2_calc_phypll(struct rcar_csi2 *priv, unsigned int bpp,
 static int rcar_csi2_start(struct rcar_csi2 *priv)
 {
 	const struct rcar_csi2_format *format;
-	u32 phycnt, phypll, tmp;
+	u32 phycnt, tmp;
 	u32 vcdt = 0, vcdt2 = 0;
 	unsigned int i;
-	int ret;
+	int mbps, ret;
 
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
 		priv->mf.width, priv->mf.height,
@@ -447,9 +451,9 @@ static int rcar_csi2_start(struct rcar_csi2 *priv)
 		return -EINVAL;
 	}
 
-	ret = rcar_csi2_calc_phypll(priv, format->bpp, &phypll);
-	if (ret)
-		return ret;
+	mbps = rcar_csi2_calc_mbps(priv, format->bpp);
+	if (mbps < 0)
+		return mbps;
 
 	/* Clear Ultra Low Power interrupt */
 	if (priv->info->clear_ulps)
@@ -490,7 +494,9 @@ static int rcar_csi2_start(struct rcar_csi2 *priv)
 	}
 
 	/* Start */
-	rcar_csi2_write(priv, PHYPLL_REG, phypll);
+	ret = rcar_csi2_set_phypll(priv, mbps);
+	if (ret)
+		return ret;
 
 	/* Set frequency range if we have it */
 	if (priv->info->csi0clkfreqrange)
-- 
2.15.0
