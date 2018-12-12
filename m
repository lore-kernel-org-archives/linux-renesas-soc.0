Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A259DC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 684102086D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcPYTqnC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684102086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbeLLBt6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32873 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbeLLBt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:58 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so16076306wrr.0;
        Tue, 11 Dec 2018 17:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TNxxsz9LREn38i/Xzq2fxnYulveSptldEh/3Spdlf/U=;
        b=kcPYTqnCYW77BA1Fzo4OxGGsWGZGLGJq1itfK1wUsY8GgbD/LO13CmzKqdePvw6jnX
         gqNCdgnQ9MKyo96Hk+8DyqZZXvvrdVSgh/fhIO6JqeTvrzdx60ogzUaNZmcJUSBxiq37
         hoxl4Xb/ajszb/JFv8QYLwoL31bJK5thuaIAqvuBHdCWV9CP+1atVghycqzN9vUWXgTx
         /TfZvJGDKA1iWkjdf0BS1PQL3criDCucR0Y8t8oD3yjHws7T+auK0fT0DhUW4BmJOwWJ
         aOD0iqyNc3niUu+88ryH6vpxyTQYvjvUUQt0twTbqd4g0Cc5G6fGWcWxsnZ7urKKGK+/
         tTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TNxxsz9LREn38i/Xzq2fxnYulveSptldEh/3Spdlf/U=;
        b=ODKua0IXv9k8Mntu/Mha7AKHsHxunwC5FpD73rncDS7xrPMzLEf9NJeHf++FlMIbTA
         6pEQGlC9wK2E/UC+nzlMhwUfAUCTwOOx2dv/J+lGZsJ9uga66RbAfyXeSIMWC4NQxZC8
         UN6NM8XxF/NRCe385pCr6UuFBSz2WPvZ0yR4oNprJlmO47bXWLQeEixRNo4xLQyZR6nl
         TQo6L2XlQdKC75CDL3cRAqIewHs3S5ycdQdTKHffnM+g3rv5m4+qSDe0Jz9v09FP6GSL
         54dkiuu8lXIGlOwbEz9orv+nHXwNLTg1RCN4ZYK75y3UM52/teqZu43ajU/C3/arFNXi
         Upmg==
X-Gm-Message-State: AA+aEWZ2gxJWS0sqc1xuejLB5SaSvs3N7nLWDUkRN+YxWvBzTOb+xQIt
        x534wCe8jaESaMXbM0mDeq4LeU0L
X-Google-Smtp-Source: AFSGD/UXxjWjY/6RuRpbIY9qBdIcKC6QtMz3FX5lnOuI94Pz84ovgASpIx7q6HdDmNVeRZ0WddeY0g==
X-Received: by 2002:adf:cf0f:: with SMTP id o15mr15915038wrj.253.1544579395788;
        Tue, 11 Dec 2018 17:49:55 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:54 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 6/6] thermal: rcar_gen3_thermal: Register hwmon sysfs interface
Date:   Wed, 12 Dec 2018 02:49:27 +0100
Message-Id: <20181212014927.25840-7-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use devm_thermal_zone_of_sensor_register_params() with thermal zone
params to enable the hwmon sysfs interface.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
---
 drivers/thermal/rcar_gen3_thermal.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 75786cc8e2f9..d86b8e746313 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -85,6 +85,10 @@ struct rcar_gen3_thermal_priv {
 	void (*thermal_init)(struct rcar_gen3_thermal_tsc *tsc);
 };
 
+static struct thermal_zone_params rcar_gen3_tz_of_params = {
+	.no_hwmon	= false,
+};
+
 static inline u32 rcar_gen3_thermal_read(struct rcar_gen3_thermal_tsc *tsc,
 					 u32 reg)
 {
@@ -416,8 +420,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		priv->thermal_init(tsc);
 		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
 
-		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
-							    &rcar_gen3_tz_of_ops);
+		zone = devm_thermal_zone_of_sensor_register_params(dev, i, tsc,
+				&rcar_gen3_tz_of_ops, &rcar_gen3_tz_of_params);
 		if (IS_ERR(zone)) {
 			dev_err(dev, "Can't register thermal zone\n");
 			ret = PTR_ERR(zone);
-- 
2.18.0

