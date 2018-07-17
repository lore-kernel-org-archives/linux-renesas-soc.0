Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43587 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730040AbeGQUmp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 16:42:45 -0400
Received: by mail-lf0-f65.google.com with SMTP id m12-v6so1749015lfc.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 13:08:30 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: add INTC-EX support
To: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Message-ID: <c1e25728-8b86-b896-c097-e9ce2b891951@cogentembedded.com>
Date: Tue, 17 Jul 2018 23:08:27 +0300
MIME-Version: 1.0
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the INTC-EX interrupt controller in the R8A77980 device tree.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180717-v4.18-rc5' tag of Simon
Horman's 'renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -234,6 +234,22 @@
 			#power-domain-cells = <1>;
 		};
 
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a77980", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 407>;
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a77980",
 				     "renesas,rcar-gen3-i2c";
