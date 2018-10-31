Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:44413 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728930AbeJaVz6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 17:55:58 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Inki Dae <inki.dae@samsung.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [RFC] drm/bridge/sii902x: Fix EDID readback
Date: Wed, 31 Oct 2018 12:57:46 +0000
Message-Id: <1540990667-14109-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

While adding SiI9022A support to the iwg23s board it came up
that when the HDMI transmitter is in pass through mode the
device is not compliant with the I2C specification anymore,
as it requires a far bigger tbuf due to a delay the HDMI
transmitter is adding when relaying the STOP condition on the
monitor i2c side of things. When not providing an appropriate
delay after the STOP condition the i2c bus would get stuck.
Also, any other traffic on the bus while talking to the monitor
may cause the transaction to fail or even cause issues with the
i2c bus as well.
I2c-gates seemed to reach consent as a possible way to address
these issues, and as such this patch is implementing a solution
based on that. Since others are clearly relying on the current
implementation of the driver, this patch won't require any DT
changes.
Since we don't want any interference during the DDC Bus
Request/Grant procedure and while talking to the monitor, we have
to use the adapter locking primitives rather than the i2c-mux
locking primitives, but in order to achieve that I had to get
rid of regmap.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
Dear All,

this is a follow up to:
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg32072.html

Comments very welcome!

Thanks,
Fab

 drivers/gpu/drm/bridge/sii902x.c | 404 ++++++++++++++++++++++++++-------------
 1 file changed, 274 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index e59a135..137a05a 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -21,9 +21,9 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/i2c-mux.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/regmap.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
@@ -82,12 +82,130 @@
 
 struct sii902x {
 	struct i2c_client *i2c;
-	struct regmap *regmap;
 	struct drm_bridge bridge;
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
+	struct i2c_mux_core *i2cmux;
 };
 
+static int sii902x_transfer_read(struct i2c_client *i2c, u8 reg, u8 *val,
+				 u16 len, bool locked)
+{
+	struct i2c_msg xfer[] = {
+		{
+			.addr = i2c->addr,
+			.flags = 0,
+			.len = 1,
+			.buf = &reg,
+		}, {
+			.addr = i2c->addr,
+			.flags = I2C_M_RD,
+			.len = len,
+			.buf = val,
+		}
+	};
+	unsigned char xfers = ARRAY_SIZE(xfer);
+	int ret, retries = 5;
+
+	do {
+		if (locked)
+			ret = i2c_transfer(i2c->adapter, xfer, xfers);
+		else
+			ret = __i2c_transfer(i2c->adapter, xfer, xfers);
+		if (ret < 0)
+			return ret;
+	} while (ret != xfers && --retries);
+	return ret == xfers ? 0 : -1;
+}
+
+static int sii902x_bulk_read(struct i2c_client *i2c, u8 reg, u8 *val, u16 len)
+{
+	return sii902x_transfer_read(i2c, reg, val, len, true);
+}
+
+static int __sii902x_bulk_read(struct i2c_client *i2c, u8 reg, u8 *val, u16 len)
+{
+	return sii902x_transfer_read(i2c, reg, val, len, false);
+}
+
+static int sii902x_read(struct i2c_client *i2c, u8 reg, u8 *val)
+{
+	return sii902x_bulk_read(i2c, reg, val, 1);
+}
+
+static int __sii902x_read(struct i2c_client *i2c, u8 reg, u8 *val)
+{
+	return __sii902x_bulk_read(i2c, reg, val, 1);
+}
+
+static int sii902x_transfer_write(struct i2c_client *i2c, u8 *val,
+				 u16 len, bool locked)
+{
+	struct i2c_msg xfer = {
+		.addr = i2c->addr,
+		.flags = 0,
+		.len = len,
+		.buf = val,
+	};
+	int ret, retries = 5;
+
+	do {
+		if (locked)
+			ret = i2c_transfer(i2c->adapter, &xfer, 1);
+		else
+			ret = __i2c_transfer(i2c->adapter, &xfer, 1);
+		if (ret < 0)
+			return ret;
+	} while (!ret && --retries);
+	return !ret ? -1 : 0;
+}
+
+static int sii902x_bulk_write(struct i2c_client *i2c, u8 *val, u16 len)
+{
+	return sii902x_transfer_write(i2c, val, len, true);
+}
+
+static int sii902x_write(struct i2c_client *i2c, u8 reg, u8 val)
+{
+	u8 data[2] = {reg, val};
+
+	return sii902x_transfer_write(i2c, data, 2, true);
+}
+
+static int __sii902x_write(struct i2c_client *i2c, u8 reg, u8 val)
+{
+	u8 data[2] = {reg, val};
+
+	return sii902x_transfer_write(i2c, data, 2, false);
+}
+
+static int sii902x_update_bits(struct i2c_client *i2c, u8 reg, u8 mask, u8 val)
+{
+	int ret;
+	u8 status;
+
+	ret = sii902x_read(i2c, reg, &status);
+	if (ret)
+		return ret;
+	status &= ~mask;
+	status |= val & mask;
+	return sii902x_write(i2c, reg, status);
+}
+
+static int __sii902x_update_bits(struct i2c_client *i2c, u8 reg, u8 mask,
+				 u8 val)
+{
+	int ret;
+	u8 status;
+
+	ret = __sii902x_read(i2c, reg, &status);
+	if (ret)
+		return ret;
+	status &= ~mask;
+	status |= val & mask;
+	return __sii902x_write(i2c, reg, status);
+}
+
 static inline struct sii902x *bridge_to_sii902x(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct sii902x, bridge);
@@ -115,9 +233,9 @@ static enum drm_connector_status
 sii902x_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct sii902x *sii902x = connector_to_sii902x(connector);
-	unsigned int status;
+	u8 status;
 
-	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
+	sii902x_read(sii902x->i2c, SII902X_INT_STATUS, &status);
 
 	return (status & SII902X_PLUGGED_STATUS) ?
 	       connector_status_connected : connector_status_disconnected;
@@ -135,41 +253,11 @@ static const struct drm_connector_funcs sii902x_connector_funcs = {
 static int sii902x_get_modes(struct drm_connector *connector)
 {
 	struct sii902x *sii902x = connector_to_sii902x(connector);
-	struct regmap *regmap = sii902x->regmap;
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	struct device *dev = &sii902x->i2c->dev;
-	unsigned long timeout;
-	unsigned int retries;
-	unsigned int status;
 	struct edid *edid;
-	int num = 0;
-	int ret;
-
-	ret = regmap_update_bits(regmap, SII902X_SYS_CTRL_DATA,
-				 SII902X_SYS_CTRL_DDC_BUS_REQ,
-				 SII902X_SYS_CTRL_DDC_BUS_REQ);
-	if (ret)
-		return ret;
+	int num = 0, ret;
 
-	timeout = jiffies +
-		  msecs_to_jiffies(SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS);
-	do {
-		ret = regmap_read(regmap, SII902X_SYS_CTRL_DATA, &status);
-		if (ret)
-			return ret;
-	} while (!(status & SII902X_SYS_CTRL_DDC_BUS_GRTD) &&
-		 time_before(jiffies, timeout));
-
-	if (!(status & SII902X_SYS_CTRL_DDC_BUS_GRTD)) {
-		dev_err(dev, "failed to acquire the i2c bus\n");
-		return -ETIMEDOUT;
-	}
-
-	ret = regmap_write(regmap, SII902X_SYS_CTRL_DATA, status);
-	if (ret)
-		return ret;
-
-	edid = drm_get_edid(connector, sii902x->i2c->adapter);
+	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
 	drm_connector_update_edid_property(connector, edid);
 	if (edid) {
 		num = drm_add_edid_modes(connector, edid);
@@ -181,42 +269,6 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	if (ret)
 		return ret;
 
-	/*
-	 * Sometimes the I2C bus can stall after failure to use the
-	 * EDID channel. Retry a few times to see if things clear
-	 * up, else continue anyway.
-	 */
-	retries = 5;
-	do {
-		ret = regmap_read(regmap, SII902X_SYS_CTRL_DATA,
-				  &status);
-		retries--;
-	} while (ret && retries);
-	if (ret)
-		dev_err(dev, "failed to read status (%d)\n", ret);
-
-	ret = regmap_update_bits(regmap, SII902X_SYS_CTRL_DATA,
-				 SII902X_SYS_CTRL_DDC_BUS_REQ |
-				 SII902X_SYS_CTRL_DDC_BUS_GRTD, 0);
-	if (ret)
-		return ret;
-
-	timeout = jiffies +
-		  msecs_to_jiffies(SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS);
-	do {
-		ret = regmap_read(regmap, SII902X_SYS_CTRL_DATA, &status);
-		if (ret)
-			return ret;
-	} while (status & (SII902X_SYS_CTRL_DDC_BUS_REQ |
-			   SII902X_SYS_CTRL_DDC_BUS_GRTD) &&
-		 time_before(jiffies, timeout));
-
-	if (status & (SII902X_SYS_CTRL_DDC_BUS_REQ |
-		      SII902X_SYS_CTRL_DDC_BUS_GRTD)) {
-		dev_err(dev, "failed to release the i2c bus\n");
-		return -ETIMEDOUT;
-	}
-
 	return num;
 }
 
@@ -237,20 +289,20 @@ static void sii902x_bridge_disable(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
-	regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
-			   SII902X_SYS_CTRL_PWR_DWN,
-			   SII902X_SYS_CTRL_PWR_DWN);
+	sii902x_update_bits(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+			    SII902X_SYS_CTRL_PWR_DWN,
+			    SII902X_SYS_CTRL_PWR_DWN);
 }
 
 static void sii902x_bridge_enable(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
-	regmap_update_bits(sii902x->regmap, SII902X_PWR_STATE_CTRL,
-			   SII902X_AVI_POWER_STATE_MSK,
-			   SII902X_AVI_POWER_STATE_D(0));
-	regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
-			   SII902X_SYS_CTRL_PWR_DWN, 0);
+	sii902x_update_bits(sii902x->i2c, SII902X_PWR_STATE_CTRL,
+			    SII902X_AVI_POWER_STATE_MSK,
+			    SII902X_AVI_POWER_STATE_D(0));
+	sii902x_update_bits(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+			    SII902X_SYS_CTRL_PWR_DWN, 0);
 }
 
 static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
@@ -258,25 +310,25 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 				    struct drm_display_mode *adj)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
-	struct regmap *regmap = sii902x->regmap;
-	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
+	u8 buf[HDMI_INFOFRAME_SIZE(AVI) + 1];
 	struct hdmi_avi_infoframe frame;
 	int ret;
 
-	buf[0] = adj->clock;
-	buf[1] = adj->clock >> 8;
-	buf[2] = adj->vrefresh;
-	buf[3] = 0x00;
-	buf[4] = adj->hdisplay;
-	buf[5] = adj->hdisplay >> 8;
-	buf[6] = adj->vdisplay;
-	buf[7] = adj->vdisplay >> 8;
-	buf[8] = SII902X_TPI_CLK_RATIO_1X | SII902X_TPI_AVI_PIXEL_REP_NONE |
+	buf[0] = SII902X_TPI_VIDEO_DATA;
+	buf[1] = adj->clock;
+	buf[2] = adj->clock >> 8;
+	buf[3] = adj->vrefresh;
+	buf[4] = 0x00;
+	buf[5] = adj->hdisplay;
+	buf[6] = adj->hdisplay >> 8;
+	buf[7] = adj->vdisplay;
+	buf[8] = adj->vdisplay >> 8;
+	buf[9] = SII902X_TPI_CLK_RATIO_1X | SII902X_TPI_AVI_PIXEL_REP_NONE |
 		 SII902X_TPI_AVI_PIXEL_REP_BUS_24BIT;
-	buf[9] = SII902X_TPI_AVI_INPUT_RANGE_AUTO |
-		 SII902X_TPI_AVI_INPUT_COLORSPACE_RGB;
+	buf[10] = SII902X_TPI_AVI_INPUT_RANGE_AUTO |
+		  SII902X_TPI_AVI_INPUT_COLORSPACE_RGB;
 
-	ret = regmap_bulk_write(regmap, SII902X_TPI_VIDEO_DATA, buf, 10);
+	ret = sii902x_bulk_write(sii902x->i2c, buf, 11);
 	if (ret)
 		return;
 
@@ -286,16 +338,17 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 		return;
 	}
 
-	ret = hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
+	ret = hdmi_avi_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
 	if (ret < 0) {
 		DRM_ERROR("failed to pack AVI infoframe: %d\n", ret);
 		return;
 	}
 
+	buf[0] = SII902X_TPI_AVI_INFOFRAME;
 	/* Do not send the infoframe header, but keep the CRC field. */
-	regmap_bulk_write(regmap, SII902X_TPI_AVI_INFOFRAME,
-			  buf + HDMI_INFOFRAME_HEADER_SIZE - 1,
-			  HDMI_AVI_INFOFRAME_SIZE + 1);
+	sii902x_bulk_write(sii902x->i2c,
+			   buf + HDMI_INFOFRAME_HEADER_SIZE,
+			   HDMI_AVI_INFOFRAME_SIZE + 1);
 }
 
 static int sii902x_bridge_attach(struct drm_bridge *bridge)
@@ -336,29 +389,13 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.enable = sii902x_bridge_enable,
 };
 
-static const struct regmap_range sii902x_volatile_ranges[] = {
-	{ .range_min = 0, .range_max = 0xff },
-};
-
-static const struct regmap_access_table sii902x_volatile_table = {
-	.yes_ranges = sii902x_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(sii902x_volatile_ranges),
-};
-
-static const struct regmap_config sii902x_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.volatile_table = &sii902x_volatile_table,
-	.cache_type = REGCACHE_NONE,
-};
-
 static irqreturn_t sii902x_interrupt(int irq, void *data)
 {
 	struct sii902x *sii902x = data;
-	unsigned int status = 0;
+	u8 status = 0;
 
-	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
-	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
+	sii902x_read(sii902x->i2c, SII902X_INT_STATUS, &status);
+	sii902x_write(sii902x->i2c, SII902X_INT_STATUS, status);
 
 	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
 		drm_helper_hpd_irq_event(sii902x->bridge.dev);
@@ -366,23 +403,111 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int sii902x_i2c_bypass_select(struct i2c_mux_core *mux, u32 chan_id)
+{
+	struct sii902x *sii902x = i2c_mux_priv(mux);
+	struct device *dev = &sii902x->i2c->dev;
+	unsigned long timeout;
+	u8 status;
+	int ret;
+
+	ret = __sii902x_update_bits(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+				    SII902X_SYS_CTRL_DDC_BUS_REQ,
+				    SII902X_SYS_CTRL_DDC_BUS_REQ);
+
+	timeout = jiffies +
+		  msecs_to_jiffies(SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS);
+	do {
+		ret = __sii902x_read(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+				     &status);
+		if (ret)
+			return ret;
+	} while (!(status & SII902X_SYS_CTRL_DDC_BUS_GRTD) &&
+		 time_before(jiffies, timeout));
+
+	if (!(status & SII902X_SYS_CTRL_DDC_BUS_GRTD)) {
+		dev_err(dev, "Failed to acquire the i2c bus\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = __sii902x_write(sii902x->i2c, SII902X_SYS_CTRL_DATA, status);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static int sii902x_i2c_bypass_deselect(struct i2c_mux_core *mux, u32 chan_id)
+{
+	struct sii902x *sii902x = i2c_mux_priv(mux);
+	struct device *dev = &sii902x->i2c->dev;
+	unsigned long timeout;
+	unsigned int retries;
+	u8 status;
+	int ret;
+
+	udelay(30);
+
+	/*
+	 * Sometimes the I2C bus can stall after failure to use the
+	 * EDID channel. Retry a few times to see if things clear
+	 * up, else continue anyway.
+	 */
+	retries = 5;
+	do {
+		ret = __sii902x_read(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+				     &status);
+		retries--;
+	} while (ret && retries);
+	if (ret) {
+		dev_err(dev, "failed to read status (%d)\n", ret);
+		return ret;
+	}
+
+	ret = __sii902x_update_bits(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+				    SII902X_SYS_CTRL_DDC_BUS_REQ |
+				    SII902X_SYS_CTRL_DDC_BUS_GRTD, 0);
+	if (ret)
+		return ret;
+
+	timeout = jiffies +
+		  msecs_to_jiffies(SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS);
+	do {
+		ret = __sii902x_read(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+				     &status);
+		if (ret)
+			return ret;
+	} while (status & (SII902X_SYS_CTRL_DDC_BUS_REQ |
+			   SII902X_SYS_CTRL_DDC_BUS_GRTD) &&
+		 time_before(jiffies, timeout));
+
+	if (status & (SII902X_SYS_CTRL_DDC_BUS_REQ |
+		      SII902X_SYS_CTRL_DDC_BUS_GRTD)) {
+		dev_err(dev, "failed to release the i2c bus\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static int sii902x_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	unsigned int status = 0;
 	struct sii902x *sii902x;
-	u8 chipid[4];
+	u8 chipid[4], status = 0;
 	int ret;
 
+	ret = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
+	if (!ret) {
+		dev_err(dev, "I2C adapter not suitable\n");
+		return -EIO;
+	}
+
 	sii902x = devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
 	if (!sii902x)
 		return -ENOMEM;
 
 	sii902x->i2c = client;
-	sii902x->regmap = devm_regmap_init_i2c(client, &sii902x_regmap_config);
-	if (IS_ERR(sii902x->regmap))
-		return PTR_ERR(sii902x->regmap);
 
 	sii902x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						      GPIOD_OUT_LOW);
@@ -394,14 +519,14 @@ static int sii902x_probe(struct i2c_client *client,
 
 	sii902x_reset(sii902x);
 
-	ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
+	ret = sii902x_write(sii902x->i2c, SII902X_REG_TPI_RQB, 0x0);
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(sii902x->regmap, SII902X_REG_CHIPID(0),
-			       &chipid, 4);
+	ret = sii902x_bulk_read(sii902x->i2c, SII902X_REG_CHIPID(0),
+				chipid, 4);
 	if (ret) {
-		dev_err(dev, "regmap_read failed %d\n", ret);
+		dev_err(dev, "Can't read chipid (error = %d)\n", ret);
 		return ret;
 	}
 
@@ -412,12 +537,12 @@ static int sii902x_probe(struct i2c_client *client,
 	}
 
 	/* Clear all pending interrupts */
-	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
-	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
+	sii902x_read(sii902x->i2c, SII902X_INT_STATUS, &status);
+	sii902x_write(sii902x->i2c, SII902X_INT_STATUS, status);
 
 	if (client->irq > 0) {
-		regmap_write(sii902x->regmap, SII902X_INT_ENABLE,
-			     SII902X_HOTPLUG_EVENT);
+		sii902x_write(sii902x->i2c, SII902X_INT_ENABLE,
+			      SII902X_HOTPLUG_EVENT);
 
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
 						sii902x_interrupt,
@@ -433,6 +558,22 @@ static int sii902x_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, sii902x);
 
+	sii902x->i2cmux = i2c_mux_alloc(client->adapter, dev,
+					1, 0, I2C_MUX_GATE,
+					sii902x_i2c_bypass_select,
+					sii902x_i2c_bypass_deselect);
+	if (!sii902x->i2cmux) {
+		dev_err(dev, "failed to allocate I2C mux\n");
+		return -ENOMEM;
+	}
+
+	sii902x->i2cmux->priv = sii902x;
+	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
+	if (ret) {
+		dev_err(dev, "Couldn't add i2c mux adapter\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -441,6 +582,9 @@ static int sii902x_remove(struct i2c_client *client)
 {
 	struct sii902x *sii902x = i2c_get_clientdata(client);
 
+	if (sii902x->i2cmux)
+		i2c_mux_del_adapters(sii902x->i2cmux);
+
 	drm_bridge_remove(&sii902x->bridge);
 
 	return 0;
-- 
2.7.4
