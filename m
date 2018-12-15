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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EF1C43612
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90A82206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTW9cjRW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbeLOCab (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:31 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37759 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbeLOCaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:30 -0500
Received: by mail-wm1-f65.google.com with SMTP id g67so7496646wmd.2;
        Fri, 14 Dec 2018 18:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mBLnsG24NLVnQZgnf1qFAA0DRrofVID098FjM7rJwVs=;
        b=oTW9cjRWOi5OwR3PQ+Z/ijeugszAcfc/TvdhOroehZ850zRd6WxjRZEst3y0RcT0NK
         pxzs6AgI3TzMy7Ffdjzlfbv5C8hzs3vXHnrW1wpcd1uXNrBySkWgsEGcayljsKjE/K+l
         b1cCMUzuuZXvaPaAGTJgftkW9tPyaWd6SOCzTtHq0WQ1LIlAYuAlHyyynUhvz+q/VaDr
         cjDhrJO7jrcLF4bMQgPzfX40PVj9VO46GeMdnw6pubm33jVjBRFFDpWGFRA6kOCtVCSS
         sxAB3tGHuwQuotaTwfm7ITnNl/6YdDjm3DKCybpQSXJoIhX9zTdDgXlIPutxwHA3+TtO
         JGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mBLnsG24NLVnQZgnf1qFAA0DRrofVID098FjM7rJwVs=;
        b=cXqRQ6ArUWIq3FAzNR3yJgp/p0zDvQaA5ltq1bv10TpW+6tX8ceWe9cN4bHwjPHRXT
         i0FNduxmkrgj3YbipJLDzLiRsqs+DI1Oyb5TW6bSLXu3sd34KmZ02eql30YpmxHDelWZ
         i5hO2WnXuWq5JWogULxsbqNLbhjS6y85+VTYP0h/5C3i0/0HHnrmSrOou/H/53G9Sls2
         59j6nS24vXRRTzZj4DunUfWCMbewiXeSdIoSHXgIlOxmRNO/qQvWjENgivtu/UWUCUf+
         fLHxW8WRkyvkvhVSixP2hP+AtUWBssG7ehGXUZmX6GGBKPmvBOaOZ52YMl4l005cKHB/
         nfiw==
X-Gm-Message-State: AA+aEWaf02YPPNiWP9K3oOssj5qqx6V1Wb91r68rBBwJm5PYNIE30JPN
        8S64YF8sD+djDbnzeYw33ZiezWrl
X-Google-Smtp-Source: AFSGD/WkPLpuR2u09XHBK1rJWZpnGQJDFA7guI3IAyLudkj2oOniVVtXKyTYuYaIbJmK73wNSsn6ag==
X-Received: by 2002:a1c:8302:: with SMTP id f2mr5257840wmd.9.1544841028596;
        Fri, 14 Dec 2018 18:30:28 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:27 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 5/6] thermal: rcar_thermal: Convert to devm_thermal_zone_of_sensor_register_params()
Date:   Sat, 15 Dec 2018 03:30:09 +0100
Message-Id: <20181215023010.2857-6-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
no functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
---
V2: No change
---
 drivers/thermal/rcar_thermal.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 8014a207d8d9..ec70c2119c77 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -19,8 +19,6 @@
 #include <linux/spinlock.h>
 #include <linux/thermal.h>
 
-#include "thermal_hwmon.h"
-
 #define IDLE_INTERVAL	5000
 
 #define COMMON_STR	0x00
@@ -54,6 +52,10 @@ struct rcar_thermal_chip {
 	unsigned int nirqs;
 };
 
+static struct thermal_zone_params rcar_thermal_params = {
+	.no_hwmon	= false,
+};
+
 static const struct rcar_thermal_chip rcar_thermal = {
 	.use_of_thermal = 0,
 	.has_filonoff = 1,
@@ -458,9 +460,7 @@ static int rcar_thermal_remove(struct platform_device *pdev)
 	rcar_thermal_for_each_priv(priv, common) {
 		rcar_thermal_irq_disable(priv);
 		cancel_delayed_work_sync(&priv->work);
-		if (priv->chip->use_of_thermal)
-			thermal_remove_hwmon_sysfs(priv->zone);
-		else
+		if (!priv->chip->use_of_thermal)
 			thermal_zone_device_unregister(priv->zone);
 	}
 
@@ -554,16 +554,20 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret < 0)
 			goto error_unregister;
 
-		if (chip->use_of_thermal)
-			priv->zone = devm_thermal_zone_of_sensor_register(
+		if (chip->use_of_thermal) {
+			priv->zone =
+				devm_thermal_zone_of_sensor_register_params(
 						dev, i, priv,
-						&rcar_thermal_zone_of_ops);
-		else
+						&rcar_thermal_zone_of_ops,
+						&rcar_thermal_params);
+		} else {
 			priv->zone = thermal_zone_device_register(
 						"rcar_thermal",
 						1, 0, priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
+		}
+
 		if (IS_ERR(priv->zone)) {
 			dev_err(dev, "can't register thermal zone\n");
 			ret = PTR_ERR(priv->zone);
@@ -571,17 +575,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			goto error_unregister;
 		}
 
-		if (chip->use_of_thermal) {
-			/*
-			 * thermal_zone doesn't enable hwmon as default,
-			 * but, enable it here to keep compatible
-			 */
-			priv->zone->tzp->no_hwmon = false;
-			ret = thermal_add_hwmon_sysfs(priv->zone);
-			if (ret)
-				goto error_unregister;
-		}
-
 		rcar_thermal_irq_enable(priv);
 
 		list_move_tail(&priv->list, &common->head);
-- 
2.18.0

