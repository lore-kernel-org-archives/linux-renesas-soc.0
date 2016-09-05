Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33730 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755769AbcIEMkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 08:40:31 -0400
Received: by mail-lf0-f41.google.com with SMTP id h127so22551486lfh.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Sep 2016 05:40:25 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v6] arm64: dts: h3ulcb: enable GPIO leds
Date: Mon,  5 Sep 2016 15:40:21 +0300
Message-Id: <1473079221-2379-1-git-send-email-vladimir.barinov@cogentembedded.com>
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
Changes in version 6:
- removed label

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index fb694b8..3329f78 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -31,6 +31,17 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led5 {
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+		};
+		led6 {
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &extal_clk {
-- 
1.9.1
