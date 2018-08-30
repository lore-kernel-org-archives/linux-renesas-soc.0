Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28548 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbeH3GjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 02:39:08 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: wsa@sang-engineering.com, niklas.soderlund+renesas@ragnatech.se,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] thermal: rcar: reduce inaccuracy in calculate rounding
Date: Thu, 30 Aug 2018 11:39:04 +0900
Message-Id: <1535596744-16598-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535596744-16598-1-git-send-email-na-hoan@jinso.co.jp>
References: <1535596744-16598-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

About the formula for temperature calculation
[reg] = [temp] * a + b <=> [temp] = ([reg] - b) / a

Using "(mcelsius * tsc-> coef.aX) / 1000" instead of "DIV_ROUND_CLOSEST(mcelsius, 1000) * tsc-> coef.aX"
to avoid and reduce inaccuracy due to rounding the integer division.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/thermal/rcar_gen3_thermal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 7aed533..dbb31b8 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -185,11 +185,10 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
 static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
 					      int mcelsius)
 {
-	int celsius, val1, val2;
+	int val1, val2;
 
-	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
-	val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
-	val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
+	val1 = (mcelsius * tsc->coef.a1)/1000 + tsc->coef.b1;
+	val2 = (mcelsius * tsc->coef.a2)/1000 + tsc->coef.b2;
 
 	return INT_FIXPT((val1 + val2) / 2);
 }
-- 
2.7.4
