Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35752 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753456AbcLGQpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:45:00 -0500
Received: by mail-wm0-f67.google.com with SMTP id a20so29059017wme.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:59 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 4/4] arm64: renesas: r8a7796: Enable HSCIF DMA
Date: Wed,  7 Dec 2016 17:44:48 +0100
Message-Id: <1481129088-22026-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index c508e0f..748a2c2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -431,6 +431,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
+			       <&dmac2 0x31>, <&dmac2 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -445,6 +448,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x33>, <&dmac1 0x32>,
+			       <&dmac2 0x33>, <&dmac2 0x32>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -459,6 +465,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x35>, <&dmac1 0x34>,
+			       <&dmac2 0x35>, <&dmac2 0x34>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -473,6 +482,8 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -487,6 +498,8 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x39>, <&dmac0 0x38>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
-- 
2.7.4
