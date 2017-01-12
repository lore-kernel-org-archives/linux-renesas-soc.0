Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:44667 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750780AbdALTBt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 14:01:49 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/3] ARM: dts: r7s72100: add ostm to device tree
Date: Thu, 12 Jan 2017 14:01:07 -0500
Message-Id: <20170112190108.2856-3-chris.brandt@renesas.com>
In-Reply-To: <20170112190108.2856-1-chris.brandt@renesas.com>
References: <20170112190108.2856-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index d5946df..247bbe0 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -505,4 +505,15 @@
 		cap-sdio-irq;
 		status = "disabled";
 	};
+
+	ostm: ostm@fcfec000 {
+		compatible = "renesas,ostm-r7s72100", "renesas,ostm";
+		reg = <0xfcfec000 0x30>,
+		      <0xfcfec400 0x30>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
+
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>, <&mstp5_clks R7S72100_CLK_OSTM1>;
+		status = "disabled";
+	};
 };
-- 
2.10.1
