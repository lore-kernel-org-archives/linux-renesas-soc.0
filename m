Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:32832 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757485AbdCVCDW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 22:03:22 -0400
From: Rob Herring <robh@kernel.org>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: arm@kernel.org, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/15] ARM: dts: r8a779x: fix PCI bus dtc warnings
Date: Tue, 21 Mar 2017 21:03:04 -0500
Message-Id: <20170322020313.24338-6-robh@kernel.org>
In-Reply-To: <20170322020313.24338-1-robh@kernel.org>
References: <20170322020313.24338-1-robh@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

dtc recently added PCI bus checks. Fix these warnings.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
---
Sub-arch maintainers, please apply to your trees unless arm-soc wants 
to take the whole lot.

 arch/arm/boot/dts/r8a7790.dtsi | 16 ++++++----------
 arch/arm/boot/dts/r8a7791.dtsi | 16 ++++++----------
 arch/arm/boot/dts/r8a7794.dtsi | 16 ++++++----------
 3 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 6d10450de6d7..c16a37e9fb5d 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1598,16 +1598,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -1654,16 +1652,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x20800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x21000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 9f9e48511836..a1d8686eaea5 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1596,16 +1596,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -1631,16 +1629,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x10800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x11000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 319c1069b7ee..c07495185cc4 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -817,16 +817,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
+		usb@1,0 {
 			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
+		usb@2,0 {
 			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
 			phys = <&usb0 0>;
 			phy-names = "usb";
 		};
@@ -852,16 +850,14 @@
 				 0x0800 0 0 1 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
 				 0x1000 0 0 2 &gic GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 
-		usb@0,1 {
-			reg = <0x800 0 0 0 0>;
-			device_type = "pci";
+		usb@1,0 {
+			reg = <0x10800 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
 
-		usb@0,2 {
-			reg = <0x1000 0 0 0 0>;
-			device_type = "pci";
+		usb@2,0 {
+			reg = <0x11000 0 0 0 0>;
 			phys = <&usb2 0>;
 			phy-names = "usb";
 		};
-- 
2.10.1
