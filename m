Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44366 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbeIFBEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 21:04:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id q127-v6so7368392ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Sep 2018 13:32:09 -0700 (PDT)
Subject: [PATCH 2/2] clocksource: sh_cmt: add R-Car gen3 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <3ce24bfe-1edb-1a92-8847-ff998ac86d16@cogentembedded.com>
Message-ID: <dc0446c7-e63b-17f1-45ed-e544b5602b9e@cogentembedded.com>
Date: Wed, 5 Sep 2018 23:32:07 +0300
MIME-Version: 1.0
In-Reply-To: <3ce24bfe-1edb-1a92-8847-ff998ac86d16@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car gen3 CMT0 and CMT1 bindings -- they seem to be
the same CMT0 and CMT1 as in R-Car gen2 SoCs. Also document R8A779{7|8}
bindings as these are the R-Car gen3 SoCs for which the initial support
was done.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    7 +++++++
 drivers/clocksource/sh_cmt.c                            |    8 ++++++++
 2 files changed, 15 insertions(+)

Index: renesas/Documentation/devicetree/bindings/timer/renesas,cmt.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ renesas/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -34,6 +34,10 @@ Required Properties:
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
+    - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
+    - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
+    - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
+    - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
 
     - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
 		and RZ/G1.
@@ -41,6 +45,9 @@ Required Properties:
 		and RZ/G1.
 		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
 		listed above.
+    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3.
+    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3.
+		These are fallbacks for R-Car Gen3 entries listed above.
 
   - reg: base address and length of the registers block for the timer module.
   - interrupts: interrupt-specifier for the timer, one per channel.
Index: renesas/drivers/clocksource/sh_cmt.c
===================================================================
--- renesas.orig/drivers/clocksource/sh_cmt.c
+++ renesas/drivers/clocksource/sh_cmt.c
@@ -945,6 +945,14 @@ static const struct of_device_id sh_cmt_
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
