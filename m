Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43000 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934309AbeF1Up4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jun 2018 16:45:56 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/1] i2c: rcar: handle RXDMA HW behaviour on Gen3
Date: Thu, 28 Jun 2018 22:45:38 +0200
Message-Id: <20180628204538.866-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180628204538.866-1-wsa+renesas@sang-engineering.com>
References: <20180628204538.866-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Gen3, we can only do RXDMA once per transfer reliably. For that, we
must reset the device, then we can have RXDMA once. This patch
implements this. When there is no reset controller or the reset fails,
RXDMA will be blocked completely. Otherwise, it will be disabled after
the first RXDMA transfer. Based on a commit from the BSP by Hiromitsu
Yamasaki, yet completely refactored to handle multiple read messages
within one transfer.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC:

* poll reset status bit after reset (special case for I2C IP core).
* refactor I2C reset into seperate function
* improved comments
* use newer reset API (devm_reset_control_get_exclusive)

 drivers/i2c/busses/i2c-rcar.c | 54 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index c67c0b1a7fc9..b95900769a90 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -32,6 +32,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 /* register offsets */
@@ -111,8 +112,9 @@
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
 /* persistent flags */
+#define ID_P_NO_RXDMA	(1 << 30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED	(1 << 31)
-#define ID_P_MASK	ID_P_PM_BLOCKED
+#define ID_P_MASK	(ID_P_PM_BLOCKED | ID_P_NO_RXDMA)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -141,6 +143,8 @@ struct rcar_i2c_priv {
 	struct dma_chan *dma_rx;
 	struct scatterlist sg;
 	enum dma_data_direction dma_direction;
+
+	struct reset_control *rstc;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -371,6 +375,11 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
 			 sg_dma_len(&priv->sg), priv->dma_direction);
 
+	/* Gen3 can only do one RXDMA per transfer and we just completed it */
+	if (priv->devtype == I2C_RCAR_GEN3 &&
+	    priv->dma_direction == DMA_FROM_DEVICE)
+		priv->flags |= ID_P_NO_RXDMA;
+
 	priv->dma_direction = DMA_NONE;
 }
 
@@ -408,8 +417,9 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	unsigned char *buf;
 	int len;
 
-	/* Do not use DMA if it's not available or for messages < 8 bytes */
-	if (IS_ERR(chan) || msg->len < 8 || !(msg->flags & I2C_M_DMA_SAFE))
+	/* Do various checks to see if DMA is feasible at all */
+	if (IS_ERR(chan) || msg->len < 8 || !(msg->flags & I2C_M_DMA_SAFE) ||
+	    (read && priv->flags & ID_P_NO_RXDMA))
 		return;
 
 	if (read) {
@@ -740,6 +750,25 @@ static void rcar_i2c_release_dma(struct rcar_i2c_priv *priv)
 	}
 }
 
+/* I2C is a special case, we need to poll the status of a reset */
+static int rcar_i2c_do_reset(struct rcar_i2c_priv *priv)
+{
+	int i, ret;
+
+	ret = reset_control_reset(priv->rstc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < LOOP_TIMEOUT; i++) {
+		ret = reset_control_status(priv->rstc);
+		if (ret == 0)
+			return 0;
+		udelay(1);
+	}
+
+	return -ETIMEDOUT;
+}
+
 static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 				struct i2c_msg *msgs,
 				int num)
@@ -751,6 +780,16 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	pm_runtime_get_sync(dev);
 
+	/* Gen3 needs a reset before allowing RXDMA once */
+	if (priv->devtype == I2C_RCAR_GEN3) {
+		priv->flags |= ID_P_NO_RXDMA;
+		if (!IS_ERR(priv->rstc)) {
+			ret = rcar_i2c_do_reset(priv);
+			if (ret == 0)
+				priv->flags &= ~ID_P_NO_RXDMA;
+		}
+	}
+
 	rcar_i2c_init(priv);
 
 	ret = rcar_i2c_bus_barrier(priv);
@@ -921,6 +960,15 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_pm_put;
 
+	if (priv->devtype == I2C_RCAR_GEN3) {
+		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (!IS_ERR(priv->rstc)) {
+			ret = reset_control_status(priv->rstc);
+			if (ret < 0)
+				priv->rstc = ERR_PTR(-ENOTSUPP);
+		}
+	}
+
 	/* Stay always active when multi-master to keep arbitration working */
 	if (of_property_read_bool(dev->of_node, "multi-master"))
 		priv->flags |= ID_P_PM_BLOCKED;
-- 
2.11.0
