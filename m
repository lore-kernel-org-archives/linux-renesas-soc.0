Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54022 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933171AbeE2K7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 May 2018 06:59:03 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Date: Tue, 29 May 2018 12:58:47 +0200
Message-Id: <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-rcar.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index e42cd0121862..27277f42710d 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -24,6 +24,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 /* register offsets */
@@ -103,8 +104,9 @@
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
 /* persistent flags */
+#define ID_P_NO_RXDMA	(1 << 30) /* HW bug forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED	(1 << 31)
-#define ID_P_MASK	ID_P_PM_BLOCKED
+#define ID_P_MASK	(ID_P_PM_BLOCKED | ID_P_NO_RXDMA)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -133,6 +135,8 @@ struct rcar_i2c_priv {
 	struct dma_chan *dma_rx;
 	struct scatterlist sg;
 	enum dma_data_direction dma_direction;
+
+	struct reset_control *rstc;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -363,6 +367,11 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
 			 sg_dma_len(&priv->sg), priv->dma_direction);
 
+	/* Gen3 can only do one RXDMA per transfer */
+	if (priv->devtype == I2C_RCAR_GEN3 &&
+	    priv->dma_direction == DMA_FROM_DEVICE)
+		priv->flags |= ID_P_NO_RXDMA;
+
 	priv->dma_direction = DMA_NONE;
 }
 
@@ -400,8 +409,9 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	unsigned char *buf;
 	int len;
 
-	/* Do not use DMA if it's not available or for messages < 8 bytes */
-	if (IS_ERR(chan) || msg->len < 8 || !(msg->flags & I2C_M_DMA_SAFE))
+	/* Do various checks to see if DMA is feasible at all */
+	if (IS_ERR(chan) || msg->len < 8 || !(msg->flags & I2C_M_DMA_SAFE) ||
+	    (read && priv->flags & ID_P_NO_RXDMA))
 		return;
 
 	if (read) {
@@ -743,6 +753,16 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	pm_runtime_get_sync(dev);
 
+	/* Gen3 has a HW bug which needs a reset before allowing RX DMA once */
+	if (priv->devtype == I2C_RCAR_GEN3) {
+		priv->flags |= ID_P_NO_RXDMA;
+		if (!IS_ERR(priv->rstc)) {
+			ret = reset_control_reset(priv->rstc);
+			if (ret == 0)
+				priv->flags &= ~ID_P_NO_RXDMA;
+		}
+	}
+
 	rcar_i2c_init(priv);
 
 	ret = rcar_i2c_bus_barrier(priv);
@@ -913,6 +933,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_pm_put;
 
+	if (priv->devtype == I2C_RCAR_GEN3)
+		priv->rstc = devm_reset_control_get(&pdev->dev, NULL);
+
 	/* Stay always active when multi-master to keep arbitration working */
 	if (of_property_read_bool(dev->of_node, "multi-master"))
 		priv->flags |= ID_P_PM_BLOCKED;
-- 
2.11.0
