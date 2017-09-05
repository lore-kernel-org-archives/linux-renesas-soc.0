Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbdIEIHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:07:32 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 04/13] thermal: rcar_gen3_thermal: remove unneeded mutex
Date: Tue,  5 Sep 2017 10:06:39 +0200
Message-Id: <1504598808-19810-5-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

There is no point in protecting a register read with a lock. This is
most likely a leftover from when the driver was reworked before being
submitted for upstream.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
(cherry picked from commit 100cfbcf2580b0605f50af32fefd9c8d1d8357fb)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/thermal/rcar_gen3_thermal.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index ec477d47d0ba..cb5c362c0000 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -20,7 +20,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -72,7 +71,6 @@ struct rcar_gen3_thermal_tsc {
 	void __iomem *base;
 	struct thermal_zone_device *zone;
 	struct equation_coefs coef;
-	struct mutex lock;
 };
 
 struct rcar_gen3_thermal_priv {
@@ -163,16 +161,12 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
 	u32 reg;
 
 	/* Read register and convert to mili Celsius */
-	mutex_lock(&tsc->lock);
-
 	reg = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
 
 	val1 = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1, tsc->coef.a1);
 	val2 = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b2, tsc->coef.a2);
 	mcelsius = FIXPT_TO_MCELSIUS((val1 + val2) / 2);
 
-	mutex_unlock(&tsc->lock);
-
 	/* Make sure we are inside specifications */
 	if ((mcelsius < MCELSIUS(-40)) || (mcelsius > MCELSIUS(125)))
 		return -EIO;
@@ -299,7 +293,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		}
 
 		priv->tscs[i] = tsc;
-		mutex_init(&tsc->lock);
 
 		match_data->thermal_init(tsc);
 		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
-- 
2.1.4
