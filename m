Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:36172 "EHLO
	smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbcEDMfa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 4 May 2016 08:35:30 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	horms@verge.net.au, magnus.damm@gmail.com
Cc: geert+renesas@glider.be,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: r8a7795: enable DMA for I2C
Date: Wed,  4 May 2016 14:35:03 +0200
Message-Id: <1462365303-1664-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add DMA properties to the I2C nodes.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index a7315eb..49896e4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -693,6 +693,8 @@
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 931>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x91>, <&dmac1 0x90>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -705,6 +707,8 @@
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 930>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x93>, <&dmac1 0x92>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -717,6 +721,8 @@
 			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 929>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x95>, <&dmac1 0x94>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -729,6 +735,8 @@
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 928>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x97>, <&dmac1 0x96>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -741,6 +749,8 @@
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 927>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x99>, <&dmac1 0x98>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -753,6 +763,8 @@
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 919>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x9b>, <&dmac1 0x9a>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -765,6 +777,8 @@
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&cpg>;
+			dmas = <&dmac1 0x9d>, <&dmac1 0x9c>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
-- 
2.8.2
