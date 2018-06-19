Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:46175 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937514AbeFSPRZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 11:17:25 -0400
Received: by mail-pf0-f193.google.com with SMTP id q1-v6so10809pff.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jun 2018 08:17:24 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Jun 2018 00:19:03 +0900
Message-Id: <152942154349.28480.6185772843276119432.sendpatchset@little-apple>
In-Reply-To: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
References: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
Subject: [PATCH 02/04] arm64: dts: renesas: r8a77990: add VIN and CSI-2 nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add VIN and CSI device nodes to the r8a77990 dtsi file.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-06-19 20:16:52.580607110 +0900
@@ -248,6 +248,63 @@
 			status = "disabled";
 		};
 
+		vin4: video@e6ef4000 {
+			compatible = "renesas,vin-r8a77990";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 807>;
+			renesas,id = <4>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin4csi40: endpoint@0 {
+						reg = <0>;
+						remote-endpoint= <&csi40vin4>;
+					};
+				};
+			};
+		};
+
+		vin5: video@e6ef5000 {
+			compatible = "renesas,vin-r8a77990";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 806>;
+			renesas,id = <5>;
+			status = "disabled";
+
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin5csi40: endpoint@0 {
+						reg = <0>;
+						remote-endpoint= <&csi40vin5>;
+					};
+				};
+			};
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -265,6 +322,38 @@
 			resets = <&cpg 408>;
 		};
 
+
+		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a77990-csi2";
+			reg = <0 0xfeaa0000 0 0x10000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 716>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					csi40vin4: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&vin4csi40>;
+					};
+					csi40vin5: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&vin5csi40>;
+					};
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
