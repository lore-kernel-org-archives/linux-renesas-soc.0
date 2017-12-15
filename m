Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:44345 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756692AbdLOPPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:15:02 -0500
Received: by mail-wm0-f65.google.com with SMTP id t8so18084636wmc.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:15:01 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org, Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 4/4] arm64: dts: r8a7796: Add DEVFREQ support for GSX
Date: Fri, 15 Dec 2017 16:14:50 +0100
Message-Id: <1513350890-2446-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Gaku Inami <gaku.inami.xw@bp.renesas.com>

This patch supports GSX frequency scaling using devfreq.

Includes update of the OPP tables for GSX because the typical voltage of
VDD_DVFS (power optimized) was updated to 0.83V by R-Car Gen3 EC Rev0.54E
specification.

Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d3264e7..fb30390 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -166,6 +166,27 @@
 		};
 	};
 
+	gsx_opp_table: gsx_opp_table {
+		compatible = "operating-points-v2";
+
+		opp@200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <830000>;
+		};
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <830000>;
+		};
+		opp@400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <830000>;
+		};
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <830000>;
+		};
+	};
+
 	extal_clk: extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -2246,6 +2267,7 @@
 			reg = <0 0xfd000000 0 0x3ffff>;
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 112>;
+			operating-points-v2 = <&gsx_opp_table>;
 			power-domains = <&sysc R8A7796_PD_3DG_B>;
 		};
 
-- 
2.7.4
