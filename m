Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:64937 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752593AbdARRcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 12:32:16 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/3] mmc: sh_mobile_sdhi: explain clock bindings
Date: Wed, 18 Jan 2017 12:25:01 -0500
Message-Id: <20170118172502.13876-3-chris.brandt@renesas.com>
In-Reply-To: <20170118172502.13876-1-chris.brandt@renesas.com>
References: <20170118172502.13876-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In the case of a single clock source, you don't need names. However,
if the controller has 2 clock sources, you need to name them correctly
so the driver can find the 2nd one.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* fix spelling and change wording
* changed clock name from "carddetect" to "cd"
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index a1650ed..90370cd 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -25,8 +25,29 @@ Required properties:
 		"renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
 		"renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
 
+- clocks: Most controllers only have 1 clock source per channel. However, some
+	  have a second clock dedicated to card detection. If 2 clocks are
+	  specified, you must name them as "core" and "cd". If the controller
+	  only has 1 clock, naming is not required.
+
 Optional properties:
 - toshiba,mmc-wrprotect-disable: write-protect detection is unavailable
 - pinctrl-names: should be "default", "state_uhs"
 - pinctrl-0: should contain default/high speed pin ctrl
 - pinctrl-1: should contain uhs mode pin ctrl
+
+Example showing 2 clocks:
+	sdhi0: sd@e804e000 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e000 0x100>;
+		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI00>,
+			 <&mstp12_clks R7S72100_CLK_SDHI01>;
+		clock-names = "core", "cd";
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		status = "disabled";
+	};
-- 
2.10.1
