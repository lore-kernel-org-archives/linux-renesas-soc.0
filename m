Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:40936 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbeJXSQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Oct 2018 14:16:24 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] thermal: rcar_gen3_thermal: Fix init value of IRQCTL register
Date: Wed, 24 Oct 2018 18:48:51 +0900
Message-Id: <1540374531-11053-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Fix setting value for IRQCTL register. We are setting the last 6 bits
of (IRQCTL) to be 1 (0x3f). But according to Hardware manual, values 1
are "setting prohibited".

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/thermal/rcar_gen3_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 7aed533..2b8fb1e 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -280,7 +280,7 @@ static void rcar_gen3_thermal_init_r8a7795es1(struct rcar_gen3_thermal_tsc *tsc)
 
 	rcar_gen3_thermal_write(tsc, REG_GEN3_CTSR, CTSR_PONM);
 
-	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
+	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
 
@@ -306,7 +306,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 
 	usleep_range(1000, 2000);
 
-	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
+	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
 
-- 
2.7.4
