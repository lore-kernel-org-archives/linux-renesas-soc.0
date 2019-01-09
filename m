Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C265C43612
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03654214C6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbfAIIWB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:22:01 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:5297 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729853AbfAIIWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:22:01 -0500
X-IronPort-AV: E=Sophos;i="5.56,456,1539615600"; 
   d="scan'208";a="4541222"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jan 2019 17:21:58 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2DA27447229E;
        Wed,  9 Jan 2019 17:21:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 3/4] pwm: rcar: remove legacy APIs
Date:   Wed,  9 Jan 2019 17:19:07 +0900
Message-Id: <1547021948-7664-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

This patch removes legacy APIs. Since rcar_pwm_{en,dis}able()
functions are reused on "atomic" API, this patch changes
the arguments of these functions. No change in behavior.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-rcar.c | 44 ++++----------------------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 652a937..1e13fbb 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -139,39 +139,8 @@ static void rcar_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	pm_runtime_put(chip->dev);
 }
 
-static int rcar_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			   int duty_ns, int period_ns)
+static int rcar_pwm_enable(struct rcar_pwm_chip *rp)
 {
-	struct rcar_pwm_chip *rp = to_rcar_pwm_chip(chip);
-	int div, ret;
-
-	div = rcar_pwm_get_clock_division(rp, period_ns);
-	if (div < 0)
-		return div;
-
-	/*
-	 * Let the core driver set pwm->period if disabled and duty_ns == 0.
-	 * But, this driver should prevent to set the new duty_ns if current
-	 * duty_cycle is not set
-	 */
-	if (!pwm_is_enabled(pwm) && !duty_ns && !pwm->state.duty_cycle)
-		return 0;
-
-	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, RCAR_PWMCR_SYNC, RCAR_PWMCR);
-
-	ret = rcar_pwm_set_counter(rp, div, duty_ns, period_ns);
-	if (!ret)
-		rcar_pwm_set_clock_control(rp, div);
-
-	/* The SYNC should be set to 0 even if rcar_pwm_set_counter failed */
-	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, 0, RCAR_PWMCR);
-
-	return ret;
-}
-
-static int rcar_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct rcar_pwm_chip *rp = to_rcar_pwm_chip(chip);
 	u32 value;
 
 	/* Don't enable the PWM device if CYC0 or PH0 is 0 */
@@ -185,10 +154,8 @@ static int rcar_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	return 0;
 }
 
-static void rcar_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+static void rcar_pwm_disable(struct rcar_pwm_chip *rp)
 {
-	struct rcar_pwm_chip *rp = to_rcar_pwm_chip(chip);
-
 	rcar_pwm_update(rp, RCAR_PWMCR_EN0, 0, RCAR_PWMCR);
 }
 
@@ -205,7 +172,7 @@ static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -ENOTSUPP;
 
 	if (!state->enabled) {
-		rcar_pwm_disable(chip, pwm);
+		rcar_pwm_disable(rp);
 		return 0;
 	}
 
@@ -223,7 +190,7 @@ static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, 0, RCAR_PWMCR);
 
 	if (!ret && state->enabled)
-		ret = rcar_pwm_enable(chip, pwm);
+		ret = rcar_pwm_enable(rp);
 
 	return ret;
 }
@@ -231,9 +198,6 @@ static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops rcar_pwm_ops = {
 	.request = rcar_pwm_request,
 	.free = rcar_pwm_free,
-	.config = rcar_pwm_config,
-	.enable = rcar_pwm_enable,
-	.disable = rcar_pwm_disable,
 	.apply = rcar_pwm_apply,
 	.owner = THIS_MODULE,
 };
-- 
1.9.1

