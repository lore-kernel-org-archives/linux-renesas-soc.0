Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:50604 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750767AbdH1J0S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2017 05:26:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: draak: Add serial console pins
Date: Mon, 28 Aug 2017 11:26:10 +0200
Message-Id: <1503912370-20180-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pin control for SCIF2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied after v4.14-rc1, when commit 794a6711764658a1 ("pinctrl:
sh-pfc: Initial R8A77995 PFC support") has hit mainline.

Else the serial console will fail, reporting (on earlycon):

    sh-sci e6e88000.serial: could not find pctldev for node /soc/pin-controller@e6060000/scif2, deferring probe
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index d144370051d559fc..19c5462d8b678bde 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -36,7 +36,18 @@
 	clock-frequency = <48000000>;
 };
 
+&pfc {
+	scif2_pins: scif2 {
+		groups = "scif2_data";
+		function = "scif2";
+	};
+
+};
+
 &scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
-- 
2.7.4
