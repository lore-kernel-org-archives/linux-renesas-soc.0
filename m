Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:41558 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726729AbeJPN4G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 09:56:06 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: add/enable USB2.0 peripheral for R-Car [DE]3
Date: Tue, 16 Oct 2018 15:05:09 +0900
Message-Id: <1539669909-25767-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds/enables USB2.0 peripheral for R-Car [DE]3 boards.
So, the default mode on each board is:
 - R-Car D3 Draak board (has a type-A connector) = host.
 - R-Car E3 Ebisu board (has a type-B micro connector) = peripheral.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changed from v1:
 - Revise the reg size for each hsusb node.

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |  8 +++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 45 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |  8 +++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 45 ++++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index f342dd8..f85655d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -188,6 +188,7 @@
 };
 
 &ehci0 {
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
@@ -195,6 +196,11 @@
 	clock-frequency = <48000000>;
 };
 
+&hsusb {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -295,6 +301,7 @@
 };
 
 &ohci0 {
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
@@ -359,6 +366,7 @@
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
 
+	renesas,no-otg-pins;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 6d5efeb..4bafc38 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -357,6 +357,51 @@
 			resets = <&cpg 407>;
 		};
 
+		hsusb: usb@e6590000 {
+			compatible = "renesas,usbhs-r8a77990",
+				     "renesas,rcar-gen3-usbhs";
+			reg = <0 0xe6590000 0 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
+			       <&usb_dmac1 0>, <&usb_dmac1 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <11>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 704>, <&cpg 703>;
+			status = "disabled";
+		};
+
+		usb_dmac0: dma-controller@e65a0000 {
+			compatible = "renesas,r8a77990-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65a0000 0 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 330>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 330>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac1: dma-controller@e65b0000 {
+			compatible = "renesas,r8a77990-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65b0000 0 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 2405eaa..48bb1d7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -179,6 +179,7 @@
 };
 
 &ehci0 {
+	dr_mode = "host";
 	status = "okay";
 };
 
@@ -186,6 +187,11 @@
 	clock-frequency = <48000000>;
 };
 
+&hsusb {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -337,6 +343,7 @@
 };
 
 &ohci0 {
+	dr_mode = "host";
 	status = "okay";
 };
 
@@ -445,6 +452,7 @@
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
 
+	renesas,no-otg-pins;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 214f495..8530d9f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -344,6 +344,51 @@
 			status = "disabled";
 		};
 
+		hsusb: usb@e6590000 {
+			compatible = "renesas,usbhs-r8a77995",
+				     "renesas,rcar-gen3-usbhs";
+			reg = <0 0xe6590000 0 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
+			       <&usb_dmac1 0>, <&usb_dmac1 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <11>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 704>, <&cpg 703>;
+			status = "disabled";
+		};
+
+		usb_dmac0: dma-controller@e65a0000 {
+			compatible = "renesas,r8a77995-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65a0000 0 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 330>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 330>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac1: dma-controller@e65b0000 {
+			compatible = "renesas,r8a77995-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65b0000 0 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
 		canfd: can@e66c0000 {
 			compatible = "renesas,r8a77995-canfd",
 				     "renesas,rcar-gen3-canfd";
-- 
1.9.1
