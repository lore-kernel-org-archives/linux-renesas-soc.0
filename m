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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D03CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AFCF2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbB+pW2U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbeLQP47 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:56:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37213 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387959AbeLQP47 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:56:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id s12so12380162wrt.4;
        Mon, 17 Dec 2018 07:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=opDkvbfqXyWW06ayh8QEzgFeMo4CFxVBOGgxOjPLBFg=;
        b=HbB+pW2UrK08wgEvn3H9TWcEltXRq99hBj4YN6TKTEjReV65F5MByojyTufr+3sUFp
         yDT+IRaoxW425YMiwBHIe+9IEtuVE6ZBVMTJcxxXVCJuR6bBuJlLArEnMoU9I/jZlw9s
         EdfO3zVpvNZ/i2/Fph3Nh4K1QRyTbtnvbyAIAKT/rp3xsuShml01ndrJMHN+U60Aj+EB
         z6LeFpqkAjRXnyRhitZM/ZcBGNZMy8WnL3ngak6h11umtYSzlQcI0glsnxbFYg1ZjzWd
         lh0r90C+6mteUhsC4o1D7hljaAyR6krgwWNZHk3enLxeU6BqR0X85yFLI5WbfdL9py8j
         R3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=opDkvbfqXyWW06ayh8QEzgFeMo4CFxVBOGgxOjPLBFg=;
        b=hcjbtQZAozUkLlXKLp88bMsvmJ4eZl3GTCJd8tMqGQBPeChhMD1HRS1O8dnExQxuGp
         jyIsxMLd0lWmUT0oeD37tBnFv8Zf3N3btq/ckUwi8o6nEekxL64fPgL5Qar8DQ53BKky
         AWa3ZxtYM6gv3NdtFnuXQ6HDxuK+X2yq14RNG2/JuoBetPVjDFqB3YKGvndhjT/OEpsw
         RPpxxxF5OEMBl25R5dRnpMk/8WUoCpKnIbZs7ZIr2xnZFWyllFxxJPg/ILJnqT8pogJx
         ouHCNEcNGGE7P/zmh2Js6yiDhWyw7+lf7j3EmYVuQdF0PY471nlT6vFIe/zNUY3zG9EG
         x8dA==
X-Gm-Message-State: AA+aEWYEzVZxU34aC4sJaBPjdaDAnGTZV4qmlgx5KBtBUah0EA3pMe4q
        FAPfl4WrgDadDvI9Vmyni+pSs/pF
X-Google-Smtp-Source: AFSGD/W9+zmYRrEUrddJVullAJgqyksh9dwoIWJoK7o/seH0iEm25VCp5ek6dLnZCLAiYmTOAADTtg==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr11770177wrm.223.1545062216947;
        Mon, 17 Dec 2018 07:56:56 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:56 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH V3 5/6] thermal: rcar_thermal: Convert to devm_thermal_zone_of_sensor_register_params()
Date:   Mon, 17 Dec 2018 16:56:43 +0100
Message-Id: <20181217155644.29278-6-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181217155644.29278-1-marek.vasut@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
no functional change.

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

