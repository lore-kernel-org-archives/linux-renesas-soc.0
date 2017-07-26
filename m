Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:62011 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751397AbdGZLcz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2017 07:32:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a7795: add hsusb ch3 device node
Date: Wed, 26 Jul 2017 20:29:40 +0900
Message-Id: <1501068580-3981-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for hsusb ch3 device nodes for R-Car H3 ES2.0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 9743aca..aaa5e67 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -24,6 +24,7 @@
 	/delete-node/ usb-phy@ee0e0200;
 	/delete-node/ usb@ee0e0100;
 	/delete-node/ usb@ee0e0000;
+	/delete-node/ usb@e659c000;
 
 	/delete-node/ dma-controller@e6460000;
 	/delete-node/ dma-controller@e6470000;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index d1381d9..b9213e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1734,6 +1734,23 @@
 			status = "disabled";
 		};
 
+		hsusb3: usb@e659c000 {
+			compatible = "renesas,usbhs-r8a7795",
+				     "renesas,rcar-gen3-usbhs";
+			reg = <0 0xe659c000 0 0x100>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>;
+			dmas = <&usb_dmac2 0>, <&usb_dmac2 1>,
+			       <&usb_dmac3 0>, <&usb_dmac3 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <11>;
+			phys = <&usb2_phy3>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7795",
 				     "renesas,pcie-rcar-gen3";
-- 
1.9.1
