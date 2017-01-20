Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:56811 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752204AbdATVWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 16:22:23 -0500
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
Subject: [PATCH v2 2/3] ARM: dts: r7s72100: add ostm to device tree
Date: Fri, 20 Jan 2017 16:20:54 -0500
Message-Id: <20170120212055.4157-3-chris.brandt@renesas.com>
In-Reply-To: <20170120212055.4157-1-chris.brandt@renesas.com>
References: <20170120212055.4157-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* wrap clock lines to avoid 80 char max
* split into 2 separate channel nodes
---
 arch/arm/boot/dts/r7s72100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index d5946df..47b2165 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -505,4 +505,20 @@
 		cap-sdio-irq;
 		status = "disabled";
 	};
+
+	ostm0: ostm@fcfec000 {
+		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+		reg = <0xfcfec000 0x30>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
+		status = "disabled";
+	};
+
+	ostm1: ostm@fcfec400 {
+		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+		reg = <0xfcfec400 0x30>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM1>;
+		status = "disabled";
+	};
 };
-- 
2.10.1
