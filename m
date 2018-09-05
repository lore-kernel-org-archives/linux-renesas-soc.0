Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41525 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbeIFBCZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 21:02:25 -0400
Received: by mail-lf1-f68.google.com with SMTP id l26-v6so7121483lfc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Sep 2018 13:30:34 -0700 (PDT)
Subject: [PATCH 1/2] clocksource: sh_cmt: properly line-wrap sh_cmt_of_table[]
 initializer
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <3ce24bfe-1edb-1a92-8847-ff998ac86d16@cogentembedded.com>
Message-ID: <bccdf54a-70ba-ea8e-275f-9382dab5f1d4@cogentembedded.com>
Date: Wed, 5 Sep 2018 23:30:32 +0300
MIME-Version: 1.0
In-Reply-To: <3ce24bfe-1edb-1a92-8847-ff998ac86d16@cogentembedded.com>
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

---
 drivers/clocksource/sh_cmt.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

Index: renesas/drivers/clocksource/sh_cmt.c
===================================================================
--- renesas.orig/drivers/clocksource/sh_cmt.c
+++ renesas/drivers/clocksource/sh_cmt.c
@@ -937,8 +937,14 @@ static const struct of_device_id sh_cmt_
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
