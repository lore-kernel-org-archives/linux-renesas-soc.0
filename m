Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28534 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbeKBQCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 12:02:17 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com
Cc: niklas.soderlund@ragnatech.se, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] thermal: rcar_gen3_thermal: Add Standby-mode function support
Date: Fri,  2 Nov 2018 15:55:59 +0900
Message-Id: <1541141759-14690-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

According to the hardware manual, Gen3 supports Standby-mode,
Add this function, and we should use this function while
suspend to reduce the energy consumption.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/thermal/rcar_gen3_thermal.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 7aed533..7f3bd7f 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -447,11 +447,30 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int rcar_gen3_thermal_standby(struct rcar_gen3_thermal_priv* priv)
+{
+	unsigned int i;
+	u32 reg_val;
+
+	for (i = 0; i < TSC_MAX_NUM; i++) {
+		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+
+		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
+		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
+
+		reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
+		rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val & ~THCTR_THSST);
+
+
+		usleep_range(1000, 2000);
+	}
+}
+
 static int __maybe_unused rcar_gen3_thermal_suspend(struct device *dev)
 {
 	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
 
-	rcar_thermal_irq_set(priv, false);
+	rcar_gen3_thermal_standby(priv);
 
 	return 0;
 }
-- 
2.7.4
