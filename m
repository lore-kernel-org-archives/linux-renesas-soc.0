Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:34872 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcLGQok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:40 -0500
Received: by mail-wj0-f195.google.com with SMTP id he10so36606214wjc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:39 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 3/3] arm64: renesas: r8a7796: Enable SCIF DMA
Date: Wed,  7 Dec 2016 17:44:27 +0100
Message-Id: <1481129067-21949-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index c5f0df5..782063a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -430,6 +430,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
+			       <&dmac2 0x51>, <&dmac2 0x50>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -443,6 +446,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
+			       <&dmac2 0x53>, <&dmac2 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -456,6 +462,8 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x57>, <&dmac0 0x56>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -469,6 +477,8 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x59>, <&dmac0 0x58>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
@@ -482,6 +492,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
+			       <&dmac2 0x5b>, <&dmac2 0x5a>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
-- 
2.7.4
