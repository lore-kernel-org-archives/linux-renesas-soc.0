Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 6/6] i2c: rcar: implement bus recovery
Date: Tue,  9 Jan 2018 14:58:59 +0100
Message-Id: <20180109135859.20771-7-wsa@the-dreams.de>
In-Reply-To: <20180109135859.20771-1-wsa@the-dreams.de>
References: <20180109135859.20771-1-wsa@the-dreams.de>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We can force levels of SCL and SDA, so we can use that for bus recovery.
Note that we cannot read SDA back, because we will only get the internal
state of the bus free detection.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 54 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 8a2ae3e6c561c4..d4b7b5380c2983 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -132,6 +132,7 @@ struct rcar_i2c_priv {
 	int pos;
 	u32 icccr;
 	u32 flags;
+	u8 recovery_icmcr;	/* protected by adapter lock */
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
 
@@ -158,6 +159,46 @@ static u32 rcar_i2c_read(struct rcar_i2c_priv *priv, int reg)
 	return readl(priv->io + reg);
 }
 
+static int rcar_i2c_get_scl(struct i2c_adapter *adap)
+{
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	return !!(rcar_i2c_read(priv, ICMCR) & FSCL);
+
+};
+
+static void rcar_i2c_set_scl(struct i2c_adapter *adap, int val)
+{
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	if (val)
+		priv->recovery_icmcr |= FSCL;
+	else
+		priv->recovery_icmcr &= ~FSCL;
+
+	rcar_i2c_write(priv, ICMCR, priv->recovery_icmcr);
+};
+
+/* No get_sda, because the HW only reports its bus free logic, not SDA itself */
+
+static void rcar_i2c_set_sda(struct i2c_adapter *adap, int val)
+{
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	if (val)
+		priv->recovery_icmcr |= FSDA;
+	else
+		priv->recovery_icmcr &= ~FSDA;
+
+	rcar_i2c_write(priv, ICMCR, priv->recovery_icmcr);
+};
+
+static struct i2c_bus_recovery_info rcar_i2c_bri = {
+	.get_scl = rcar_i2c_get_scl,
+	.set_scl = rcar_i2c_set_scl,
+	.set_sda = rcar_i2c_set_sda,
+	.recover_bus = i2c_generic_scl_recovery,
+};
 static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 {
 	/* reset master mode */
@@ -170,7 +211,7 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 {
-	int i;
+	int i, ret;
 
 	for (i = 0; i < LOOP_TIMEOUT; i++) {
 		/* make sure that bus is not busy */
@@ -179,7 +220,15 @@ static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 		udelay(1);
 	}
 
-	return -EBUSY;
+	/* Waiting did not help, try to recover */
+	priv->recovery_icmcr = MDBS | OBPC | FSDA | FSCL;
+	ret = i2c_recover_bus(&priv->adap);
+
+	/* No failure when recovering, so check bus busy bit again */
+	if (ret == 0)
+		ret = (rcar_i2c_read(priv, ICMCR) & FSDA) ? -EBUSY : 0;
+
+	return ret;
 }
 
 static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv, struct i2c_timings *t)
@@ -851,6 +900,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->retries = 3;
 	adap->dev.parent = dev;
 	adap->dev.of_node = dev->of_node;
+	adap->bus_recovery_info = &rcar_i2c_bri;
 	i2c_set_adapdata(adap, priv);
 	strlcpy(adap->name, pdev->name, sizeof(adap->name));
 
-- 
2.11.0
