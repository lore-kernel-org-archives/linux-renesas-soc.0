Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:40308 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754946AbdCGSbd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 13:31:33 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3vd4MJ6zTXzMr9LQ
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2017 19:05:32 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/5] arm64: dts: r8a7796: Add Cortex-A57 PMU node
Date: Tue,  7 Mar 2017 19:03:23 +0100
Message-Id: <1488909806-3322-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1488909806-3322-1-git-send-email-geert+renesas@glider.be>
References: <1488909806-3322-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Enable the performance monitor unit for the Cortex-A57 cores on the
R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d2a2110fc7fc3d23..454e1292f9108b34 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -252,6 +252,14 @@
 			reg = <0 0xe6060000 0 0x50c>;
 		};
 
+		pmu_a57 {
+			compatible = "arm,cortex-a57-pmu";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&a57_0>,
+					     <&a57_1>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7796-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.7.4
