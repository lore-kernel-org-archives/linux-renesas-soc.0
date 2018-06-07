Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34728 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753373AbeFGUXK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 16:23:10 -0400
Received: by mail-lf0-f66.google.com with SMTP id o9-v6so16644745lfk.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 13:23:09 -0700 (PDT)
Subject: [PATCH v2 4/5] arm64: dts: renesas: r8a77980: add LVDS support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
Message-ID: <3e46c70c-c6be-d019-95a9-bf09c888c9c0@cogentembedded.com>
Date: Thu, 7 Jun 2018 23:23:06 +0300
MIME-Version: 1.0
In-Reply-To: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A77980 part of the LVDS device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -696,6 +696,35 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds-encoder@feb90000 {
+			compatible = "renesas,r8a77980-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint =
+							<&du_out_lvds0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
 					};
 				};
 			};
