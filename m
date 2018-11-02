Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:41876 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726008AbeKBVVC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:21:02 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>
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
Subject: [PATCH] drm/bridge/sii902x: Fix EDID readback
Date: Fri,  2 Nov 2018 12:13:47 +0000
Message-Id: <1541160827-14255-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

While adding SiI9022A support to the iwg23s board, it came
up that when the HDMI transmitter is in pass through mode the
device is not compliant with the I2C specification anymore,
as it requires a far bigger tbuf, due to a delay the HDMI
transmitter is adding when relaying the STOP condition on the
monitor i2c side of things.

When not providing an appropriate delay after the STOP condition
the i2c bus would get stuck. Also, any other traffic on the bus
while talking to the monitor may cause the transaction to fail
or even cause issues with the i2c bus as well.

I2c-gates seemed to reach consent as a possible way to address
these issues, and as such this patch is implementing a solution
based on that. Since others are clearly relying on the current
implementation of the driver, this patch won't require any DT
changes.

Since we don't want any interference during the DDC Bus
Request/Grant procedure and while talking to the monitor, we
have to use the adapter locking primitives rather than the
i2c-mux locking primitives.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
RFC->PATCH:
* Incorporated Linus Walleij, Peter Rosin, and Mark Brown comments

Thank you guys

 drivers/gpu/drm/bridge/sii902x.c | 264 +++++++++++++++++++++++++++++----------
 1 file changed, 196 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index e59a135..4f9d9c7 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1,4 +1,6 @@
 /*
+ * Copyright (C) 2018 Renesas Electronics
+ *
  * Copyright (C) 2016 Atmel
  *		      Bo Shen <voice.shen@atmel.com>
  *
@@ -21,6 +23,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/i2c-mux.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -86,8 +89,68 @@ struct sii902x {
 	struct drm_bridge bridge;
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
+	struct i2c_mux_core *i2cmux;
 };
 
+static int sii902x_read_unlocked(struct i2c_client *i2c, u8 reg, u8 *val)
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
+			.len = 1,
+			.buf = val,
+		}
+	};
+	unsigned char xfers = ARRAY_SIZE(xfer);
+	int ret, retries = 5;
+
+	do {
+		ret = __i2c_transfer(i2c->adapter, xfer, xfers);
+		if (ret < 0)
+			return ret;
+	} while (ret != xfers && --retries);
+	return ret == xfers ? 0 : -1;
+}
+
+static int sii902x_write_unlocked(struct i2c_client *i2c, u8 reg, u8 val)
+{
+	u8 data[2] = {reg, val};
+	struct i2c_msg xfer = {
+		.addr = i2c->addr,
+		.flags = 0,
+		.len = sizeof(data),
+		.buf = data,
+	};
+	int ret, retries = 5;
+
+	do {
+		ret = __i2c_transfer(i2c->adapter, &xfer, 1);
+		if (ret < 0)
+			return ret;
+	} while (!ret && --retries);
+	return !ret ? -1 : 0;
+}
+
+static int sii902x_update_bits_unlocked(struct i2c_client *i2c, u8 reg, u8 mask,
+					u8 val)
+{
+	int ret;
+	u8 status;
+
+	ret = sii902x_read_unlocked(i2c, reg, &status);
+	if (ret)
+		return ret;
+	status &= ~mask;
+	status |= val & mask;
+	return sii902x_write_unlocked(i2c, reg, status);
+}
+
 static inline struct sii902x *bridge_to_sii902x(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct sii902x, bridge);
@@ -135,41 +198,11 @@ static const struct drm_connector_funcs sii902x_connector_funcs = {
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
-
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
+	int num = 0, ret;
 
-	edid = drm_get_edid(connector, sii902x->i2c->adapter);
+	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
 	drm_connector_update_edid_property(connector, edid);
 	if (edid) {
 		num = drm_add_edid_modes(connector, edid);
@@ -181,42 +214,6 @@ static int sii902x_get_modes(struct drm_connector *connector)
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
 
@@ -366,6 +363,112 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * The purpose of sii902x_i2c_bypass_select is to enable the pass through
+ * mode of the HDMI transmitter. Do not use regmap from within this function,
+ * only use sii902x_*_unlocked functions to read/modify/write registers.
+ * We are holding the parent adapter lock here, keep this in mind before
+ * adding more i2c transactions.
+ */
+static int sii902x_i2c_bypass_select(struct i2c_mux_core *mux, u32 chan_id)
+{
+	struct sii902x *sii902x = i2c_mux_priv(mux);
+	struct device *dev = &sii902x->i2c->dev;
+	unsigned long timeout;
+	u8 status;
+	int ret;
+
+	ret = sii902x_update_bits_unlocked(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+					   SII902X_SYS_CTRL_DDC_BUS_REQ,
+					   SII902X_SYS_CTRL_DDC_BUS_REQ);
+
+	timeout = jiffies +
+		  msecs_to_jiffies(SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS);
+	do {
+		ret = sii902x_read_unlocked(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+					    &status);
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
+	ret = sii902x_write_unlocked(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+				     status);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+/*
+ * The purpose of sii902x_i2c_bypass_deselect is to disable the pass through
+ * mode of the HDMI transmitter. Do not use regmap from within this function,
+ * only use sii902x_*_unlocked functions to read/modify/write registers.
+ * We are holding the parent adapter lock here, keep this in mind before
+ * adding more i2c transactions.
+ */
+static int sii902x_i2c_bypass_deselect(struct i2c_mux_core *mux, u32 chan_id)
+{
+	struct sii902x *sii902x = i2c_mux_priv(mux);
+	struct device *dev = &sii902x->i2c->dev;
+	unsigned long timeout;
+	unsigned int retries;
+	u8 status;
+	int ret;
+
+	/*
+	 * When the HDMI transmitter is in pass through mode, we need an
+	 * (undocumented) additional delay between STOP and START conditions
+	 * to guarantee the bus won't get stuck.
+	 */
+	udelay(30);
+
+	/*
+	 * Sometimes the I2C bus can stall after failure to use the
+	 * EDID channel. Retry a few times to see if things clear
+	 * up, else continue anyway.
+	 */
+	retries = 5;
+	do {
+		ret = sii902x_read_unlocked(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+					    &status);
+		retries--;
+	} while (ret && retries);
+	if (ret) {
+		dev_err(dev, "failed to read status (%d)\n", ret);
+		return ret;
+	}
+
+	ret = sii902x_update_bits_unlocked(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+					   SII902X_SYS_CTRL_DDC_BUS_REQ |
+					   SII902X_SYS_CTRL_DDC_BUS_GRTD, 0);
+	if (ret)
+		return ret;
+
+	timeout = jiffies +
+		  msecs_to_jiffies(SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS);
+	do {
+		ret = sii902x_read_unlocked(sii902x->i2c, SII902X_SYS_CTRL_DATA,
+					    &status);
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
@@ -375,6 +478,12 @@ static int sii902x_probe(struct i2c_client *client,
 	u8 chipid[4];
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
@@ -433,6 +542,22 @@ static int sii902x_probe(struct i2c_client *client,
 
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
 
@@ -441,6 +566,9 @@ static int sii902x_remove(struct i2c_client *client)
 {
 	struct sii902x *sii902x = i2c_get_clientdata(client);
 
+	if (sii902x->i2cmux)
+		i2c_mux_del_adapters(sii902x->i2cmux);
+
 	drm_bridge_remove(&sii902x->bridge);
 
 	return 0;
-- 
2.7.4
