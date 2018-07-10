Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: rcar: use the new get_bus_free callback
Date: Wed, 11 Jul 2018 00:24:23 +0200
Message-Id: <20180710222423.7792-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
References: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To break out of recovery as early as possible, feed back the bus_free
logic state.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5e310efd9446..76154747971e 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -179,8 +179,6 @@ static void rcar_i2c_set_scl(struct i2c_adapter *adap, int val)
 	rcar_i2c_write(priv, ICMCR, priv->recovery_icmcr);
 };
 
-/* No get_sda, because the HW only reports its bus free logic, not SDA itself */
-
 static void rcar_i2c_set_sda(struct i2c_adapter *adap, int val)
 {
 	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
@@ -193,10 +191,19 @@ static void rcar_i2c_set_sda(struct i2c_adapter *adap, int val)
 	rcar_i2c_write(priv, ICMCR, priv->recovery_icmcr);
 };
 
+static int rcar_i2c_get_bus_free(struct i2c_adapter *adap)
+{
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+
+	return !(rcar_i2c_read(priv, ICMCR) & FSDA);
+
+};
+
 static struct i2c_bus_recovery_info rcar_i2c_bri = {
 	.get_scl = rcar_i2c_get_scl,
 	.set_scl = rcar_i2c_set_scl,
 	.set_sda = rcar_i2c_set_sda,
+	.get_bus_free = rcar_i2c_get_bus_free,
 	.recover_bus = i2c_generic_scl_recovery,
 };
 static void rcar_i2c_init(struct rcar_i2c_priv *priv)
@@ -211,7 +218,7 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 {
-	int i, ret;
+	int i;
 
 	for (i = 0; i < LOOP_TIMEOUT; i++) {
 		/* make sure that bus is not busy */
@@ -222,13 +229,7 @@ static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 
 	/* Waiting did not help, try to recover */
 	priv->recovery_icmcr = MDBS | OBPC | FSDA | FSCL;
-	ret = i2c_recover_bus(&priv->adap);
-
-	/* No failure when recovering, so check bus busy bit again */
-	if (ret == 0)
-		ret = (rcar_i2c_read(priv, ICMCR) & FSDA) ? -EBUSY : 0;
-
-	return ret;
+	return i2c_recover_bus(&priv->adap);
 }
 
 static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv, struct i2c_timings *t)
-- 
2.11.0
