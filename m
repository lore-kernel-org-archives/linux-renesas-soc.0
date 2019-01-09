Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077E3C43613
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9C4820883
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbfAIIWB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:22:01 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:55996 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729844AbfAIIWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:22:01 -0500
X-IronPort-AV: E=Sophos;i="5.56,456,1539615600"; 
   d="scan'208";a="4746202"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jan 2019 17:21:58 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 22DD2445EBAC;
        Wed,  9 Jan 2019 17:21:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
Date:   Wed,  9 Jan 2019 17:19:06 +0900
Message-Id: <1547021948-7664-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

To remove legacy API related functions in the future, this patch
uses "atomic" related function instead. No change in behavior.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-rcar.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index e3ab663..652a937 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -316,18 +316,16 @@ static int rcar_pwm_suspend(struct device *dev)
 static int rcar_pwm_resume(struct device *dev)
 {
 	struct pwm_device *pwm = rcar_pwm_dev_to_pwm_dev(dev);
+	struct pwm_state state;
 
 	if (!test_bit(PWMF_REQUESTED, &pwm->flags))
 		return 0;
 
 	pm_runtime_get_sync(dev);
 
-	rcar_pwm_config(pwm->chip, pwm, pwm->state.duty_cycle,
-			pwm->state.period);
-	if (pwm_is_enabled(pwm))
-		rcar_pwm_enable(pwm->chip, pwm);
+	pwm_get_state(pwm, &state);
 
-	return 0;
+	return rcar_pwm_apply(pwm->chip, pwm, &state);
 }
 #endif /* CONFIG_PM_SLEEP */
 static SIMPLE_DEV_PM_OPS(rcar_pwm_pm_ops, rcar_pwm_suspend, rcar_pwm_resume);
-- 
1.9.1

