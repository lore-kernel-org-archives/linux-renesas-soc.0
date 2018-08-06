Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42488 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726969AbeHFMsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:48:43 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] ata: sata_rcar: really mask all interrupts on Gen2 and later
Date: Mon,  6 Aug 2018 12:40:05 +0200
Message-Id: <20180806104005.29050-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since R-Car Gen2, a new bit has been introduced to the interrupt mask
register. Update the code to handle it properly as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Based on a report and prototype from the BSP team.

 drivers/ata/sata_rcar.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 3b8ed10bfb8f..1ad168f76ef3 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -109,6 +109,8 @@
 #define SATAINTMASK_ERRMSK		BIT(2)
 #define SATAINTMASK_ERRCRTMSK		BIT(1)
 #define SATAINTMASK_ATAMSK		BIT(0)
+#define SATAINTMASK_ALL_GEN1		0x7ff
+#define SATAINTMASK_ALL_GEN2		0xfff
 
 #define SATA_RCAR_INT_MASK		(SATAINTMASK_SERRMSK | \
 					 SATAINTMASK_ATAMSK)
@@ -152,6 +154,7 @@ enum sata_rcar_type {
 
 struct sata_rcar_priv {
 	void __iomem *base;
+	u32 sataint_mask;
 	enum sata_rcar_type type;
 };
 
@@ -225,7 +228,7 @@ static void sata_rcar_freeze(struct ata_port *ap)
 	struct sata_rcar_priv *priv = ap->host->private_data;
 
 	/* mask */
-	iowrite32(0x7ff, priv->base + SATAINTMASK_REG);
+	iowrite32(priv->sataint_mask, priv->base + SATAINTMASK_REG);
 
 	ata_sff_freeze(ap);
 }
@@ -241,7 +244,7 @@ static void sata_rcar_thaw(struct ata_port *ap)
 	ata_sff_thaw(ap);
 
 	/* unmask */
-	iowrite32(0x7ff & ~SATA_RCAR_INT_MASK, base + SATAINTMASK_REG);
+	iowrite32(priv->sataint_mask & ~SATA_RCAR_INT_MASK, base + SATAINTMASK_REG);
 }
 
 static void sata_rcar_ioread16_rep(void __iomem *reg, void *buffer, int count)
@@ -735,7 +738,7 @@ static irqreturn_t sata_rcar_interrupt(int irq, void *dev_instance)
 	if (!sataintstat)
 		goto done;
 	/* ack */
-	iowrite32(~sataintstat & 0x7ff, base + SATAINTSTAT_REG);
+	iowrite32(~sataintstat & priv->sataint_mask, base + SATAINTSTAT_REG);
 
 	ap = host->ports[0];
 
@@ -808,7 +811,7 @@ static void sata_rcar_init_module(struct sata_rcar_priv *priv)
 
 	/* ack and mask */
 	iowrite32(0, base + SATAINTSTAT_REG);
-	iowrite32(0x7ff, base + SATAINTMASK_REG);
+	iowrite32(priv->sataint_mask, base + SATAINTMASK_REG);
 
 	/* enable interrupts */
 	iowrite32(ATAPI_INT_ENABLE_SATAINT, base + ATAPI_INT_ENABLE_REG);
@@ -818,9 +821,12 @@ static void sata_rcar_init_controller(struct ata_host *host)
 {
 	struct sata_rcar_priv *priv = host->private_data;
 
+	priv->sataint_mask = SATAINTMASK_ALL_GEN2;
+
 	/* reset and setup phy */
 	switch (priv->type) {
 	case RCAR_GEN1_SATA:
+		priv->sataint_mask = SATAINTMASK_ALL_GEN1;
 		sata_rcar_gen1_phy_init(priv);
 		break;
 	case RCAR_GEN2_SATA:
@@ -948,7 +954,7 @@ static int sata_rcar_remove(struct platform_device *pdev)
 	iowrite32(0, base + ATAPI_INT_ENABLE_REG);
 	/* ack and mask */
 	iowrite32(0, base + SATAINTSTAT_REG);
-	iowrite32(0x7ff, base + SATAINTMASK_REG);
+	iowrite32(priv->sataint_mask, base + SATAINTMASK_REG);
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -969,7 +975,7 @@ static int sata_rcar_suspend(struct device *dev)
 		/* disable interrupts */
 		iowrite32(0, base + ATAPI_INT_ENABLE_REG);
 		/* mask */
-		iowrite32(0x7ff, base + SATAINTMASK_REG);
+		iowrite32(priv->sataint_mask, base + SATAINTMASK_REG);
 
 		pm_runtime_put(dev);
 	}
@@ -994,7 +1000,7 @@ static int sata_rcar_resume(struct device *dev)
 	} else {
 		/* ack and mask */
 		iowrite32(0, base + SATAINTSTAT_REG);
-		iowrite32(0x7ff, base + SATAINTMASK_REG);
+		iowrite32(priv->sataint_mask, base + SATAINTMASK_REG);
 
 		/* enable interrupts */
 		iowrite32(ATAPI_INT_ENABLE_SATAINT,
-- 
2.11.0
