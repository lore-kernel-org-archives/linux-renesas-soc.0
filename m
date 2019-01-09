Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEB5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE76B20883
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbfAIIWC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:22:02 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:21720 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729334AbfAIIWC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:22:02 -0500
X-IronPort-AV: E=Sophos;i="5.56,456,1539615600"; 
   d="scan'208";a="4746206"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jan 2019 17:21:58 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 388B9445EBAC;
        Wed,  9 Jan 2019 17:21:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 4/4] pwm: rcar: improve calculation of divider
Date:   Wed,  9 Jan 2019 17:19:08 +0900
Message-Id: <1547021948-7664-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1547021948-7664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1547021948-7664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The rcar_pwm_get_clock_division() has a loop to calculate the divider,
but the value of div should be calculatable without a loop. So,
this patch improves it.

This algorithm is suggested by Uwe Kleine-König and Laurent Pinchart.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-rcar.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 1e13fbb..cfe7dd1 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -8,6 +8,8 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -68,19 +70,15 @@ static void rcar_pwm_update(struct rcar_pwm_chip *rp, u32 mask, u32 data,
 static int rcar_pwm_get_clock_division(struct rcar_pwm_chip *rp, int period_ns)
 {
 	unsigned long clk_rate = clk_get_rate(rp->clk);
-	unsigned long long max; /* max cycle / nanoseconds */
-	unsigned int div;
+	u64 div, tmp;
 
 	if (clk_rate == 0)
 		return -EINVAL;
 
-	for (div = 0; div <= RCAR_PWM_MAX_DIVISION; div++) {
-		max = (unsigned long long)NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE *
-			(1 << div);
-		do_div(max, clk_rate);
-		if (period_ns <= max)
-			break;
-	}
+	div = (u64)NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE;
+	tmp = (u64)period_ns * clk_rate + div - 1;
+	tmp = div64_u64(tmp, div);
+	div = ilog2(tmp - 1) + 1;
 
 	return (div <= RCAR_PWM_MAX_DIVISION) ? div : -ERANGE;
 }
-- 
1.9.1

