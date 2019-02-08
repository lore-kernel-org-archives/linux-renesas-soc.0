Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDBCC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F1F920863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Uo7rOeG/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfBHLOc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:32 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:32 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6EC4125BF15;
        Fri,  8 Feb 2019 22:14:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624459; bh=gQd1cvnM9Qeq98jZOuayM3zo37fJvTCm/wxKxu365W0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uo7rOeG/1L7bAcScRVUKWrTrH5n+MzNGLQIbJDSn+1OXSCNI5wQtSSbzN4/Lcz49N
         ESC+mtNPH0spv7Tp3GS6kNkywQgCh/bLV7KcXEbzeY3mbygZtETHTGw5MENRLxsq+t
         9/mUdAPY+SDVwhczrc3tX4xnM9FE6c450yOUR1No=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B480494088D; Fri,  8 Feb 2019 12:14:15 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/12] ARM: dts: r8a7778: Add HSCIF0/1 support
Date:   Fri,  8 Feb 2019 12:14:08 +0100
Message-Id: <adbb78e1104a006275e0e8e37526f617bb2a3d91.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Add HSCIF0/1 clocks and device nodes, based on Rev. 1.00 of the R-Car
M1A datasheet.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
[geert: Squashed two patches]
[geert: Correct HSCIF1 module clock index]
[geert: Correct reg properties for non-LPAE]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778.dtsi            | 28 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/r8a7778-clock.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 05db0ccad7a6..10d996d2941f 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -367,6 +367,30 @@
 		status = "disabled";
 	};
 
+	hscif0: serial@ffe48000 {
+		compatible = "renesas,hscif-r8a7778",
+			     "renesas,rcar-gen1-hscif", "renesas,hscif";
+		reg = <0xffe48000 96>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp0_clks R8A7778_CLK_HSCIF0>,
+			 <&cpg_clocks R8A7778_CLK_S>, <&scif_clk>;
+		clock-names = "fck", "brg_int", "scif_clk";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
+	hscif1: serial@ffe49000 {
+		compatible = "renesas,hscif-r8a7778",
+			     "renesas,rcar-gen1-hscif", "renesas,hscif";
+		reg = <0xffe49000 96>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp0_clks R8A7778_CLK_HSCIF1>,
+			 <&cpg_clocks R8A7778_CLK_S>, <&scif_clk>;
+		clock-names = "fck", "brg_int", "scif_clk";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
 	mmcif: mmc@ffe4e000 {
 		compatible = "renesas,mmcif-r8a7778", "renesas,sh-mmcif";
 		reg = <0xffe4e000 0x100>;
@@ -535,6 +559,8 @@
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
+				 <&cpg_clocks R8A7778_CLK_S>,
+				 <&cpg_clocks R8A7778_CLK_S>,
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
 				 <&cpg_clocks R8A7778_CLK_P>,
@@ -551,6 +577,7 @@
 				R8A7778_CLK_SCIF0 R8A7778_CLK_SCIF1
 				R8A7778_CLK_SCIF2 R8A7778_CLK_SCIF3
 				R8A7778_CLK_SCIF4 R8A7778_CLK_SCIF5
+				R8A7778_CLK_HSCIF0 R8A7778_CLK_HSCIF1
 				R8A7778_CLK_TMU0 R8A7778_CLK_TMU1
 				R8A7778_CLK_TMU2 R8A7778_CLK_SSI0
 				R8A7778_CLK_SSI1 R8A7778_CLK_SSI2
@@ -560,6 +587,7 @@
 			clock-output-names =
 				"i2c0", "i2c1", "i2c2", "i2c3", "scif0",
 				"scif1", "scif2", "scif3", "scif4", "scif5",
+				"hscif0", "hscif1",
 				"tmu0", "tmu1", "tmu2", "ssi0", "ssi1",
 				"ssi2", "ssi3", "sru", "hspi";
 		};
diff --git a/include/dt-bindings/clock/r8a7778-clock.h b/include/dt-bindings/clock/r8a7778-clock.h
index f6b07c5399de..d0bff9ec5c66 100644
--- a/include/dt-bindings/clock/r8a7778-clock.h
+++ b/include/dt-bindings/clock/r8a7778-clock.h
@@ -30,6 +30,8 @@
 #define R8A7778_CLK_SCIF3	23
 #define R8A7778_CLK_SCIF4	22
 #define R8A7778_CLK_SCIF5	21
+#define R8A7778_CLK_HSCIF0	19
+#define R8A7778_CLK_HSCIF1	18
 #define R8A7778_CLK_TMU0	16
 #define R8A7778_CLK_TMU1	15
 #define R8A7778_CLK_TMU2	14
-- 
2.11.0

