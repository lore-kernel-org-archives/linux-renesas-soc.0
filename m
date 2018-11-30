Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:11551 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726585AbeLACpU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 21:45:20 -0500
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
Subject: [PATCH v2 13/21] ARM: dts: r8a7744-iwg20m: Enable SDHI0 controller
Date: Fri, 30 Nov 2018 15:26:27 +0000
Message-Id: <1543591595-37861-14-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
References: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the SDHI0 controller on iWave RZ/G1N Qseven System On Module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
   * Fixed subject line SDHI10 to SDHI0
---
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
index 1e57b1f..503583e 100644
--- a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
+++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
@@ -35,6 +35,12 @@
 		groups = "mmc_data8_b", "mmc_ctrl";
 		function = "mmc";
 	};
+
+	sdhi0_pins: sd0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <3300>;
+	};
 };
 
 &mmcif0 {
@@ -46,3 +52,13 @@
 	non-removable;
 	status = "okay";
 };
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_3p3v>;
+	cd-gpios = <&gpio7 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
-- 
2.7.4
