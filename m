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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6360C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A976206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZE66pnQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbeLOCac (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38489 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbeLOCac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id v13so7144140wrw.5;
        Fri, 14 Dec 2018 18:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aQbx7jHeLdrZi77zfUAhpDLl6y52o114PGIMmWCV/yo=;
        b=pZE66pnQKjYaoMQge0sJcI8iqm3PNXhf0/SMyVnzykqg0WlhGOCsXvIAwIHs0OsC8L
         Us7JPIv2Ek6PedhX00sKO+9orxCJNyEpCBQ1NJCsrrd0uQUGXw6FtyI9fwuGvJRzeZvy
         8x+JnfJzKH/NumRsyLIH+cjuuUHbxH+4q2jnyR72f0tMX74PBw1iEPli9erqiHlTX9VA
         Bq+8INV76tRFl+rrR3CBMb3SGY0hnxzZURffXr5c4rLQsm8Bf8y7HZLNytgdF96joQ7d
         YU36pGa5YjvvqKSHhcPwvaSXsQkYZ5y9/1mrwEm+xHIhc9XKneLvMKT9jXfBwhMcOtcr
         ck/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aQbx7jHeLdrZi77zfUAhpDLl6y52o114PGIMmWCV/yo=;
        b=oFeZA2KqqHXRsFQsDsQ1+X2GkNtfL14GlGmlFhirEI7P6X9+J7I9a7/ZZbpCwdfRbZ
         X1ihCtqYS6MOSWNGug+UFKkfb6BL8tdIurA4e07gPvko4NvyAbQv0toI/o2Wb4g1OjI4
         9kcajG5wYsNoASjB+MNu1TdVTGjhEmUpKqI9T+5kzNabJxmbyLg3PCBgYGaeCxSU1t2f
         EydeHdG8bASfqvwxrHQ3Iz7moEopdNZsORLX+KhBGmgXSZbgW1VKSYxisGSEAW+wubl3
         qd1VZM+J1ArvIIzfVa+jAoKwGLMLrRCvdQBFwO193TmpKweJ1WC/A93mGhSXJyMFoDg6
         yGZA==
X-Gm-Message-State: AA+aEWbxQ8Xx1uHKNrEUA+jUlgal60+UesoKvZ7faGFZw6LswaHHlwpb
        cKTu3Z4FVmrQHUqElU+1lZqtrzUR
X-Google-Smtp-Source: AFSGD/XDNQld1kOOKU4oIR6Trq0tliJSALupfczSMddJkfU7C31kPqMXO0eYN9+/uVIeF1UJDMDjgw==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr4186550wro.208.1544841030075;
        Fri, 14 Dec 2018 18:30:30 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:29 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 6/6] thermal: rcar_gen3_thermal: Register hwmon sysfs interface
Date:   Sat, 15 Dec 2018 03:30:10 +0100
Message-Id: <20181215023010.2857-7-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use devm_thermal_zone_of_sensor_register_params() with thermal zone
params to enable the hwmon sysfs interface.

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

