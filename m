Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:32264 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728979AbeJATsw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 15:48:52 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v7 3/3] ARM: dts: r9a06g032: Add pinctrl node
Date: Mon,  1 Oct 2018 14:10:26 +0100
Message-Id: <20181001131026.14635-4-phil.edworthy@renesas.com>
In-Reply-To: <20181001131026.14635-1-phil.edworthy@renesas.com>
References: <20181001131026.14635-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This provides a pinctrl driver for the Renesas R9A06G032 SoC

Based on a patch originally written by Michel Pollet at Renesas.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v7:
 - No changes.

v6:
 - No changes.

v5:
 - No changes.

v4:
 - No changes.

v3:
 - No changes.

v2:
 - Add "renesas,rzn1-pinctrl" compatible fallback string
 - Register size corrected.
---
 arch/arm/boot/dts/r9a06g032.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index eaf94976ed6d..2322268bc862 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -165,6 +165,14 @@
 			status = "disabled";
 		};
 
+		pinctrl: pin-controller@40067000 {
+			compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
+			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
+			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
+			clock-names = "bus";
+			status = "okay";
+		};
+
 		gic: gic@44101000 {
 			compatible = "arm,cortex-a7-gic", "arm,gic-400";
 			interrupt-controller;
-- 
2.17.1
