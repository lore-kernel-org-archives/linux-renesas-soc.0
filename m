Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46325 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbeIMBU1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 21:20:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id e23-v6so2803877lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Sep 2018 13:14:16 -0700 (PDT)
Subject: [PATCH v2 1/3] clocksource: sh_cmt: properly line-wrap
 sh_cmt_of_table[] initializer
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc: linux-renesas-soc@vger.kernel.org
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Message-ID: <e5dea828-5f4c-e88e-034a-163d98e5f522@cogentembedded.com>
Date: Wed, 12 Sep 2018 23:14:14 +0300
MIME-Version: 1.0
In-Reply-To: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There's no good reason for the sh_cmt_of_table[] initializer to
violate the 80-column limit, especially after the commit 8d50e9476bb4
("clocksource/drivers/sh_cmt: Mark "renesas,cmt-48-gen2" deprecated")
partially fixed it -- fix the R-Car gen2 related entries as well.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- refreshed the patch;
- added Chris' and Geert's tags.

 drivers/clocksource/sh_cmt.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

Index: tip/drivers/clocksource/sh_cmt.c
===================================================================
--- tip.orig/drivers/clocksource/sh_cmt.c
+++ tip/drivers/clocksource/sh_cmt.c
@@ -935,8 +935,14 @@ static const struct of_device_id sh_cmt_
 		.compatible = "renesas,cmt-48-gen2",
 		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
 	},
-	{ .compatible = "renesas,rcar-gen2-cmt0", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
-	{ .compatible = "renesas,rcar-gen2-cmt1", .data = &sh_cmt_info[SH_CMT1_RCAR_GEN2] },
+	{
+		.compatible = "renesas,rcar-gen2-cmt0",
+		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
+	},
+	{
+		.compatible = "renesas,rcar-gen2-cmt1",
+		.data = &sh_cmt_info[SH_CMT1_RCAR_GEN2]
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
