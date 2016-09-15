Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:21345 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751627AbcIOTfF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 15:35:05 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/4] ARM: dts: r7s72100: add mmcif to device tree
Date: Thu, 15 Sep 2016 15:34:03 -0400
Message-Id: <20160915193405.26943-3-chris.brandt@renesas.com>
In-Reply-To: <20160915193405.26943-1-chris.brandt@renesas.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e18d4e6..4054db3 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -450,4 +450,15 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	mmcif: mmc@e804c800 {
+		compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
+		reg = <0xe804c800 0x80>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
+		reg-io-width = <4>;
+		bus-width = <8>;
+		status = "disabled";
+	};
 };
-- 
2.9.2
