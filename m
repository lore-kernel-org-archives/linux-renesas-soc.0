Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:9463 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726986AbeJPNzu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 09:55:50 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: revise hsusb's reg size
Date: Tue, 16 Oct 2018 15:04:50 +0900
Message-Id: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch revises the reg size of each hsusb device node for
r8a7795, r8a7796 and r8a77965.

Reported-by: Biju Das <biju.das@bp.renesas.com>
Fixes: d2422e108812 ("arm64: dts: r8a7795: Add HSUSB device node")
Fixes: 4725f2b88057 ("arm64: dts: renesas: r8a7795: add hsusb ch3 device node")
Fixes: b9535853777f ("arm64: dts: r8a7796: Add HSUSB device node")
Fixes: 9e1b00a2ef43 ("arm64: dts: renesas: r8a77965: Add "reg" properties")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 4 ++--
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 5f6020e..0b54c53 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -695,7 +695,7 @@
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a7795",
 				     "renesas,rcar-gen3-usbhs";
-			reg = <0 0xe6590000 0 0x100>;
+			reg = <0 0xe6590000 0 0x200>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
@@ -712,7 +712,7 @@
 		hsusb3: usb@e659c000 {
 			compatible = "renesas,usbhs-r8a7795",
 				     "renesas,rcar-gen3-usbhs";
-			reg = <0 0xe659c000 0 0x100>;
+			reg = <0 0xe659c000 0 0x200>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 705>, <&cpg CPG_MOD 700>;
 			dmas = <&usb_dmac2 0>, <&usb_dmac2 1>,
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1ec6aaa..3baee26 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -674,7 +674,7 @@
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a7796",
 				     "renesas,rcar-gen3-usbhs";
-			reg = <0 0xe6590000 0 0x100>;
+			reg = <0 0xe6590000 0 0x200>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 83946ca..f12be5b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -590,7 +590,7 @@
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a77965",
 				     "renesas,rcar-gen3-usbhs";
-			reg = <0 0xe6590000 0 0x100>;
+			reg = <0 0xe6590000 0 0x200>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
-- 
1.9.1
