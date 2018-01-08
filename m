Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:55767 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1757239AbeAHMcL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 07:32:11 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 3/3] ARM: dts: r7s72100: add USB device to device tree
Date: Mon,  8 Jan 2018 07:30:55 -0500
Message-Id: <20180108123055.64890-4-chris.brandt@renesas.com>
In-Reply-To: <20180108123055.64890-1-chris.brandt@renesas.com>
References: <20180108123055.64890-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add USB device support.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
 * Changed to "renesas,usbhs-r7s72100", "renesas,rza1-usbhs"
v3:
 * Changed from "renesas,usbhs-r7s72100" to "renesas,rza1-usbhs"
v2:
 * Node name is now generic 'usb@'
 * GIC_SPI (73-32) is now just GIC_SPI 41
 * All hex number are lower case
 * Added Reviewed-by
---
 arch/arm/boot/dts/r7s72100.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index ab9645a42eca..bd6366d1800b 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -667,4 +667,24 @@
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
+
+	usbhs0: usb@e8010000 {
+		compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";
+		reg = <0xe8010000 0x1a0>;
+		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp7_clks R7S72100_CLK_USB0>;
+		renesas,buswait = <4>;
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
+	usbhs1: usb@e8207000 {
+		compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";
+		reg = <0xe8207000 0x1a0>;
+		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp7_clks R7S72100_CLK_USB1>;
+		renesas,buswait = <4>;
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
 };
-- 
2.15.1
