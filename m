Return-Path: <SRS0+uua1=PN=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,joro@8bytes.org,geert+renesas@glider.be
Date: Fri, 18 Mar 2016 01:56:12 +0900
Message-Id: <20160317165612.28213.75474.sendpatchset@little-apple>
In-Reply-To: <20160317165527.28213.60694.sendpatchset@little-apple>
References: <20160317165527.28213.60694.sendpatchset@little-apple>
Subject: [PATCH/RFC 05/05] arm64: dts: salvator-x: External SCIF3/HSCIF3 loop
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add SCIF3 and HSCIF3 as two new serial ports to the r8a7795
Salvator-X DT file. 

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ work/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts	2016-03-17 17:14:00.630513000 +0900
@@ -42,6 +42,8 @@
 	aliases {
 		serial0 = &scif2;
 		serial1 = &scif1;
+		serial2 = &scif3;
+		serial3 = &hscif3;
 		ethernet0 = &avb;
 	};
 
@@ -153,6 +155,14 @@
 		renesas,groups = "scif2_data_a";
 		renesas,function = "scif2";
 	};
+	scif3_pins: scif3 { /* TX: 1_11, RX: 1_8 */
+		renesas,groups = "scif3_data_b";
+		renesas,function = "scif3";
+	};
+	hscif3_pins: hscif3 { /* TX: 2_8, RX: 2_7 */
+		renesas,groups = "hscif3_data_d";
+		renesas,function = "hscif3";
+	};
 	scif_clk_pins: scif_clk {
 		renesas,groups = "scif_clk_a";
 		renesas,function = "scif_clk";
@@ -205,6 +215,22 @@
 	pinctrl-names = "default";
 
 	status = "okay";
+};
+
+&scif3 {
+	pinctrl-0 = <&scif3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* SCIF3 TX -> HSCIF3 RX, HSCIF3 TX -> SCIF3 RX */
+
+&hscif3 {
+	pinctrl-0 = <&hscif3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
 
 &scif2 {
