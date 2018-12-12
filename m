Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589B8C6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 153D020811
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCTgncSb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 153D020811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbeLLBtz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:55 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39236 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbeLLBtz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:55 -0500
Received: by mail-wm1-f65.google.com with SMTP id f81so4201030wmd.4;
        Tue, 11 Dec 2018 17:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sZSxFpQkw2E4qWQFOzkloCvXbAyVW6y0ebILJ0r+z8g=;
        b=aCTgncSbxjqmZTz8wLUFBbD5dP9ZPZ426O0C9V4RM9R1kLEqhvXC5Xk6o1EEvUFg8i
         GbGoGHHyCck0vLPRZle65do36AwAGwo9hGHldCWOdeV3pgXL6iD7LTdP66oB1Mp9o6Tw
         VVlyWT8Qk6IUVvJW79vtfpRiOBwx+k8cUNO8CB8Pgqqp9EKqQS/dH5X7t1YTdo0FKKiR
         bfLtweAxbzQEoMVfIoHCB4WnJgBPelJ3j1FYAiUaDpICtaabixIzpKXrffbA69s5N8XH
         pw2gkUvypWOORZyXwvGKY7iI1RHD2TO1yjXTGDicIJN4fCvOJM32N4CxAWnyPqSkGDEK
         3zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sZSxFpQkw2E4qWQFOzkloCvXbAyVW6y0ebILJ0r+z8g=;
        b=N+4/cw5hptd9Ar/iw6d7etJcCGOZ59MPZWnaiAYq5HLw/7keRD5xIboIT/Gl8BThbt
         pfbEmuKHTBMXoXR8pil9W1tNWU9djU1bkf4T8JhaG3CbKYIFliB8ivWBmStO6ia1q/E4
         cxzw+F8qpLD+OwXqVAtDVpzCin/ELvD0mNm7RyKBOhFF2z4AY/9rSnMjlOt9hswTpMNk
         dWUkWA7tpWsuhnCRS+t+Wg2PMnfIZoAnaox3Q48Gb+ZMt4aZApEW6KPtepeLJkx8Oo6G
         JpE+3RzCkGtWkHdMRjNvnCHHv8x3nj+EC8PtAy+DkWGFCX/IWKJ7QnjRUVEAb1oxRsgm
         dz0Q==
X-Gm-Message-State: AA+aEWZci+B71hWb2Akc13IJmsXx4GTaz2iTZyMpbRlwMv+rSJnEmjTh
        7m0lUUYKTXWEtSQxmY8i6xgEknIt
X-Google-Smtp-Source: AFSGD/WYH7os2LmN6Q8NnJ9ECACav5knS/feiAzpE6/hEc7oNYDGo60ote6i6t58Uebh2l9qO9AcJg==
X-Received: by 2002:a1c:934e:: with SMTP id v75mr4486894wmd.126.1544579393038;
        Tue, 11 Dec 2018 17:49:53 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:52 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/6] thermal: stm32: Convert to devm_thermal_zone_of_sensor_register_params()
Date:   Wed, 12 Dec 2018 02:49:25 +0100
Message-Id: <20181212014927.25840-5-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the stm32 code to devm_thermal_zone_of_sensor_register_params(),
no functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-pm@vger.kernel.org
---
 drivers/thermal/st/stm_thermal.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 47623da0f91b..ee0915dfe96a 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -20,7 +20,6 @@
 #include <linux/thermal.h>
 
 #include "../thermal_core.h"
-#include "../thermal_hwmon.h"
 
 /* DTS register offsets */
 #define DTS_CFGR1_OFFSET	0x0
@@ -103,6 +102,10 @@ struct stm_thermal_sensor {
 	int t0, fmt0, ramp_coeff;
 };
 
+static struct thermal_zone_params stm_tz_ops = {
+	.no_hwmon	= false,
+};
+
 static irqreturn_t stm_thermal_alarm_irq(int irq, void *sdata)
 {
 	struct stm_thermal_sensor *sensor = sdata;
@@ -652,9 +655,8 @@ static int stm_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	sensor->th_dev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0,
-							      sensor,
-							      &stm_tz_ops);
+	sensor->th_dev = devm_thermal_zone_of_sensor_register_params(&pdev->dev,
+				0, sensor, &stm_tz_ops, &stm_tz_ops);
 
 	if (IS_ERR(sensor->th_dev)) {
 		dev_err(&pdev->dev, "%s: thermal zone sensor registering KO\n",
@@ -711,15 +713,6 @@ static int stm_thermal_probe(struct platform_device *pdev)
 		goto err_tz;
 	}
 
-	/*
-	 * Thermal_zone doesn't enable hwmon as default,
-	 * enable it here
-	 */
-	sensor->th_dev->tzp->no_hwmon = false;
-	ret = thermal_add_hwmon_sysfs(sensor->th_dev);
-	if (ret)
-		goto err_tz;
-
 	sensor->mode = THERMAL_DEVICE_ENABLED;
 
 	dev_info(&pdev->dev, "%s: Driver initialized successfully\n",
@@ -737,7 +730,6 @@ static int stm_thermal_remove(struct platform_device *pdev)
 	struct stm_thermal_sensor *sensor = platform_get_drvdata(pdev);
 
 	stm_thermal_sensor_off(sensor);
-	thermal_remove_hwmon_sysfs(sensor->th_dev);
 	thermal_zone_of_sensor_unregister(&pdev->dev, sensor->th_dev);
 
 	return 0;
-- 
2.18.0

