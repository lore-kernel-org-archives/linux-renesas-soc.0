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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE91C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A60452086D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrElCr9i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbeLOCa2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:28 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53393 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbeLOCa1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:27 -0500
Received: by mail-wm1-f67.google.com with SMTP id y1so7304899wmi.3;
        Fri, 14 Dec 2018 18:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c/SOfhnXTHNzrhCwcwT2EGj15Au3UhYZoE6SZGEvqrQ=;
        b=qrElCr9ioJBIDbg/abQ1mT9wHA3yuXYLn9j/WyU/7rdBxHkdP83dv8Tkv19rfWalAL
         5FO4hDlIcVxUP3xPIdORjUGkgHW8CnT5V0L6LAFO+znUDjTi1QBgHbWYSJ86yNl+JogU
         994HLO5odiTdPZwZRoOacSi63V8hQWBUkYmfGSWOKIjQ9t9kwYeoI6ocfGZh0J48Lvhd
         pkymIf+mjxQKHrGVQfwKdB/5LpW5f6hitSnaMPfaoq8vKgaVNvc8RJUhmmiUrojf2PHL
         R+bjTqy9TduM+/qd7ayYb7CxYtY3tX1aJsaex40yWtewZc14kgIpsK6laCkJRvLRMZHR
         isrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c/SOfhnXTHNzrhCwcwT2EGj15Au3UhYZoE6SZGEvqrQ=;
        b=Ao+VcnctsmHEhmLMuiMvwSXGBLFGrn6oR6C+ANez/JzKXb9sR5WyuFmqLILQNI9kye
         Ir4E+GSFjl9dn/QYO9iwxEGQsWbooLtdRidKcksJ+D7CCoNm6awRq3Z+J/Zg7Epgxx76
         9gEZPdv+HpsJYlEHk8KTIM0fXAlsazI6o3kTLrOKtQLYp4PZx7a35FBhqSvr30TaEd11
         jeACnMEOjIkEFtP6+lDJePdM8ukxPpX2E8wNoKW39jXI8Q8PXNJ5f3EJgIZ5fHDojVlL
         ojyPsRkPxBAuM6wLloQrhD193FxB5VtJxQyIM2yjzoYFizP3Mfwj8YfjbmlfRT1t2S3F
         I9Og==
X-Gm-Message-State: AA+aEWb0GLOd9qvxAOyDajwa+rtCZfpLqxrsfZSE7jkZSfUFJabeeOaB
        kXb5J1ZjQAQiOfgnTH1p4A35zZb9
X-Google-Smtp-Source: AFSGD/Wxkv1KrrB42XoM1LrTv+LmOhEdEoHjTxfhSdhf7Ai1KHnmbplR/o/nZder09bO4Rfhl9pKfQ==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr4832917wmg.78.1544841025581;
        Fri, 14 Dec 2018 18:30:25 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:24 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 3/6] thermal: Register hwmon in thermal_zone_of_sensor_register_param()
Date:   Sat, 15 Dec 2018 03:30:07 +0100
Message-Id: <20181215023010.2857-4-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
in case thermal_zone_params->no_hwmon is set to false. This behavior is
the same as thermal_zone_device_register().

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
 drivers/thermal/of-thermal.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index e1a303a5698c..5ccff7b678de 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -15,6 +15,7 @@
 #include <linux/string.h>
 
 #include "thermal_core.h"
+#include "thermal_hwmon.h"
 
 /***   Private data structures to represent thermal device tree data ***/
 
@@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
 		if (sensor_specs.np == sensor_np && id == sensor_id) {
 			tzd = thermal_zone_of_add_sensor(child, sensor_np,
 							 data, ops);
-			if (!IS_ERR(tzd))
+			if (!IS_ERR(tzd)) {
+				tzd->tzp = tzp;
 				tzd->ops->set_mode(tzd, THERMAL_DEVICE_ENABLED);
+				if (!tzp || !tzp->no_hwmon) {
+					ret = thermal_add_hwmon_sysfs(tzd);
+					if (ret)
+						tzd = ERR_PTR(ret);
+				}
+			}
 
 			of_node_put(sensor_specs.np);
 			of_node_put(child);
@@ -605,6 +613,8 @@ void thermal_zone_of_sensor_unregister(struct device *dev,
 
 	tz = tzd->devdata;
 
+	thermal_remove_hwmon_sysfs(tzd);
+
 	/* no __thermal_zone, nothing to be done */
 	if (!tz)
 		return;
-- 
2.18.0

