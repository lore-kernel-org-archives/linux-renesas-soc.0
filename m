Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:39431 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754667AbeBBS1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 13:27:05 -0500
Received: by mail-lf0-f66.google.com with SMTP id w27so32821783lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2018 10:27:04 -0800 (PST)
Subject: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Message-ID: <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
Date: Fri, 2 Feb 2018 21:27:01 +0300
MIME-Version: 1.0
In-Reply-To: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for R-Car V3H (R8A77980) to the R-Car RST driver -- this driver
is  needed  for the clock driver to work.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/reset/renesas,rst.txt |    1 +
 drivers/soc/renesas/Kconfig                             |    2 +-
 drivers/soc/renesas/rcar-rst.c                          |    1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/reset/renesas,rst.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ renesas/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -27,6 +27,7 @@ Required properties:
 		  - "renesas,r8a7795-rst" (R-Car H3)
 		  - "renesas,r8a7796-rst" (R-Car M3-W)
 		  - "renesas,r8a77970-rst" (R-Car V3M)
+		  - "renesas,r8a77980-rst" (R-Car V3H)
 		  - "renesas,r8a77995-rst" (R-Car D3)
   - reg: Address start and address range for the device.
 
Index: renesas/drivers/soc/renesas/Kconfig
===================================================================
--- renesas.orig/drivers/soc/renesas/Kconfig
+++ renesas/drivers/soc/renesas/Kconfig
@@ -4,7 +4,7 @@ config SOC_RENESAS
 	select SOC_BUS
 	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2 || \
 			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77970 || \
-			   ARCH_R8A77995
+			   ARCH_R8A77980 || ARCH_R8A77995
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A7779 if ARCH_R8A7779
Index: renesas/drivers/soc/renesas/rcar-rst.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-rst.c
+++ renesas/drivers/soc/renesas/rcar-rst.c
@@ -42,6 +42,7 @@ static const struct of_device_id rcar_rs
 	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen2 },
+	{ .compatible = "renesas,r8a77980-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen2 },
 	{ /* sentinel */ }
 };
