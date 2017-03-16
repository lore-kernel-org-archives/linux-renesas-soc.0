Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:22884 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751628AbdCPRvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2017 13:51:50 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/5] rtc: Add rtc-sh
Date: Thu, 16 Mar 2017 13:51:09 -0400
Message-Id: <20170316175112.27913-3-chris.brandt@renesas.com>
In-Reply-To: <20170316175112.27913-1-chris.brandt@renesas.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

rtc-sh is a RTC for SuperH and RZ/A SoCs.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/rtc/rtc-sh.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-sh.txt b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
new file mode 100644
index 0000000..2f0dc6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
@@ -0,0 +1,19 @@
+* Real Time Clock for Renesas SH and ARM SoCs
+
+Required properties:
+- compatible: Should be "renesas,r7s72100-rtc" or "renesas,sh-rtc" as a
+  fallback.
+- reg: physical base address and length of memory mapped region.
+- interrupts: 3 interrupts for alarm, period, and carry.
+- clocks: the clock source for the RTC controller.
+
+Example:
+rtc: rtc@fcff1000 {
+	compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
+	reg = <0xfcff1000 0x2e>;
+	interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
+		      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
+		      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
+	clocks = <&mstp6_clks R7S72100_CLK_RTC>;
+	power-domains = <&cpg_clocks>;
+};
-- 
2.10.1
