Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34549 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932495AbcIBQYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 12:24:52 -0400
Received: by mail-lf0-f54.google.com with SMTP id p41so68860560lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 09:24:52 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v5 1/4] arm64: dts: h3ulcb: enable GPIO leds
Date: Fri,  2 Sep 2016 19:24:48 +0300
Message-Id: <1472833488-26184-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports GPIO leds on H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes in version 3:
- initially added
Changes in version 4:
- removed led4 in favor of gpio-keys
- added label
Changes in version 5:
- nothing

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index fb694b8..3329f78 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -31,6 +31,19 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led5 {
+			label = "LED5";
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+		};
+		led6 {
+			label = "LED6";
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &extal_clk {
-- 
1.9.1
