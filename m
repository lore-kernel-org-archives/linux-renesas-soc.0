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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE77CC43444
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8C262133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by7Ttyar"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbeLQP44 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:56:56 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40769 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387919AbeLQP44 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:56:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id q26so13102229wmf.5;
        Mon, 17 Dec 2018 07:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mKCMgk/zmDNbdNMvMWSx849sCzWR02RcKBlqw/pIRmM=;
        b=by7TtyarPVG3NLsBpSJ7y/9dxnA2eohd2R5jruOXC1CC1Rca3g3usQTCGYy7T3lVv9
         66JRAbU7erSsnhnrcEh1PmH4n5/gGk7ySGbvtKVojruGNwLUSd4LkESK1yJt2TvxXK1J
         zYsj5RFebFk8z78la7LLmty2DbSxf8gPy9oS2WKPd1fX6GmjX7CkeWXu6dZ06j2n+Kdl
         GPq4z6FnfJYsyWDfx8AWaZweD9PDtPPkl6goHvH1iBdIAN5czfNz17/7U0lNOoVhBYW3
         euYEwLXvi+BgafL5I7nZXyTSueEB7HbqVvs1RQuqdXYQMeFgcKO/qpP2Rtf+UzDRkcjd
         T8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mKCMgk/zmDNbdNMvMWSx849sCzWR02RcKBlqw/pIRmM=;
        b=CCY9g0q2i+vHJYZE6srMN3361L6TdOded77LleLpFXD4nRanKkTsC4B+N6YqerlsLP
         vpUh+jHm3D4yHM1Gn/k6/vgKOFm2acGw8NxpkQOs+Yc4t7st8MB0PNuJeYV1DqAm8dXR
         NsxTWR4qdv6243H0HhZBZc/SMHY2vKd0YqZqnbQwOpvWlCbU0KbasGOLB69YctO3Vlvv
         5tQk/xSbaZYKtr1R+ZKOestmqR+KN9kPxSY+5WmYXyXDMEcVygPLKzHTvI2FH0JVd9qq
         gIujh0ID31pJiDquBN6Ri+LWfjzPQyUVyfvzh00TuGix3sfxBwRyQlFyhU8z10gGGeMY
         Td1g==
X-Gm-Message-State: AA+aEWazPBdmL+Q8otw3oTvAoxy11UwNh3mgOQa2neSBKmPScyRA/Fx2
        0BqM1QFafVYsxovi94ilwjkOlr9t
X-Google-Smtp-Source: AFSGD/WPj8v8rtaNYLFI3rJgYEeslId2s6pzL6Sk0agSzCHIKEeznooAeLqNmtLAkCb9GsHlvPWNaw==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr12417883wmh.118.1545062214147;
        Mon, 17 Dec 2018 07:56:54 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:53 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH V3 3/6] thermal: Register hwmon in thermal_zone_of_sensor_register_param()
Date:   Mon, 17 Dec 2018 16:56:41 +0100
Message-Id: <20181217155644.29278-4-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181217155644.29278-1-marek.vasut@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
in case thermal_zone_params->no_hwmon is set to false. This behavior is
the same as thermal_zone_device_register().

From: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
---
V2: No change
V3: - Work around the From line and SoB line checkpatch warning
    - Reorder the SoB line at the end
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

