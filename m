Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:37119 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751090AbdILVFP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:15 -0400
Received: by mail-lf0-f53.google.com with SMTP id 80so29535024lfy.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:15 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912210510.955132498@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:18 +0300
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77970 support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=soc-renesas-rcar-rst-add-R8A77970-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for R-Car V3M (R8A77970) to the R-Car RST driver -- this driver
is  needed  for the clock driver to work.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/reset/renesas,rst.txt |    1 +
 drivers/soc/renesas/Kconfig                             |    3 ++-
 drivers/soc/renesas/rcar-rst.c                          |    1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/reset/renesas,rst.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ renesas/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -26,6 +26,7 @@ Required properties:
 		  - "renesas,r8a7794-rst" (R-Car E2)
 		  - "renesas,r8a7795-rst" (R-Car H3)
 		  - "renesas,r8a7796-rst" (R-Car M3-W)
+		  - "renesas,r8a77970-rst" (R-Car V3M)
 		  - "renesas,r8a77995-rst" (R-Car D3)
   - reg: Address start and address range for the device.
 
Index: renesas/drivers/soc/renesas/Kconfig
===================================================================
--- renesas.orig/drivers/soc/renesas/Kconfig
+++ renesas/drivers/soc/renesas/Kconfig
@@ -3,7 +3,8 @@ config SOC_RENESAS
 	default y if ARCH_RENESAS
 	select SOC_BUS
 	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2 || \
-			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77995
+			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77970 || \
+			   ARCH_R8A77995
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A7779 if ARCH_R8A7779
Index: renesas/drivers/soc/renesas/rcar-rst.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-rst.c
+++ renesas/drivers/soc/renesas/rcar-rst.c
@@ -41,6 +41,7 @@ static const struct of_device_id rcar_rs
 	/* R-Car Gen3 is handled like R-Car Gen2 */
 	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen2 },
+	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen2 },
 	{ /* sentinel */ }
 };
