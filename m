Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42781 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752464AbdFSRFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:36 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 04/12] media: i2c: mt9m111: Add source pad
Date: Mon, 19 Jun 2017 19:04:41 +0200
Message-Id: <1497891889-8038-5-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a single source pad to mt9m111 media entity.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/mt9m111.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 8e86d51..7e70969 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -141,6 +141,8 @@
 #define MT9M111_MAX_HEIGHT	1024
 #define MT9M111_MAX_WIDTH	1280
 
+#define MT9M111_MEDIA_PAD	1
+
 struct mt9m111_context {
 	u16 read_mode;
 	u16 blanking_h;
@@ -215,6 +217,8 @@ struct mt9m111 {
 	int power_count;
 	const struct mt9m111_datafmt *fmt;
 	int lastpage;	/* PageMap cache value */
+
+	struct media_pad pad;
 };
 
 /* Find a data format by a pixel code */
@@ -963,13 +967,23 @@ static int mt9m111_probe(struct i2c_client *client,
 	if (ret < 0)
 		goto out_hdlfree;
 
+	mt9m111->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&mt9m111->subdev.entity, MT9M111_MEDIA_PAD,
+				     &mt9m111->pad);
+	if (ret)
+		goto out_hdlfree;
+
 	mt9m111->subdev.dev = &client->dev;
+	mt9m111->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	mt9m111->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = v4l2_async_register_subdev(&mt9m111->subdev);
 	if (ret < 0)
-		goto out_hdlfree;
+		goto out_mediafree;
 
 	return 0;
 
+out_mediafree:
+	media_entity_cleanup(&mt9m111->subdev.entity);
 out_hdlfree:
 	v4l2_ctrl_handler_free(&mt9m111->hdl);
 out_clkput:
@@ -982,6 +996,7 @@ static int mt9m111_remove(struct i2c_client *client)
 {
 	struct mt9m111 *mt9m111 = to_mt9m111(client);
 
+	media_entity_cleanup(&mt9m111->subdev.entity);
 	v4l2_async_unregister_subdev(&mt9m111->subdev);
 	v4l2_clk_put(mt9m111->clk);
 	v4l2_ctrl_handler_free(&mt9m111->hdl);
-- 
2.7.4
