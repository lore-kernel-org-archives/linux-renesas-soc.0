Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E92C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A2A520811
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRcKsKpc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2A520811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbeLLBt5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:57 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37093 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbeLLBt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id j10so16031944wru.4;
        Tue, 11 Dec 2018 17:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RwtxODIw1b1nCC2W4Bu2P+/BrexgHxjZyGy4vXVT3i8=;
        b=cRcKsKpcaDilG34rJ0t2rgOTCt+RpMvUsd17Y+SsUB2uL2EIpsZjEVaeuioJpY+3fG
         DYh2M3HQA+zCzM1qMNob2xFjQBL7PpzRKmVH6Z/+G02jXDRty328xvaXbE8ZX2I4C8E0
         iAzNwq292Wzamn4AVeRwCpkHIpdHA2BRcwvAVb3k2oT0YkBADvnG5s0sZn3TonjJIMPC
         6rMrC6usm7saRbZysJ6tBfIwLNze4eboMPpst8FYAegQJH7z0e2LnIEagk/2sLCWBfLL
         bjAHgUP9HBne2bSFlayIweQfBkSdvoZE+dzrn3jyrntjVpkogcrTiKFfnNanrJefNn9V
         a/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RwtxODIw1b1nCC2W4Bu2P+/BrexgHxjZyGy4vXVT3i8=;
        b=cpNcqgA0yJtGMm42voXrpZ+2yuyks9PMGFVMNF0cPrTmOFq7Awydw05MluUpbRKJDP
         7JVZNOKIrO3BzBHeyGNIKTrQgDt0/slH84Xo03OCVEV+SqWvEMh1dc6vbiO+8To0Al1P
         hxUW4HmCNo+eVUx37oGTIdV0reNmcMEDNpZrBBKfFUBOJ94k2C56TrQQAqHXYb2UbRF3
         2BkOcIzdefED0ozS1Fzg4Lt1rQJvbLS1Pp6iFQQVlzsrMRdlg5xvKd9mXmRYJtm7UofD
         kQb3H2d4Gqf99U2ogqYzlLW9A9OZgWwiCxmUvseJ0jx/gaa7mqxVvyazOskg8StKmscy
         Nbrg==
X-Gm-Message-State: AA+aEWb9Nlom8BlqT5o95SxE9JdwTRWaExvIypF46ent30XmJX69gdvw
        GCc99AI/C2TofJC8RjbGJsStq7wK
X-Google-Smtp-Source: AFSGD/UaDBimHP8fNn6n3EXUri/B26xtK+9PoVDcKteoQtSILORhygtA51otyAqlc9tCezx9z0TUQg==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr14525290wrc.252.1544579394389;
        Tue, 11 Dec 2018 17:49:54 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:53 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 5/6] thermal: rcar_thermal: Convert to devm_thermal_zone_of_sensor_register_params()
Date:   Wed, 12 Dec 2018 02:49:26 +0100
Message-Id: <20181212014927.25840-6-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
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

