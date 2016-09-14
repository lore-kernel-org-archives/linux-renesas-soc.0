Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35521 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761990AbcINQq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:26 -0400
Received: by mail-wm0-f67.google.com with SMTP id 133so1330646wmq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:25 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 5/6] arm64: renesas: r8a7796: Enable I2C DMA
Date: Wed, 14 Sep 2016 18:46:10 +0200
Message-Id: <20160914164611.31237-6-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index a4d8b76..7c4d11c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -257,6 +257,8 @@
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 931>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac1 0x91>, <&dmac1 0x90>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -269,6 +271,8 @@
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 930>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac1 0x93>, <&dmac1 0x92>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -281,6 +285,8 @@
 			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 929>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac1 0x95>, <&dmac1 0x94>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -293,6 +299,8 @@
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 928>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac0 0x97>, <&dmac0 0x96>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -305,6 +313,8 @@
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 927>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac0 0x99>, <&dmac0 0x98>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -317,6 +327,8 @@
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 919>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -329,6 +341,8 @@
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			dmas = <&dmac0 0x9d>, <&dmac0 0x9c>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
-- 
2.9.3
