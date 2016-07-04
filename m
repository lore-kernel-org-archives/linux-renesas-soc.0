Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35531 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbcGDVXe (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 17:23:34 -0400
Received: by mail-lf0-f44.google.com with SMTP id l188so123421871lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2016 14:23:33 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: r8a7792: add EtherAVB support
Date: Tue, 05 Jul 2016 00:23:30 +0300
Message-ID: <3067320.66EgKDGBA3@wasted.cogentembedded.com>
In-Reply-To: <3308853.O8HBuWdbK9@wasted.cogentembedded.com>
References: <3308853.O8HBuWdbK9@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7792 part of the EtherAVB device node.

Based on the commit 89aac8af1a60 ("ARM: dts: r8a7794: add EtherAVB support").

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -444,6 +444,18 @@
 			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
 		};
 
+		avb: ethernet@e6800000 {
+			compatible = "renesas,etheravb-r8a7792",
+				     "renesas,etheravb-rcar-gen2";
+			reg = <0 0xe6800000 0 0x800>, <0 0xee0e8000 0 0x4000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_ETHERAVB>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7792-cpg-clocks",
