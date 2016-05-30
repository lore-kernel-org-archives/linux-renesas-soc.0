Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35870 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QAn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:00:43 -0400
Received: by mail-lf0-f65.google.com with SMTP id h68so7203087lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:00:42 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 02/21] drm: i2c: adv7511: Convert to drm_bridge
Date: Mon, 30 May 2016 18:00:01 +0200
Message-Id: <1464624020-27709-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Archit Taneja <architt@codeaurora.org>

We don't want to use the old i2c slave encoder interface anymore.

Remove that and make the i2c driver create a drm_bridge entity instead.
Converting to bridges helps because the kms drivers don't need to
exract encoder slave ops from this driver and use it within their
own encoder/connector ops.

The driver now creates its own connector when a kms driver attaches
itself to the bridge. Therefore, kms drivers don't need to create
their own connectors anymore.

The old encoder slave ops are now used by the new bridge and connector
entities.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/i2c/adv7511.c | 224 ++++++++++++++++++++++++++++--------------
 1 file changed, 150 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/i2c/adv7511.c b/drivers/gpu/drm/i2c/adv7511.c
index a02112b..a104b43 100644
--- a/drivers/gpu/drm/i2c/adv7511.c
+++ b/drivers/gpu/drm/i2c/adv7511.c
@@ -16,7 +16,8 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_encoder_slave.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "adv7511.h"
 
@@ -36,7 +37,8 @@ struct adv7511 {
 	bool edid_read;
 
 	wait_queue_head_t wq;
-	struct drm_encoder *encoder;
+	struct drm_bridge bridge;
+	struct drm_connector connector;
 
 	bool embedded_sync;
 	enum adv7511_sync_polarity vsync_polarity;
@@ -48,11 +50,6 @@ struct adv7511 {
 	struct gpio_desc *gpio_pd;
 };
 
-static struct adv7511 *encoder_to_adv7511(struct drm_encoder *encoder)
-{
-	return to_encoder_slave(encoder)->slave_priv;
-}
-
 /* ADI recommended values for proper operation. */
 static const struct reg_sequence adv7511_fixed_registers[] = {
 	{ 0x98, 0x03 },
@@ -446,8 +443,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511)
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
 
-	if (irq0 & ADV7511_INT0_HPD && adv7511->encoder)
-		drm_helper_hpd_irq_event(adv7511->encoder->dev);
+	if (irq0 & ADV7511_INT0_HPD && adv7511->bridge.dev)
+		drm_helper_hpd_irq_event(adv7511->bridge.dev);
 
 	if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
 		adv7511->edid_read = true;
@@ -563,13 +560,12 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 }
 
 /* -----------------------------------------------------------------------------
- * Encoder operations
+ * ADV75xx helpers
  */
 
-static int adv7511_get_modes(struct drm_encoder *encoder,
+static int adv7511_get_modes(struct adv7511 *adv7511,
 			     struct drm_connector *connector)
 {
-	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
 	struct edid *edid;
 	unsigned int count;
 
@@ -606,21 +602,9 @@ static int adv7511_get_modes(struct drm_encoder *encoder,
 	return count;
 }
 
-static void adv7511_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
-
-	if (mode == DRM_MODE_DPMS_ON)
-		adv7511_power_on(adv7511);
-	else
-		adv7511_power_off(adv7511);
-}
-
 static enum drm_connector_status
-adv7511_encoder_detect(struct drm_encoder *encoder,
-		       struct drm_connector *connector)
+adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 {
-	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
 	enum drm_connector_status status;
 	unsigned int val;
 	bool hpd;
@@ -644,7 +628,7 @@ adv7511_encoder_detect(struct drm_encoder *encoder,
 	if (status == connector_status_connected && hpd && adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
-		adv7511_get_modes(encoder, connector);
+		adv7511_get_modes(adv7511, connector);
 		if (adv7511->status == connector_status_connected)
 			status = connector_status_disconnected;
 	} else {
@@ -658,8 +642,8 @@ adv7511_encoder_detect(struct drm_encoder *encoder,
 	return status;
 }
 
-static int adv7511_encoder_mode_valid(struct drm_encoder *encoder,
-				      struct drm_display_mode *mode)
+static int adv7511_mode_valid(struct adv7511 *adv7511,
+			      struct drm_display_mode *mode)
 {
 	if (mode->clock > 165000)
 		return MODE_CLOCK_HIGH;
@@ -667,11 +651,10 @@ static int adv7511_encoder_mode_valid(struct drm_encoder *encoder,
 	return MODE_OK;
 }
 
-static void adv7511_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adj_mode)
+static void adv7511_mode_set(struct adv7511 *adv7511,
+			     struct drm_display_mode *mode,
+			     struct drm_display_mode *adj_mode)
 {
-	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
 	unsigned int low_refresh_rate;
 	unsigned int hsync_polarity = 0;
 	unsigned int vsync_polarity = 0;
@@ -762,12 +745,122 @@ static void adv7511_encoder_mode_set(struct drm_encoder *encoder,
 	adv7511->f_tmds = mode->clock;
 }
 
-static const struct drm_encoder_slave_funcs adv7511_encoder_funcs = {
-	.dpms = adv7511_encoder_dpms,
-	.mode_valid = adv7511_encoder_mode_valid,
-	.mode_set = adv7511_encoder_mode_set,
-	.detect = adv7511_encoder_detect,
-	.get_modes = adv7511_get_modes,
+/* Connector funcs */
+static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
+{
+	return container_of(connector, struct adv7511, connector);
+}
+
+static int adv7511_connector_get_modes(struct drm_connector *connector)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv7511_get_modes(adv, connector);
+}
+
+static struct drm_encoder *
+adv7511_connector_best_encoder(struct drm_connector *connector)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv->bridge.encoder;
+}
+
+static enum drm_mode_status
+adv7511_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv7511_mode_valid(adv, mode);
+}
+
+static struct drm_connector_helper_funcs adv7511_connector_helper_funcs = {
+	.get_modes = adv7511_connector_get_modes,
+	.best_encoder = adv7511_connector_best_encoder,
+	.mode_valid = adv7511_connector_mode_valid,
+};
+
+static enum drm_connector_status
+adv7511_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv7511_detect(adv, connector);
+}
+
+static struct drm_connector_funcs adv7511_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = adv7511_connector_detect,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* Bridge funcs */
+static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct adv7511, bridge);
+}
+
+static void adv7511_bridge_enable(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	adv7511_power_on(adv);
+}
+
+static void adv7511_bridge_disable(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	adv7511_power_off(adv);
+}
+
+static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
+				    struct drm_display_mode *mode,
+				    struct drm_display_mode *adj_mode)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	adv7511_mode_set(adv, mode, adj_mode);
+}
+
+static int adv7511_bridge_attach(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(bridge->dev, &adv->connector,
+				 &adv7511_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+	drm_connector_helper_add(&adv->connector,
+				 &adv7511_connector_helper_funcs);
+	drm_mode_connector_attach_encoder(&adv->connector, bridge->encoder);
+
+	drm_helper_hpd_irq_event(adv->connector.dev);
+
+	return ret;
+}
+
+static struct drm_bridge_funcs adv7511_bridge_funcs = {
+	.enable = adv7511_bridge_enable,
+	.disable = adv7511_bridge_disable,
+	.mode_set = adv7511_bridge_mode_set,
+	.attach = adv7511_bridge_attach,
 };
 
 /* -----------------------------------------------------------------------------
@@ -944,6 +1037,15 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 	adv7511_set_link_config(adv7511, &link_config);
 
+	adv7511->bridge.funcs = &adv7511_bridge_funcs;
+	adv7511->bridge.of_node = dev->of_node;
+
+	ret = drm_bridge_add(&adv7511->bridge);
+	if (ret) {
+		dev_err(dev, "failed to add adv7511 bridge\n");
+		goto err_i2c_unregister_device;
+	}
+
 	return 0;
 
 err_i2c_unregister_device:
@@ -956,6 +1058,8 @@ static int adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
+	drm_bridge_remove(&adv7511->bridge);
+
 	i2c_unregister_device(adv7511->i2c_edid);
 
 	kfree(adv7511->edid);
@@ -963,20 +1067,6 @@ static int adv7511_remove(struct i2c_client *i2c)
 	return 0;
 }
 
-static int adv7511_encoder_init(struct i2c_client *i2c, struct drm_device *dev,
-				struct drm_encoder_slave *encoder)
-{
-
-	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
-
-	encoder->slave_priv = adv7511;
-	encoder->slave_funcs = &adv7511_encoder_funcs;
-
-	adv7511->encoder = &encoder->base;
-
-	return 0;
-}
-
 static const struct i2c_device_id adv7511_i2c_ids[] = {
 	{ "adv7511", 0 },
 	{ "adv7511w", 0 },
@@ -993,31 +1083,17 @@ static const struct of_device_id adv7511_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, adv7511_of_ids);
 
-static struct drm_i2c_encoder_driver adv7511_driver = {
-	.i2c_driver = {
-		.driver = {
-			.name = "adv7511",
-			.of_match_table = adv7511_of_ids,
-		},
-		.id_table = adv7511_i2c_ids,
-		.probe = adv7511_probe,
-		.remove = adv7511_remove,
+static struct i2c_driver adv7511_driver = {
+	.driver = {
+		.name = "adv7511",
+		.of_match_table = adv7511_of_ids,
 	},
-
-	.encoder_init = adv7511_encoder_init,
+	.id_table = adv7511_i2c_ids,
+	.probe = adv7511_probe,
+	.remove = adv7511_remove,
 };
 
-static int __init adv7511_init(void)
-{
-	return drm_i2c_encoder_register(THIS_MODULE, &adv7511_driver);
-}
-module_init(adv7511_init);
-
-static void __exit adv7511_exit(void)
-{
-	drm_i2c_encoder_unregister(&adv7511_driver);
-}
-module_exit(adv7511_exit);
+module_i2c_driver(adv7511_driver);
 
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("ADV7511 HDMI transmitter driver");
-- 
2.7.4
