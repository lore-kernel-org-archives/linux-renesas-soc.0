Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:39024 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751663AbeB0UKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 15:10:31 -0500
Received: by mail-lf0-f66.google.com with SMTP id f75so110671lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 12:10:31 -0800 (PST)
Subject: [PATCH v2 3/5] arm64: dts: renesas: r8a77970: add DU support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
Message-ID: <def07929-5fb9-f852-38a0-c46daa671288@cogentembedded.com>
Date: Tue, 27 Feb 2018 23:10:27 +0300
MIME-Version: 1.0
In-Reply-To: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A77970 part of the DU device node.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- added the "resets" property;
- renamed the output endpoint's label.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -630,6 +630,35 @@
 			resets = <&cpg 623>;
 			renesas,fcp = <&fcpvd0>;
 		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a77970";
+			reg = <0 0xfeb00000 0 0x80000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 724>;
+			vsps = <&vspd0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du_out_lvds0: endpoint {
+					};
+				};
+			};
+		};
 	};
 
 	timer {
