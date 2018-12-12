Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0515C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6562820811
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evM8jCEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6562820811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbeLLBtz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51955 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbeLLBty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so4162401wmh.1;
        Tue, 11 Dec 2018 17:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yh/87MsAyMZuM65dC4lqX/V1S2sCGEaq/hZp5hi9gQU=;
        b=evM8jCEr9b6lWqwqHMKxpM/X3L1L88yoNwCkG229JtuHwbdl29a3lNRm84rtpSw/bk
         GAGe1opqsKYg17ucDFfILUSxjFKWMlDKN2/dp9n1GaXNGI8VpqUx5IU/wafl0aLGNg8d
         ujQjk8faLGU63lHNBgd9X0J+SKCKycXHBbNXfYpOV8AAa1wjl/BfmIiz8yqS/tun+Ubl
         c6eWI4t9oB0QIc/PmpSx3NHJxdwHFPrlraej3gBxzJEs9hhSfzAxvRqNJhr/bUHK/s2X
         7hJqxaIQJH8645EzOMaljVW5cd4CxWo57UznfcYUddikF+3LTQINs6zfeuRIUUPRgGUy
         u+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yh/87MsAyMZuM65dC4lqX/V1S2sCGEaq/hZp5hi9gQU=;
        b=X3GAUsBgFIdQmjagxbo8CpZyN11mogLa14g3vGWoWuTX3sTHrmZsG6QqHveL1872T/
         893qejtNsJ5IuWLQa3YzcVY1WG8QsyK1ZaRH9SkltVsVsiLaIn4g17osaNKq6nprkudT
         g3omil/qZd8fNBODKiAh39N/9+Rxluj4/x3pHh7Q5a4g3/5MNIQM5+G7ES/l//J5RN4l
         ErM0gZcfTxm1Rgy4vY9b3U9+DZzxa0NhSoa1fLq60T59FrMB7auscpZyIVMxu76IUnYy
         EtFz71VB8w+hIBVPdNcP0QI04jyuUz86EqFgKZRNqZMP/noEEytEh/A+FAaQlKUYfa2k
         /yPw==
X-Gm-Message-State: AA+aEWZcKLfscwM9jhIFPdGTEStFI3Iq7DOYyeoVI6UTwQwcTAPwbeR5
        54qncxIDG4plP0zgJKrd9ArsmHBd
X-Google-Smtp-Source: AFSGD/UB5a2Ie7pl8GzrmF/Os56KXaMXcXr9bAqFV4Ykz9flP9+kCdBqjrhezbXH73LbpjG/MVDkoQ==
X-Received: by 2002:a1c:e287:: with SMTP id z129mr4371188wmg.71.1544579391365;
        Tue, 11 Dec 2018 17:49:51 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:50 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 3/6] thermal: Register hwmon in thermal_zone_of_sensor_register_param()
Date:   Wed, 12 Dec 2018 02:49:24 +0100
Message-Id: <20181212014927.25840-4-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
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
 drivers/thermal/of-thermal.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 901d8799587a..39b2f2105d0b 100644
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
@@ -604,6 +612,8 @@ void thermal_zone_of_sensor_unregister(struct device *dev,
 
 	tz = tzd->devdata;
 
+	thermal_remove_hwmon_sysfs(tzd);
+
 	/* no __thermal_zone, nothing to be done */
 	if (!tz)
 		return;
-- 
2.18.0

