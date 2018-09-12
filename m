Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41022 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbeIMBXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 21:23:51 -0400
Received: by mail-lf1-f66.google.com with SMTP id l26-v6so2826637lfc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Sep 2018 13:17:39 -0700 (PDT)
Subject: [PATCH v2 3/3] clocksource: sh_cmt: add R-Car gen3 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc: linux-renesas-soc@vger.kernel.org
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Message-ID: <7d32fc9c-903d-1cb3-fdd7-d9165e0016ac@cogentembedded.com>
Date: Wed, 12 Sep 2018 23:17:37 +0300
MIME-Version: 1.0
In-Reply-To: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car gen3 CMT types 0/1 -- they seem to be the same
CMT types 0/1 as in R-Car gen2 SoCs.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- split the bindings update into a separate patch. 

 drivers/clocksource/sh_cmt.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: tip/drivers/clocksource/sh_cmt.c
===================================================================
--- tip.orig/drivers/clocksource/sh_cmt.c
+++ tip/drivers/clocksource/sh_cmt.c
@@ -943,6 +943,14 @@ static const struct of_device_id sh_cmt_
 		.compatible = "renesas,rcar-gen2-cmt1",
 		.data = &sh_cmt_info[SH_CMT1_RCAR_GEN2]
 	},
+	{
+		.compatible = "renesas,rcar-gen3-cmt0",
+		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
+	},
+	{
+		.compatible = "renesas,rcar-gen3-cmt1",
+		.data = &sh_cmt_info[SH_CMT1_RCAR_GEN2]
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
