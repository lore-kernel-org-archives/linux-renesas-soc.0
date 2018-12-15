Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1286C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE6F5206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loQn1WLY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbeLOCaa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:30 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34352 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbeLOCaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:30 -0500
Received: by mail-wr1-f65.google.com with SMTP id j2so7164652wrw.1;
        Fri, 14 Dec 2018 18:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qj2+h8G03LIN+7xOpir1PaBR4t8vEWcRFLgdzSWTPss=;
        b=loQn1WLYAmkd3WPJ6PFQz1Gk+gPcoFi/GbkeZk2MBNLmcxZoc4MV2AmuVTG3JfLtw4
         Cm1BGy9o5Lxp3NN3Fdo+riC68oGlqq1o0U9e8WGqiLGZ0pbCAVsoMe6oyUmqKyfDZnCB
         dsfsiMvnEbVgbkrLvOcqZcNlmNjv/HVEarBMjqmgV7ctc4aXTm8FkHO+QeHxvmZGCzrr
         rfaVM1hIUyDZLeXASUesnkkW/2UMVPStRBE5i45oBSADqQHMd5qjcRQtsBCYnXoaa+bH
         bXIbAS1aPctO0V5bTyIxY2g3gOAOfBsFb4nME2u4z7h95cbG2zjTqIayyzKAMIy/1+1I
         tRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qj2+h8G03LIN+7xOpir1PaBR4t8vEWcRFLgdzSWTPss=;
        b=hS9bHWtQtiRcB6gJ96F0UyFnlaKJPTBYj0JI8r7b8M9gs1hPL6GIY1bcQrjUq7NYII
         bkDp2noixZ054Qf039nwVQojbzA/jRaBkhJBAnEMRk4vAA81ljmlZphknqSFdwn82z03
         cRBG2J+VFDQporDTjIzlioseIsLa6Rh5lHPdArZqtrdu6mPZCr+26NvJADS17K309I6z
         XTli3fOFLkxS5OAog2Lfya/02YExiWWyl1V7ldWYlFz3Ck816sFzFzhi7SzFqKioIrJK
         CpS6i2eZHPpW/AHo0C8C3l/upKYrq/Ges6o8SNV4aDo2ZBICGeoWFc5AesWAknXsSjej
         NK3w==
X-Gm-Message-State: AA+aEWZUGOw2D188q3sKOizg63hFq47VIz3Jols77pGOtV6PTlD8HIgd
        jaPU2g2qjBGpjDjpjgNXKhbKrgm7
X-Google-Smtp-Source: AFSGD/VtxH3ZmanZ01crNLsBX4vFt/1Qw7NNKVfn0/3b1/bt6N/41xgcFRtgMsTKR3+0pAkRiL2puQ==
X-Received: by 2002:adf:f504:: with SMTP id q4mr4484350wro.321.1544841027374;
        Fri, 14 Dec 2018 18:30:27 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:26 -0800 (PST)
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
Subject: [PATCH V2 4/6] thermal: stm32: Convert to devm_thermal_zone_of_sensor_register_params()
Date:   Sat, 15 Dec 2018 03:30:08 +0100
Message-Id: <20181215023010.2857-5-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
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
V2: Rename stm_tz_ops to stm_tz_parms to avoid duplicate symbol name
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

