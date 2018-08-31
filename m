Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:47514 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727282AbeHaM2x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 08:28:53 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: revise properties for usb 2.0
Date: Fri, 31 Aug 2018 17:20:51 +0900
Message-Id: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen3 needs to enable/deassert clocks/resets of both usb 2.0
host (included phy) and peripheral. Otherwise, other side device
cannot work correctly. So, this patch revises properties of clocks
and resets. After that, each device driver can enable/deassert
clocks/resets by its self.

Notes:
 - To work the renesas_usbhs driver correctly when host side drivers
   are disabled and the renesas_usbhs driver doesn't have multiple
   clock management, this patch doesn't change the order of the clocks
   property in each hsusb node.
 - This patch doesn't have any side-effects even if the renesas_usbhs
   driver doesn't have reset_control and multiple clock management.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the renesas.git / renesas-devel-20180830-v4.19-rc1 tag.
 This patch is related to the following patch series:

  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=13587
  

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 34 ++++++++++++++++---------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 17 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 12 +++++------
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 12 +++++------
 5 files changed, 48 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c417d4a..9e9aead 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -707,7 +707,8 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			clock-names = "hsusb", "ehci/ohci";
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -715,7 +716,7 @@
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -724,7 +725,8 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe659c000 0 0x100>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 705>;
+			clocks = <&cpg CPG_MOD 705>, <&cpg CPG_MOD 700>;
+			clock-names = "hsusb", "ehci/ohci";
 			dmas = <&usb_dmac2 0>, <&usb_dmac2 1>,
 			       <&usb_dmac3 0>, <&usb_dmac3 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -732,7 +734,7 @@
 			phys = <&usb2_phy3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 705>;
+			resets = <&cpg 705>, <&cpg 700>;
 			status = "disabled";
 		};
 
@@ -2098,11 +2100,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -2134,11 +2136,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee0e0000 0 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 700>;
+			clocks = <&cpg CPG_MOD 700>, <&cpg CPG_MOD 705>;
 			phys = <&usb2_phy3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 700>;
+			resets = <&cpg 700>, <&cpg 705>;
 			status = "disabled";
 		};
 
@@ -2146,12 +2148,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -2185,12 +2187,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee0e0100 0 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 700>;
+			clocks = <&cpg CPG_MOD 700>, <&cpg CPG_MOD 705>;
 			phys = <&usb2_phy3>;
 			phy-names = "usb";
 			companion = <&ohci3>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 700>;
+			resets = <&cpg 700>, <&cpg 705>;
 			status = "disabled";
 		};
 
@@ -2199,9 +2201,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
@@ -2233,9 +2235,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee0e0200 0 0x700>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 700>;
+			clocks = <&cpg CPG_MOD 700>, <&cpg CPG_MOD 705>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 700>;
+			resets = <&cpg 700>, <&cpg 705>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 28a0794..7b1472d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -677,7 +677,8 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			clock-names = "hsusb", "ehci/ohci";
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -685,7 +686,7 @@
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -1970,11 +1971,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -1994,12 +1995,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -2021,9 +2022,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 77fb909..80cb19d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -593,7 +593,8 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			clock-names = "hsusb", "ehci/ohci";
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -601,7 +602,7 @@
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -1468,11 +1469,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -1492,12 +1493,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -1519,9 +1520,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 2ee0edf..6b1a307 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -434,11 +434,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc 32>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -446,12 +446,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc 32>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -460,9 +460,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc 32>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 625ba2b..89a04a4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -829,11 +829,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -841,12 +841,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -855,9 +855,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
-- 
1.9.1
