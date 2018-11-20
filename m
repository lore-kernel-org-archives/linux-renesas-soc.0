Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:6914 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726546AbeKTVDD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 16:03:03 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] ARM: dts: r9a06g032: Correct the GIC DT node name
Date: Tue, 20 Nov 2018 10:34:27 +0000
Message-Id: <20181120103427.23950-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Harmless mistake, but it's incorrect.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 2322268bc862..4c1ab49c7d39 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -173,7 +173,7 @@
 			status = "okay";
 		};
 
-		gic: gic@44101000 {
+		gic: interrupt-controller@44101000 {
 			compatible = "arm,cortex-a7-gic", "arm,gic-400";
 			interrupt-controller;
 			#interrupt-cells = <3>;
-- 
2.17.1
