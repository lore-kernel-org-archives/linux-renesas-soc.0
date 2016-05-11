Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12990 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbcEKFb0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:26 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 111E8D80219
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:25 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 9F000A40248
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:24 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2 09/10] ARM: dts: r8a779x: Add reset module support
Date: Wed, 11 May 2016 07:29:37 +0200
Message-ID: <1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dirk Behme <dirk.behme@gmail.com>

The reset module on RCar Gen2 and Gen3 SoCs contains various reset handling
related registers. Their content is implementation dependent.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 .../devicetree/bindings/misc/renesas,rcar-rst.txt         | 15 +++++++++++++++
 arch/arm/boot/dts/r8a7790.dtsi                            |  5 +++++
 arch/arm/boot/dts/r8a7791.dtsi                            |  5 +++++
 arch/arm/boot/dts/r8a7793.dtsi                            |  5 +++++
 arch/arm/boot/dts/r8a7794.dtsi                            |  6 ++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi                  |  5 +++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi                  |  5 +++++
 7 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt

diff --git a/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
new file mode 100644
index 0000000..88695c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
@@ -0,0 +1,15 @@
+Renesas RCar r8a779x reset module
+-----------------------------------------------------
+This binding defines the reset module found on Renesas RCar r8a779x
+SoCs. The reset module contains several reset related registers,
+the meaning of them is implementation dependent.
+
+Required properties:
+- compatible : "renesas,rcar-rst"
+- reg : Location and size of the reset module
+
+Example:
+	reset-controller@e6160000 {
+		compatible = "renesas,rcar-rst";
+		reg = <0 0xe6160000 0 0x200>;
+	};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 83cf23c..d9b86c4 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1102,6 +1102,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7790-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index db67e34..9c7a210 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1122,6 +1122,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7791-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 1dd6d20..31858c6 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -933,6 +933,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7793-div6-clock",
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index f334a3a..c419ca6 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -932,6 +932,12 @@
 					     "rcan";
 			#power-domain-cells = <0>;
 		};
+
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7794-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7181db0..1266975 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -309,6 +309,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7795-sysc";
 			reg = <0 0xe6180000 0 0x0400>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1389528..c3d6075 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -109,6 +109,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7796-sysc";
 			reg = <0 0xe6180000 0 0x0400>;
-- 
2.8.0
