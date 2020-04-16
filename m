Return-Path: <SRS0=W/py=6A=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F02C2D0EF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Apr 2020 10:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 506B521974
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Apr 2020 10:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505132AbgDPKjl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 Apr 2020 06:39:41 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42327 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505353AbgDPKik (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 93FC26000B;
        Thu, 16 Apr 2020 10:38:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 14/20] squash! max9286: Calculate pixel rate
Date:   Thu, 16 Apr 2020 12:40:46 +0200
Message-Id: <20200416104052.2643098-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Calculate the CSI-2 transmitter pixel rate using the one reported from
sources.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 50 +++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 2d71205a1aad..3ef74ba10074 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -430,9 +430,46 @@ static int max9286_check_config_link(struct max9286_priv *priv,
  * V4L2 Subdev
  */
 
-static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
+static int max9286_set_pixelrate(struct max9286_priv *priv)
 {
-	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate, rate);
+	struct max9286_source *source = NULL;
+	u64 pixelrate = 0;
+
+	for_each_source(priv, source) {
+		struct v4l2_ctrl *ctrl;
+		u64 source_rate = 0;
+
+		/* Pixel rate is mandatory to be reported by sources. */
+		ctrl = v4l2_ctrl_find(source->sd->ctrl_handler,
+				      V4L2_CID_PIXEL_RATE);
+		if (!ctrl) {
+			pixelrate = 0;
+			break;
+		}
+
+		/* All source must report the same pixel rate. */
+		source_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
+		if (!pixelrate) {
+			pixelrate = source_rate;
+		} else if (pixelrate != source_rate) {
+			dev_err(&priv->client->dev,
+				"Unable to calculate pixel rate\n");
+			return -EINVAL;
+		}
+	}
+
+	if (!pixelrate) {
+		dev_err(&priv->client->dev,
+			"No pixel rate control available in sources\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * The CSI-2 transmitter pixel rate is the single source rate multiplied
+	 * by the number of available sources.
+	 */
+	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
+				      pixelrate * priv->nsources);
 }
 
 static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
@@ -496,7 +533,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 */
 	max9286_configure_i2c(priv, false);
 
-	return 0;
+	return max9286_set_pixelrate(priv);
 }
 
 static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -670,7 +707,6 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
-	s64 pixelrate;
 
 	if (format->pad >= MAX9286_SRC_PAD)
 		return -EINVAL;
@@ -695,12 +731,6 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	*cfg_fmt = format->format;
 	mutex_unlock(&priv->mutex);
 
-	/* Update pixel rate for the CSI2 receiver */
-	pixelrate = cfg_fmt->width * cfg_fmt->height
-		  * priv->nsources * 30 /*FPS*/;
-
-	max9286_set_pixelrate(priv, pixelrate);
-
 	return 0;
 }
 
-- 
2.26.0

