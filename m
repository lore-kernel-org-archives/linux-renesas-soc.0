Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35130 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752964AbcD2QBs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 12:01:48 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: horms@verge.net.au
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	sergei.shtylyov@cogentembedded.com, geert@linux-m68k.org,
	magnus.damm@gmail.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v3] ARM: dts: r8a7793: Add MMCIF0
Date: Fri, 29 Apr 2016 18:01:39 +0200
Message-Id: <1461945699-21324-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Same as on r8a7791.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---

This version addresses the issues found by Geert and Simon (thank you):

- change back to one DMA controller
- use GIC_SPI
- add max-frequency

CU
Uli


 arch/arm/boot/dts/r8a7793.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 1dd6d20..f76cc4c 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -543,6 +543,19 @@
 		status = "disabled";
 	};
 
+	mmcif0: mmcif@ee200000 {
+		compatible = "renesas,mmcif-r8a7793", "renesas,sh-mmcif";
+		reg = <0 0xee200000 0 0x80>;
+		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7793_CLK_MMCIF0>;
+		dmas = <&dmac0 0xd1>, <&dmac0 0xd2>;
+		dma-names = "tx", "rx";
+		power-domains = <&cpg_clocks>;
+		reg-io-width = <4>;
+		status = "disabled";
+		max-frequency = <97500000>;
+	};
+
 	scifa0: serial@e6c40000 {
 		compatible = "renesas,scifa-r8a7793",
 			     "renesas,rcar-gen2-scifa", "renesas,scifa";
-- 
2.7.4
