Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751592AbdIEIIB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:08:01 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 08/13] thermal: rcar_gen3_thermal: store device match data in private structure
Date: Tue,  5 Sep 2017 10:06:43 +0200
Message-Id: <1504598808-19810-9-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The device match data needs to be accessible outside the probe function,
store it in the private data structure.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
(cherry picked from commit cc4d072b66298716484f5c78d782c64509f4b6d9)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/thermal/rcar_gen3_thermal.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index d37c7d8f8fcd..f259a995c66c 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -88,6 +88,7 @@ struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	unsigned int num_tscs;
 	spinlock_t lock; /* Protect interrupts on and off */
+	const struct rcar_gen3_thermal_data *data;
 };
 
 struct rcar_gen3_thermal_data {
@@ -351,8 +352,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	struct thermal_zone_device *zone;
 	int ret, irq, i;
 	char *irqname;
-	const struct rcar_gen3_thermal_data *match_data =
-		of_device_get_match_data(dev);
 
 	/* default values if FUSEs are missing */
 	/* TODO: Read values from hardware on supported platforms */
@@ -367,6 +366,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->data = of_device_get_match_data(dev);
+
 	spin_lock_init(&priv->lock);
 
 	platform_set_drvdata(pdev, priv);
@@ -417,7 +418,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 
 		priv->tscs[i] = tsc;
 
-		match_data->thermal_init(tsc);
+		priv->data->thermal_init(tsc);
 		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
 
 		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
-- 
2.1.4
