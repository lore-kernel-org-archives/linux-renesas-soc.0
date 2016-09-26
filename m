Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:52433 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S941414AbcIZUl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2016 16:41:27 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/2] ARM: dts: r7s72100: add sdhi to device tree
Date: Mon, 26 Sep 2016 16:40:31 -0400
Message-Id: <20160926204032.12260-2-chris.brandt@renesas.com>
In-Reply-To: <20160926204032.12260-1-chris.brandt@renesas.com>
References: <20160926204032.12260-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * removed bus-width
---
 arch/arm/boot/dts/r7s72100.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e97d6d1..53a38e3 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -458,4 +458,30 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	sdhi0: sd@e804e000 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e000 0x100>;
+		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI0>;
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		status = "disabled";
+	};
+
+	sdhi1: sd@e804e800 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e800 0x100>;
+		interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI1>;
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		status = "disabled";
+	};
 };
-- 
2.9.2
