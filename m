Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:60838 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbeH1Rsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 13:48:54 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77965: Fix HS-USB compatible
Date: Tue, 28 Aug 2018 15:57:02 +0200
Message-Id: <20180828135702.3748-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Should be "renesas,usbhs-r8a77965", not "renesas,usbhs-r8a7796".

Fixes: a06e8af801760a98 ("arm64: dts: renesas: r8a77965: add HS-USB node")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 5ce978502ee9f48e..0567e0435e6e1d5c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -589,7 +589,7 @@
 		};
 
 		hsusb: usb@e6590000 {
-			compatible = "renesas,usbhs-r8a7796",
+			compatible = "renesas,usbhs-r8a77965",
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1
