Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52258 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932193AbdBPPiH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2017 10:38:07 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Brad Mouring <brad.mouring@ni.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <rcochran@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 3/3] ARM: dts: r7s72100: add l2 cache
Date: Thu, 16 Feb 2017 10:37:26 -0500
Message-Id: <20170216153726.22919-4-chris.brandt@renesas.com>
In-Reply-To: <20170216153726.22919-1-chris.brandt@renesas.com>
References: <20170216153726.22919-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Note that early-bresp-disable and full-line-zero-disable are required
because the sideband signals between the CPU and L2C were not connected
in this SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
* split "arm,pl310-no-sideband" into "arm,early-bresp-disable" and
  "arm,full-line-zero-disable"
v2:
* added "arm,pl310-no-sideband"
---
 arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 614ba79..ed62e19 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -180,6 +180,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <400000000>;
+			next-level-cache = <&L2>;
 		};
 	};
 
@@ -371,6 +372,16 @@
 			<0xe8202000 0x1000>;
 	};
 
+	L2: cache-controller@3ffff000 {
+		compatible = "arm,pl310-cache";
+		reg = <0x3ffff000 0x1000>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		arm,early-bresp-disable;
+		arm,full-line-zero-disable;
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	i2c0: i2c@fcfee000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.10.1
