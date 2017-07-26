Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:7685 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751089AbdGZLcx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2017 07:32:53 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a7795: add usb2.0 host ch3 device nodes
Date: Wed, 26 Jul 2017 20:29:38 +0900
Message-Id: <1501068580-3981-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for usb2.0 host ch3 device nodes for R-Car
H3 ES2.0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  2 ++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 2c24943..1eccc7c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -22,6 +22,8 @@
 	};
 
 	/delete-node/ usb-phy@ee0e0200;
+	/delete-node/ usb@ee0e0100;
+	/delete-node/ usb@ee0e0000;
 
 	fcpf2: fcp@fe952000 {
 		compatible = "renesas,fcpf";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1b20892..c3b1285 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1628,6 +1628,19 @@
 			status = "disabled";
 		};
 
+		ehci3: usb@ee0e0100 {
+			compatible = "generic-ehci";
+			reg = <0 0xee0e0100 0 0x100>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 700>;
+			phys = <&usb2_phy3>;
+			phy-names = "usb";
+			companion= <&ohci3>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 700>;
+			status = "disabled";
+		};
+
 		ohci0: usb@ee080000 {
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
@@ -1664,6 +1677,18 @@
 			status = "disabled";
 		};
 
+		ohci3: usb@ee0e0000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee0e0000 0 0x100>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 700>;
+			phys = <&usb2_phy3>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 700>;
+			status = "disabled";
+		};
+
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a7795",
 				     "renesas,rcar-gen3-usbhs";
-- 
1.9.1
