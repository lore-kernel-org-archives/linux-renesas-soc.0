Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:32964 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbcGWSLa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 23 Jul 2016 14:11:30 -0400
Received: by mail-lf0-f42.google.com with SMTP id b199so104805430lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Jul 2016 11:11:29 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] ARM: dts: r8a7792: add SDHI support
Date: Sat, 23 Jul 2016 21:11:26 +0300
Message-ID: <1922758.B8NbWTKjoY@wasted.cogentembedded.com>
In-Reply-To: <4468057.gGDuR4B4DF@wasted.cogentembedded.com>
References: <4468057.gGDuR4B4DF@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7792 part of the SDHI0 device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- fixed up the size in the "reg" property.

 arch/arm/boot/dts/r8a7792.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -435,6 +435,18 @@
 			status = "disabled";
 		};
 
+		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a7792";
+			reg = <0 0xee100000 0 0x328>;
+			interrupts = <0 165 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
+			       <&dmac1 0xcd>, <&dmac1 0xce>;
+			dma-names = "tx", "rx", "tx", "rx";
+			clocks = <&mstp3_clks R8A7792_CLK_SDHI0>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		jpu: jpeg-codec@fe980000 {
 			compatible = "renesas,jpu-r8a7792",
 				     "renesas,rcar-gen2-jpu";
