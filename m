Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:43624 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752205AbeFFQ4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 12:56:14 -0400
Received: by mail-lf0-f66.google.com with SMTP id n15-v6so10179383lfn.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 09:56:14 -0700 (PDT)
Subject: [PATCH 3/5] arm64: dts: renesas: r8a77980: add DU support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <4fbd0895-c1ec-41fc-912d-8306dd933997@cogentembedded.com>
Message-ID: <6ccb3998-f964-5e19-53dd-f567e4ed05bf@cogentembedded.com>
Date: Wed, 6 Jun 2018 19:56:11 +0300
MIME-Version: 1.0
In-Reply-To: <4fbd0895-c1ec-41fc-912d-8306dd933997@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A77980 part of the DU device node.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -671,6 +671,36 @@
 			resets = <&cpg 603>;
 		};
 
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a77980",
+				     "renesas,du-r8a77970";
+			reg = <0 0xfeb00000 0 0x80000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
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
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
