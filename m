Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60466 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbeHHKSI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 06:18:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: [PATCH 2/2] i2c: rcar: implement STOP and REP_START according to docs
Date: Wed,  8 Aug 2018 09:59:28 +0200
Message-Id: <20180808075928.31107-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
References: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When doing a REP_START after a read message, the driver used to trigger
a STOP first which would then be overwritten by REP_START. This was the
only stable method found when doing the last refactoring. However, this
was not in accordance with the documentation.

After research from our BSP team and myself, we now can implement a
version which works and is according to the documentation. The new
approach ensures the ICMCR register is only changed when really needed.

Tested on a R-Car Gen2 (H2) and Gen3 with DMA (M3N).

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index a9f1880e2eae..43ad933df0f0 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -113,9 +113,10 @@
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
 /* persistent flags */
+#define ID_P_REP_AFTER_RD	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 30)
+#define ID_P_MASK		GENMASK(31, 29)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -345,7 +346,10 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 		rcar_i2c_write(priv, ICMSR, 0);
 		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
 	} else {
-		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
+		if (priv->flags & ID_P_REP_AFTER_RD)
+			priv->flags &= ~ID_P_REP_AFTER_RD;
+		else
+			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
 		rcar_i2c_write(priv, ICMSR, 0);
 	}
 	rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
@@ -550,15 +554,15 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		priv->pos++;
 	}
 
-	/*
-	 * If next received data is the _LAST_, go to STOP phase. Might be
-	 * overwritten by REP START when setting up a new msg. Not elegant
-	 * but the only stable sequence for REP START I have found so far.
-	 * If you want to change this code, make sure sending one transfer with
-	 * four messages (WR-RD-WR-RD) works!
-	 */
-	if (priv->pos + 1 >= msg->len)
-		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
+	/* If next received data is the _LAST_, go to new phase. */
+	if (priv->pos + 1 == msg->len) {
+		if (priv->flags & ID_LAST_MSG) {
+			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
+		} else {
+			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
+			priv->flags |= ID_P_REP_AFTER_RD;
+		}
+	}
 
 	if (priv->pos == msg->len && !(priv->flags & ID_LAST_MSG))
 		rcar_i2c_next_msg(priv);
@@ -626,9 +630,11 @@ static irqreturn_t rcar_i2c_irq(int irq, void *ptr)
 	struct rcar_i2c_priv *priv = ptr;
 	u32 msr, val;
 
-	/* Clear START or STOP as soon as we can */
-	val = rcar_i2c_read(priv, ICMCR);
-	rcar_i2c_write(priv, ICMCR, val & RCAR_BUS_MASK_DATA);
+	/* Clear START or STOP immediately, except for REPSTART after read */
+	if (likely(!(priv->flags & ID_P_REP_AFTER_RD))) {
+		val = rcar_i2c_read(priv, ICMCR);
+		rcar_i2c_write(priv, ICMCR, val & RCAR_BUS_MASK_DATA);
+	}
 
 	msr = rcar_i2c_read(priv, ICMSR);
 
-- 
2.11.0
