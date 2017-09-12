Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:38533 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751031AbdILVFL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:11 -0400
Received: by mail-lf0-f47.google.com with SMTP id q132so29469801lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:11 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912210506.997827638@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:17 +0300
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/11] soc: renesas: identify R-Car V3M
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=soc-renesas-identify-R-Car-V3M.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for identifying the R-Car V3M (R8A77970) SoC.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/soc/renesas/renesas-soc.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas/drivers/soc/renesas/renesas-soc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/renesas-soc.c
+++ renesas/drivers/soc/renesas/renesas-soc.c
@@ -144,6 +144,11 @@ static const struct renesas_soc soc_rcar
 	.id	= 0x52,
 };
 
+static const struct renesas_soc soc_rcar_v3m __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x54,
+};
+
 static const struct renesas_soc soc_rcar_d3 __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen3,
 	.id	= 0x58,
@@ -204,6 +209,9 @@ static const struct of_device_id renesas
 #ifdef CONFIG_ARCH_R8A7796
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
+#ifdef CONFIG_ARCH_R8A77970
+	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
+#endif
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
