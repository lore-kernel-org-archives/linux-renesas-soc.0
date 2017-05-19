Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47576 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752916AbdESQDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 12:03:20 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v4 7/8] media: i2c: tw9910: Remove soc_camera dependencies
Date: Fri, 19 May 2017 18:02:59 +0200
Message-Id: <1495209780-27342-8-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
References: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove soc_camera framework dependencies from TW9910 driver.
TODO: move the driver out from soc_camera directory

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/soc_camera/tw9910.c | 68 +++++++++++++++++++++++------------
 include/media/i2c/tw9910.h            |  6 ++++
 2 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/soc_camera/tw9910.c b/drivers/media/i2c/soc_camera/tw9910.c
index c9c49ed..6809939 100644
--- a/drivers/media/i2c/soc_camera/tw9910.c
+++ b/drivers/media/i2c/soc_camera/tw9910.c
@@ -16,6 +16,7 @@
  * published by the Free Software Foundation.
  */

+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -25,9 +26,7 @@
 #include <linux/v4l2-mediabus.h>
 #include <linux/videodev2.h>

-#include <media/soc_camera.h>
 #include <media/i2c/tw9910.h>
-#include <media/v4l2-clk.h>
 #include <media/v4l2-subdev.h>

 #define GET_ID(val)  ((val & 0xF8) >> 3)
@@ -228,7 +227,7 @@ struct tw9910_scale_ctrl {

 struct tw9910_priv {
 	struct v4l2_subdev		subdev;
-	struct v4l2_clk			*clk;
+	struct clk			*clk;
 	struct tw9910_video_info	*info;
 	const struct tw9910_scale_ctrl	*scale;
 	v4l2_std_id			norm;
@@ -582,13 +581,37 @@ static int tw9910_s_register(struct v4l2_subdev *sd,
 }
 #endif

+static int tw9910_power_on(struct tw9910_priv *priv)
+{
+	int ret;
+
+	if (priv->info->platform_enable) {
+		ret = priv->info->platform_enable();
+		if (ret)
+			return ret;
+	}
+
+       /*  drivers/sh/clk/core.c returns -EINVAL if clk is NULL */
+	return clk_enable(priv->clk) <= 0 ? 0 : 1;
+}
+
+static int tw9910_power_off(struct tw9910_priv *priv)
+{
+	if (priv->info->platform_enable)
+		priv->info->platform_disable();
+
+	clk_disable(priv->clk);
+
+	return 0;
+}
+
 static int tw9910_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
 	struct tw9910_priv *priv = to_tw9910(client);

-	return soc_camera_set_power(&client->dev, ssdd, priv->clk, on);
+	return on ? tw9910_power_on(priv) :
+		    tw9910_power_off(priv);
 }

 static int tw9910_set_frame(struct v4l2_subdev *sd, u32 *width, u32 *height)
@@ -614,7 +637,7 @@ static int tw9910_set_frame(struct v4l2_subdev *sd, u32 *width, u32 *height)
 	 * set bus width
 	 */
 	val = 0x00;
-	if (SOCAM_DATAWIDTH_16 == priv->info->buswidth)
+	if (priv->info->buswidth == TW9910_DATAWIDTH_16)
 		val = LEN;

 	ret = tw9910_mask_set(client, OPFORM, LEN, val);
@@ -799,8 +822,8 @@ static int tw9910_video_probe(struct i2c_client *client)
 	/*
 	 * tw9910 only use 8 or 16 bit bus width
 	 */
-	if (SOCAM_DATAWIDTH_16 != priv->info->buswidth &&
-	    SOCAM_DATAWIDTH_8  != priv->info->buswidth) {
+	if (priv->info->buswidth != TW9910_DATAWIDTH_16 &&
+	    priv->info->buswidth != TW9910_DATAWIDTH_8) {
 		dev_err(&client->dev, "bus width error\n");
 		return -ENODEV;
 	}
@@ -859,15 +882,11 @@ static int tw9910_enum_mbus_code(struct v4l2_subdev *sd,
 static int tw9910_g_mbus_config(struct v4l2_subdev *sd,
 				struct v4l2_mbus_config *cfg)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
-
 	cfg->flags = V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_MASTER |
 		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_LOW |
 		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_LOW |
 		V4L2_MBUS_DATA_ACTIVE_HIGH;
 	cfg->type = V4L2_MBUS_PARALLEL;
-	cfg->flags = soc_camera_apply_board_flags(ssdd, cfg);

 	return 0;
 }
@@ -876,9 +895,8 @@ static int tw9910_s_mbus_config(struct v4l2_subdev *sd,
 				const struct v4l2_mbus_config *cfg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
 	u8 val = VSSL_VVALID | HSSL_DVALID;
-	unsigned long flags = soc_camera_apply_board_flags(ssdd, cfg);
+	unsigned long flags = cfg->flags;

 	/*
 	 * set OUTCTR1
@@ -935,15 +953,14 @@ static int tw9910_probe(struct i2c_client *client,
 	struct tw9910_video_info	*info;
 	struct i2c_adapter		*adapter =
 		to_i2c_adapter(client->dev.parent);
-	struct soc_camera_subdev_desc	*ssdd = soc_camera_i2c_to_desc(client);
 	int ret;

-	if (!ssdd || !ssdd->drv_priv) {
+	if (!client->dev.platform_data) {
 		dev_err(&client->dev, "TW9910: missing platform data!\n");
 		return -EINVAL;
 	}

-	info = ssdd->drv_priv;
+	info = client->dev.platform_data;

 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&client->dev,
@@ -959,13 +976,17 @@ static int tw9910_probe(struct i2c_client *client,

 	v4l2_i2c_subdev_init(&priv->subdev, client, &tw9910_subdev_ops);

-	priv->clk = v4l2_clk_get(&client->dev, "mclk");
-	if (IS_ERR(priv->clk))
+	priv->clk = clk_get(&client->dev, "mclk");
+	if (PTR_ERR(priv->clk) == -ENOENT) {
+		priv->clk = NULL;
+	} else if (IS_ERR(priv->clk)) {
+		dev_err(&client->dev, "Unable to get mclk clock\n");
 		return PTR_ERR(priv->clk);
+	}

 	ret = tw9910_video_probe(client);
-	if (ret < 0)
-		v4l2_clk_put(priv->clk);
+	if (ret < 0 && priv->clk)
+		clk_put(priv->clk);

 	return ret;
 }
@@ -973,7 +994,10 @@ static int tw9910_probe(struct i2c_client *client,
 static int tw9910_remove(struct i2c_client *client)
 {
 	struct tw9910_priv *priv = to_tw9910(client);
-	v4l2_clk_put(priv->clk);
+
+	if (priv->clk)
+		clk_put(priv->clk);
+
 	return 0;
 }

diff --git a/include/media/i2c/tw9910.h b/include/media/i2c/tw9910.h
index 90bcf1f..b80e45c 100644
--- a/include/media/i2c/tw9910.h
+++ b/include/media/i2c/tw9910.h
@@ -18,6 +18,9 @@

 #include <media/soc_camera.h>

+#define TW9910_DATAWIDTH_8	BIT(0)
+#define TW9910_DATAWIDTH_16	BIT(1)
+
 enum tw9910_mpout_pin {
 	TW9910_MPO_VLOSS,
 	TW9910_MPO_HLOCK,
@@ -32,6 +35,9 @@ enum tw9910_mpout_pin {
 struct tw9910_video_info {
 	unsigned long		buswidth;
 	enum tw9910_mpout_pin	mpout;
+
+	int (*platform_enable)(void);
+	void (*platform_disable)(void);
 };


--
2.7.4
