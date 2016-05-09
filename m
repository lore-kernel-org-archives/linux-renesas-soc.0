Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57397 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750879AbcEIHPq (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:15:46 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta24.fe.bosch.de (Postfix) with ESMTP id BCA1BD80222
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:44 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 7288B2E40475
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:44 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 09/10] ARM: r8a779x: Add boot mode reg support
Date: Mon, 9 May 2016 09:14:00 +0200
Message-ID: <1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dirk Behme <dirk.behme@gmail.com>

The boot mode register is a 32bit unsigned entity, the meaning of its values
are implementation dependent.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 arch/arm/boot/dts/r8a7790.dtsi           | 5 +++++
 arch/arm/boot/dts/r8a7791.dtsi           | 5 +++++
 arch/arm/boot/dts/r8a7793.dtsi           | 5 +++++
 arch/arm/boot/dts/r8a7794.dtsi           | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 6 files changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 83cf23c..3f775b0 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1102,6 +1102,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		modemr: modemr@e6160060 {
+			compatible = "renesas,modemr";
+			reg = <0 0xe6160060 0 0x4>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7790-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index db67e34..e1cd497 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1122,6 +1122,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		modemr: modemr@e6160060 {
+			compatible = "renesas,modemr";
+			reg = <0 0xe6160060 0 0x4>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7791-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 1dd6d20..683f11d 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -933,6 +933,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		modemr: modemr@e6160060 {
+			compatible = "renesas,modemr";
+			reg = <0 0xe6160060 0 0x4>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7793-div6-clock",
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index f334a3a..f849306 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -932,6 +932,12 @@
 					     "rcan";
 			#power-domain-cells = <0>;
 		};
+
+		modemr: modemr@e6160060 {
+			compatible = "renesas,modemr";
+			reg = <0 0xe6160060 0 0x4>;
+		};
+
 		/* Variable factor clocks */
 		sd2_clk: sd2@e6150078 {
 			compatible = "renesas,r8a7794-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7181db0..2b957a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -309,6 +309,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		modemr: modemr@e6160060 {
+			compatible = "renesas,modemr";
+			reg = <0 0xe6160060 0 0x4>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7795-sysc";
 			reg = <0 0xe6180000 0 0x0400>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1389528..4a9054c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -109,6 +109,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		modemr: modemr@e6160060 {
+			compatible = "renesas,modemr";
+			reg = <0 0xe6160060 0 0x4>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7796-sysc";
 			reg = <0 0xe6180000 0 0x0400>;
-- 
2.8.0
