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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B74AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A16802133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R97IK2tl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388015AbeLQP5B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:57:01 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39258 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387959AbeLQP5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:57:01 -0500
Received: by mail-wr1-f68.google.com with SMTP id t27so12821618wra.6;
        Mon, 17 Dec 2018 07:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QMRh7dyNDMYASIxEYm00wjgD91IWEAcI9NIXzg7cvjE=;
        b=R97IK2tlisIt04VR/xGBtiKv/UokE/dZrsnKi+ryYoUTbpKmxoEzzajY2vZWfOa3LB
         ULh8UR7Wg1DIA6j6rJQvnJaa77j4s7abAXMatB45cpSxu2WE1Ecm1b9p+BPudwUMLKCy
         kiHKtmazPGr9qJHDHasRonZbDqkQpt6flFgZw8Eq1GKB0JDBGIXbZdHWPUmsj5VU1wZh
         U1diPZjrZyeqg3JDZHxNoMhm3ZCikjwzqdQbDNZwNCBloS+AwsOwT96NBJ6Clqq33XSg
         ixo2gEyULahddGHAnsZ6T32FrmUioEGOHPNkgZf9/S2+/CnoUd7iHwd9b++SBDMVJilr
         vRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QMRh7dyNDMYASIxEYm00wjgD91IWEAcI9NIXzg7cvjE=;
        b=A9aaOMxy8HFxojYNYPCph7NRQwJzYlPjvRZRvBqcvph3dtvci9RqU0DWr8+TGnrrER
         JLzR4O+NbGALj9Yi4B3PJuk99zlJVLAaXcaTJOirUXdYtxCwlEBWKOYVB7etTZXpsfEw
         2PEZXTeyLZZojZn1A7dHhp8T0JWx4hUCR8GydHvCWtxLbjj2aok1Wdq5JzP7ianIi/QL
         RizsHDDH3qpW4zz69B7k+xUTR7k9nEblLH44I7hwx13qkL/w/KF7EgqMEOdat4uvTdrD
         X6KRwOLeH+U9IbIozVi1k9EgOA0TNTTlVE+Opg0SbjS1ssoo2JLhmB5rR8yxf+svmLqK
         PFrQ==
X-Gm-Message-State: AA+aEWbN28zzf83sAkCsSrNoyd8N7c71DIOi74R+MgN3xGpE6SUIe3VI
        4C7TCvjIP5WUGl8CC9iCyaL1R1mZ
X-Google-Smtp-Source: AFSGD/V8cUdG0Xd8EmH+wRj3rag51jEY8kpm4DfDSFtQHzuN1dZamF3zATR+SdPtd7rntw7WtEZKWA==
X-Received: by 2002:adf:c7cc:: with SMTP id y12mr11634398wrg.52.1545062218954;
        Mon, 17 Dec 2018 07:56:58 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:57 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH V3 6/6] thermal: rcar_gen3_thermal: Register hwmon sysfs interface
Date:   Mon, 17 Dec 2018 16:56:44 +0100
Message-Id: <20181217155644.29278-7-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181217155644.29278-1-marek.vasut@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Use devm_thermal_zone_of_sensor_register_params() with thermal zone
params to enable the hwmon sysfs interface.

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
 drivers/thermal/rcar_gen3_thermal.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 75786cc8e2f9..d86b8e746313 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -85,6 +85,10 @@ struct rcar_gen3_thermal_priv {
 	void (*thermal_init)(struct rcar_gen3_thermal_tsc *tsc);
 };
 
+static struct thermal_zone_params rcar_gen3_tz_of_params = {
+	.no_hwmon	= false,
+};
+
 static inline u32 rcar_gen3_thermal_read(struct rcar_gen3_thermal_tsc *tsc,
 					 u32 reg)
 {
@@ -416,8 +420,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		priv->thermal_init(tsc);
 		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
 
-		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
-							    &rcar_gen3_tz_of_ops);
+		zone = devm_thermal_zone_of_sensor_register_params(dev, i, tsc,
+				&rcar_gen3_tz_of_ops, &rcar_gen3_tz_of_params);
 		if (IS_ERR(zone)) {
 			dev_err(dev, "Can't register thermal zone\n");
 			ret = PTR_ERR(zone);
-- 
2.18.0

