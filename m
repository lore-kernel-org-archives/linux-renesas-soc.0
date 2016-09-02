Return-Path: <devicetree-owner@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v5 2/4] arm64: dts: h3ulcb: enable GPIO keys
Date: Fri,  2 Sep 2016 19:24:58 +0300
Message-Id: <1472833498-26225-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports GPIO keys on H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 4:
- initially added
Changes in version 5:
- nothing

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 14 +++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index fb694b8..3329f78 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 #include "r8a7795.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Renesas H3ULCB board based on r8a7795";
@@ -31,6 +31,18 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	keyboard {
+		compatible = "gpio-keys";
+
+		key-1 {
+			linux,code = <KEY_1>;
+			label = "SW3";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+		};
+	};
 
 	leds {
 		compatible = "gpio-leds";
-- 
1.9.1

