Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36413 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751226AbcGWStQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 23 Jul 2016 14:49:16 -0400
Received: by mail-lf0-f51.google.com with SMTP id g62so104940207lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Jul 2016 11:49:15 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: r8a7792: add I2C support
Date: Sat, 23 Jul 2016 21:49:12 +0300
Message-ID: <3648013.0C8PEQFoEL@wasted.cogentembedded.com>
In-Reply-To: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7792 parts of the I2C[0-5] device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   82 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -18,6 +18,15 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -466,6 +475,79 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
+		};
+
+		/* I2C doesn't need pinmux */
+		i2c0: i2c@e6508000 {
+			compatible = "renesas,i2c-r8a7792";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_I2C0>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6518000 {
+			compatible = "renesas,i2c-r8a7792";
+			reg = <0 0xe6518000 0 0x40>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_I2C1>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6530000 {
+			compatible = "renesas,i2c-r8a7792";
+			reg = <0 0xe6530000 0 0x40>;
+			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_I2C2>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e6540000 {
+			compatible = "renesas,i2c-r8a7792";
+			reg = <0 0xe6540000 0 0x40>;
+			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_I2C3>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@e6520000 {
+			compatible = "renesas,i2c-r8a7792";
+			reg = <0 0xe6520000 0 0x40>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_I2C4>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@e6528000 {
+			compatible = "renesas,i2c-r8a7792";
+			reg = <0 0xe6528000 0 0x40>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_I2C5>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		can0: can@e6e80000 {
