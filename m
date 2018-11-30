Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:11551 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726616AbeLACpS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 21:45:18 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 12/21] ARM: dts: r8a7744-iwg20m: Add eMMC support
Date: Fri, 30 Nov 2018 15:26:26 +0000
Message-Id: <1543591595-37861-13-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
References: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add eMMC support for iWave RZ/G1N Qseven System On Module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
   * No Change
---
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
index 6166ae0..1e57b1f 100644
--- a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
+++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
@@ -29,3 +29,20 @@
 &extal_clk {
 	clock-frequency = <20000000>;
 };
+
+&pfc {
+	mmcif0_pins: mmc {
+		groups = "mmc_data8_b", "mmc_ctrl";
+		function = "mmc";
+	};
+};
+
+&mmcif0 {
+	pinctrl-0 = <&mmcif0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&reg_3p3v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
-- 
2.7.4
