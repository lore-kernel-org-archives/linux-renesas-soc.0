Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdIEIH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:07:59 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 09/13] thermal: rcar_gen3_thermal: add suspend and resume support
Date: Tue,  5 Sep 2017 10:06:44 +0200
Message-Id: <1504598808-19810-10-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

To restore operation it's easiest to reinitialise all TSCs. In order to
do this the current trip window needs to be stored in the TSC structure
so that it can be restored upon resume.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
(cherry picked from commit 75f78d6d9eb793d141affaa5a76f20ce1d6ae5c9)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/thermal/rcar_gen3_thermal.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index f259a995c66c..37fcefd06d9f 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -82,6 +82,8 @@ struct rcar_gen3_thermal_tsc {
 	void __iomem *base;
 	struct thermal_zone_device *zone;
 	struct equation_coefs coef;
+	int low;
+	int high;
 };
 
 struct rcar_gen3_thermal_priv {
@@ -217,6 +219,9 @@ static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQTEMP2,
 				rcar_gen3_thermal_mcelsius_to_temp(tsc, high));
 
+	tsc->low = low;
+	tsc->high = high;
+
 	return 0;
 }
 
@@ -454,9 +459,39 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int __maybe_unused rcar_gen3_thermal_suspend(struct device *dev)
+{
+	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
+
+	rcar_thermal_irq_set(priv, false);
+
+	return 0;
+}
+
+static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
+{
+	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
+	unsigned int i;
+
+	for (i = 0; i < priv->num_tscs; i++) {
+		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
+
+		priv->data->thermal_init(tsc);
+		rcar_gen3_thermal_set_trips(tsc, tsc->low, tsc->high);
+	}
+
+	rcar_thermal_irq_set(priv, true);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(rcar_gen3_thermal_pm_ops, rcar_gen3_thermal_suspend,
+			 rcar_gen3_thermal_resume);
+
 static struct platform_driver rcar_gen3_thermal_driver = {
 	.driver	= {
 		.name	= "rcar_gen3_thermal",
+		.pm = &rcar_gen3_thermal_pm_ops,
 		.of_match_table = rcar_gen3_thermal_dt_ids,
 	},
 	.probe		= rcar_gen3_thermal_probe,
-- 
2.1.4
