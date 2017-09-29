Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752453AbdI2Lx3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/22] arm64: dts: renesas: r8a7795-es1: Drop extra zero from usb unit address
Date: Fri, 29 Sep 2017 13:52:10 +0200
Message-Id: <0e0f4d47288a8e56ed2586699b89573afcb1bf72.1506678250.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506678250.git.horms+renesas@verge.net.au>
References: <cover.1506678250.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

With W=1:

    arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/usb@ee0400000 simple-bus unit address format error, expected "ee040000"
    arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (simple_bus_reg): Node /soc/usb@ee0400000 simple-bus unit address format error, expected "ee040000"

Fixes: 291e0c4994d0813f ("arm64: dts: r8a7795: Add support for R-Car H3 ES2.0")
Fixes: 171f2ef82284f61b ("arm64: dts: r8a7795: Add USB3.0 host device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index aaa5e67a963e..655dd30639c5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -11,7 +11,7 @@
 #include "r8a7795.dtsi"
 
 &soc {
-	xhci1: usb@ee0400000 {
+	xhci1: usb@ee040000 {
 		compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
 		reg = <0 0xee040000 0 0xc00>;
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.1.4
