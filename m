Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:39411 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389156AbeIUNnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 09:43:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: revise properties for R-Car Gen3 SoCs' usb 2.0
Date: Fri, 21 Sep 2018 16:54:17 +0900
Message-Id: <1537516457-20421-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen3 SoCs need to enable/deassert clocks/resets of both usb 2.0
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
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 This patch is based on the renesas.git / renesas-devel-20180919-v4.19-rc4 tag.
 This patch is related to the following patches which will be merged into
 v4.20:

  https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=0e4aeab775f9e9358c4bc522b87e9f6e2cfe0973
  https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=c29e240484ea17c756455149348e59523f462993
  https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=f181dbb4824130e84f46e5be5b49cf6456f96683
  https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=8e0d368a59bf87efa5ee4daea142527d01447864
  https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=3df0e240caba641e0d70640e3baf34d34c105176

Changes from v1:
 - Revise the subject and log a little.
 - Remove clock-names.
 - Add Simon-san's Reviewed-by.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 32 +++++++++++++++----------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 12 ++++++------
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 12 ++++++------
 5 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 83077fd..b5f2273 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -697,7 +697,7 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -705,7 +705,7 @@
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -714,7 +714,7 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe659c000 0 0x100>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 705>;
+			clocks = <&cpg CPG_MOD 705>, <&cpg CPG_MOD 700>;
 			dmas = <&usb_dmac2 0>, <&usb_dmac2 1>,
 			       <&usb_dmac3 0>, <&usb_dmac3 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -722,7 +722,7 @@
 			phys = <&usb2_phy3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 705>;
+			resets = <&cpg 705>, <&cpg 700>;
 			status = "disabled";
 		};
 
@@ -2097,11 +2097,11 @@
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
 
@@ -2133,11 +2133,11 @@
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
 
@@ -2145,12 +2145,12 @@
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
 
@@ -2184,12 +2184,12 @@
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
 
@@ -2198,9 +2198,9 @@
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
@@ -2232,9 +2232,9 @@
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
index 947bfc2..1ec6aaa 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -676,7 +676,7 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -684,7 +684,7 @@
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -1969,11 +1969,11 @@
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
 
@@ -1993,12 +1993,12 @@
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
 
@@ -2020,9 +2020,9 @@
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
index 31d2319..fd00010 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -592,7 +592,7 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x100>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -600,7 +600,7 @@
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -1467,11 +1467,11 @@
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
 
@@ -1491,12 +1491,12 @@
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
 
@@ -1518,9 +1518,9 @@
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
index 2cb5c19..0c726ea 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -793,11 +793,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -805,12 +805,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -819,9 +819,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
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
