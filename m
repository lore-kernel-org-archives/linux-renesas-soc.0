Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC000C43444
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6EF32133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8e4V1Hn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbeLQP46 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:56:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42923 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387919AbeLQP46 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:56:58 -0500
Received: by mail-wr1-f68.google.com with SMTP id q18so12800970wrx.9;
        Mon, 17 Dec 2018 07:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3V8aGUzi3oj+QU4Ry1gbEOUBXLE5xptTq04OXWXhzc4=;
        b=f8e4V1Hn68xFQZsGP1QjLxN8gAlrp+UPrH2J1hD7GkuG9wczWx+6DaCTmFVY2HIEdU
         fNf7pZsgXhAsoLq/jDfveKWJ4R5H+ScixbRxlud8ahGkTKPsPa2CaJzlSt4668xCkoSa
         bynr9F2xuHCY3df/PjYf2/tNWIikerJqSC7MYQgq1Jre1bBq5z+/VY+KZMdpC5pM6qhS
         N4MRa7vZFvcDolBPFCn4hb9Bdb5dmdsnSca6RlJumAcroVhsLRvQ9+exPcdapV9XstJC
         dbce1FGVW1r3pSKoqIltx1XycUsT1+bzxP1WUvlSfBfS//3JIBP4VxBbIt6KOBgaJn3A
         djig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3V8aGUzi3oj+QU4Ry1gbEOUBXLE5xptTq04OXWXhzc4=;
        b=Nw/lN3FpOy56IuirCgDTF3Pv5T6KYbBs9bFlGYfRsqrm0wh3dOpf4ipvZ8zJNN4MpL
         qIcSpQG5R/oS5zFipE7TS0bMwUx9VQgL0yxK/+mqadQ9pTjHnql8Oz3brKGkUNOhQbz/
         gK+O5kG3LrdPoF79zycBolh9suS1WqogHR1wW+ly7h6TkZrF60QaZciuKrh+bUmnD5/E
         t5d7O6XgClgKbUmkk1GfpF6zxg88b5078RJA1sYgxGk7eXB9pyJekAHYxhxyHKBT2641
         XX4zLe2t5AZ5wQ4yOHRVbkmfwpOKSf9XzlNscY5SDz4qR0GAR5EhmWBVjntCdTsQmlB3
         +5Lw==
X-Gm-Message-State: AA+aEWbNoHIPVrBCcaQKI9eTJhRxQilgQwG6e96HSYq6NvvZmsbq2m5H
        JHg1w7/f62shSMSZCcBcpcO/3Z5E
X-Google-Smtp-Source: AFSGD/U/W8+cCpxS7WqC5DamsjiSttus2FDzHU+BuBEPFknTI5gegCtyj+iuaFEc8KsPY0w8+JHZtQ==
X-Received: by 2002:adf:a452:: with SMTP id e18mr3142183wra.190.1545062215681;
        Mon, 17 Dec 2018 07:56:55 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:54 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH V3 4/6] thermal: stm32: Convert to devm_thermal_zone_of_sensor_register_params()
Date:   Mon, 17 Dec 2018 16:56:42 +0100
Message-Id: <20181217155644.29278-5-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181217155644.29278-1-marek.vasut@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Convert the stm32 code to devm_thermal_zone_of_sensor_register_params(),
no functional change.

From: Marek Vasut <marek.vasut+renesas@gmail.com>
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
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
---
V2: Rename stm_tz_ops to stm_tz_parms to avoid duplicate symbol name
V3: - Work around the From line and SoB line checkpatch warning
    - Reorder the SoB line at the end
---
 drivers/thermal/st/stm_thermal.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 47623da0f91b..827565d94c20 100644
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
 
+static struct thermal_zone_params stm_tz_parms = {
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
+				0, sensor, &stm_tz_ops, &stm_tz_parms);
 
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

