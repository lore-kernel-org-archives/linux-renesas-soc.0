Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:7715 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752606AbeDQU6S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 16:58:18 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Hien Dang <hien.dang.eb@renesas.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] thermal: rcar_gen3_thermal: Update calculation formula due to HW evaluation
Date: Tue, 17 Apr 2018 22:57:46 +0200
Message-Id: <20180417205747.15492-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20180417205747.15492-1-niklas.soderlund@ragnatech.se>
References: <20180417205747.15492-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hien Dang <hien.dang.eb@renesas.com>

Due to hardware evaluation result,
Max temperature is changed from 96 to 116 degree Celsius.
Also, calculation formula and pseudo FUSE values are changed accordingly.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 561a0a332208504a..79c2cdb4105fc0b8 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -132,7 +132,7 @@ static inline void rcar_gen3_thermal_write(struct rcar_gen3_thermal_tsc *tsc,
 #define RCAR3_THERMAL_GRAN 500 /* mili Celsius */
 
 /* no idea where these constants come from */
-#define TJ_1 96
+#define TJ_1 116
 #define TJ_3 -41
 
 static void rcar_gen3_thermal_calc_coefs(struct equation_coefs *coef,
@@ -146,7 +146,7 @@ static void rcar_gen3_thermal_calc_coefs(struct equation_coefs *coef,
 	 * Division is not scaled in BSP and if scaled it might overflow
 	 * the dividend (4095 * 4095 << 14 > INT_MAX) so keep it unscaled
 	 */
-	tj_2 = (FIXPT_INT((ptat[1] - ptat[2]) * 137)
+	tj_2 = (FIXPT_INT((ptat[1] - ptat[2]) * 157)
 		/ (ptat[0] - ptat[2])) - FIXPT_INT(41);
 
 	coef->a1 = FIXPT_DIV(FIXPT_INT(thcode[1] - thcode[2]),
@@ -354,11 +354,11 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 
 	/* default values if FUSEs are missing */
 	/* TODO: Read values from hardware on supported platforms */
-	int ptat[3] = { 2351, 1509, 435 };
+	int ptat[3] = { 2631, 1509, 435 };
 	int thcode[TSC_MAX_NUM][3] = {
-		{ 3248, 2800, 2221 },
-		{ 3245, 2795, 2216 },
-		{ 3250, 2805, 2237 },
+		{ 3397, 2800, 2221 },
+		{ 3393, 2795, 2216 },
+		{ 3389, 2805, 2237 },
 	};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-- 
2.17.0
