Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4DAC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 19:56:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64693218AD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 19:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAeLnlrB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfBKT42 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 14:56:28 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51938 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730230AbfBKT42 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 14:56:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so526810wmj.1;
        Mon, 11 Feb 2019 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4FfKEZ2s3XU77ylMpq31vneAOCiYgixERZhnIGZwFqA=;
        b=BAeLnlrBVxO/6ejNTtjjGfxFRo02thPuoJI3jX1e+KUx5dH/reB8OPEkfnRAoM3hpo
         GKE9WuDfeFq0M67mxmon16ba+RG6D62MuBHhs9BTIBMilf3ITf8Dw/8/tudM6O/wLXN/
         KyBnFcLN+k33SPdxPuNQyk9tonAbqXvOf4nJ5PEnusZXn9VpAuxTHT9Y2iSR+QRpYgTR
         ZUTmbfcY6iX2wZ6/uN5W/cldMMVJWBeu2px6sb5yVeQRIxBHNdaxJyb2bouUAjKqTfXP
         5JGrr/qzgB5APqwWvVVAmvx4T/J5xKqbg3wl6c0J3F4gedWAZ/Ul6AOhP9mr6xBJZFV2
         ZbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4FfKEZ2s3XU77ylMpq31vneAOCiYgixERZhnIGZwFqA=;
        b=iGyoFDusuIGgkR0nci65Oco/IC3BDfqw+2/ddgwoCBCb3QVptxSA926dnk0KSDK8c5
         Ajvo8TMf2+kngaU0WXfbBaSNxk35FWfwcQclfzXLRwyZusguGALjwHjcIFi6UgFTX+Mw
         wrOuBbWh8WaYf4Wkxy2/1BHxEbl2LgjQ+bsXh0M3jjLzYdAmZGQAiLM23JyS6A0+lYwH
         OU0pN4hfjFlguO+3+jTaMGXU6DbVhry7hOq7BTEqjLSzR+z2Mt1sJrCfoOSZShMaoHZp
         pV6CaPGV2jSriIbycapxfZwoSXwtD5fjcDgTEiZR7WHTRpKtEJLcF2IUsIovr1eFUMWs
         v9KQ==
X-Gm-Message-State: AHQUAuZrxBZXxSiDPxYPGGiZi1u91WSC8JGVYFSTKMnJ0rzpDy/cTOfu
        LD0/ItFYWRMz/R4A6vU6gXDUzsOt
X-Google-Smtp-Source: AHgI3Ibw4sZQoMHnnG8VfbCCWHjwjhgqDbZh6faZAC5X3QQpd6WwUV4fB1jNA4CgUJEydQNTdv/05w==
X-Received: by 2002:a1c:5656:: with SMTP id k83mr864301wmb.125.1549914985858;
        Mon, 11 Feb 2019 11:56:25 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id t199sm808610wmt.1.2019.02.11.11.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Feb 2019 11:56:24 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] thermal: rcar_gen3_thermal: Register hwmon sysfs interface
Date:   Mon, 11 Feb 2019 20:56:20 +0100
Message-Id: <20190211195620.32753-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Register the hwmon sysfs interface on R-Car Gen3 thermal driver to
align it with Gen2 driver. Use devm_add_action() to unregister the
hwmon interface automatically.

Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
From: Marek Vasut <marek.vasut+renesas@gmail.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
---
 drivers/thermal/rcar_gen3_thermal.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 75786cc8e2f9..88fa41cf16e8 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -19,6 +19,7 @@
 #include <linux/thermal.h>
 
 #include "thermal_core.h"
+#include "thermal_hwmon.h"
 
 /* Register offsets */
 #define REG_GEN3_IRQSTR		0x04
@@ -337,6 +338,13 @@ static int rcar_gen3_thermal_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void rcar_gen3_hwmon_action(void *data)
+{
+	struct thermal_zone_device *zone = data;
+
+	thermal_remove_hwmon_sysfs(zone);
+}
+
 static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 {
 	struct rcar_gen3_thermal_priv *priv;
@@ -429,6 +437,17 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		if (ret < 0)
 			goto error_unregister;
 
+		tsc->zone->tzp->no_hwmon = false;
+		ret = thermal_add_hwmon_sysfs(tsc->zone);
+		if (ret)
+			goto error_unregister;
+
+		ret = devm_add_action(dev, rcar_gen3_hwmon_action, zone);
+		if (ret) {
+			rcar_gen3_hwmon_action(zone);
+			goto error_unregister;
+		}
+
 		dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
 	}
 
-- 
2.19.2

