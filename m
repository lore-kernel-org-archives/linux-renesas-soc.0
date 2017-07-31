Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbdGaPDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:03:32 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/31] arm64: dts: r8a7796: add IMR-LX4 support
Date: Mon, 31 Jul 2017 17:02:54 +0200
Message-Id: <e8f2ed72f478fa9280aeb1eab70ecc87521e23a9.1501509525.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501509525.git.horms+renesas@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Describe the IMR-LX4 devices in the R8A7796 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1f6710912045..8dad4b9ad46a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1454,5 +1454,25 @@
 				};
 			};
 		};
+
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a7796-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 823>;
+		};
+
+		imr-lx4@fe870000 {
+			compatible = "renesas,r8a7796-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe870000 0 0x2000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 822>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 822>;
+		};
 	};
 };
-- 
2.1.4
