Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753119AbdCTI7P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:59:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
        Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Dien Pham <dien.pham.ry@rvc.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/32] arm64: dts: r8a7795: Add I2C for DVFS core to dtsi
Date: Mon, 20 Mar 2017 09:57:14 +0100
Message-Id: <d7e0d64a46f97f67ecbc0194ce6a394f512109c5.1489999913.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1489999913.git.horms+renesas@verge.net.au>
References: <cover.1489999913.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Keita Kobayashi <keita.kobayashi.ym@renesas.com>

This patch adds I2C for DVFS device support for R8A7795 SoC.

Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index eac4f29aa5cd..fe266bb3d913 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -25,6 +25,7 @@
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		i2c7 = &i2c_dvfs;
 	};
 
 	psci {
@@ -793,6 +794,19 @@
 			status = "disabled";
 		};
 
+		i2c_dvfs: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a7795",
+				     "renesas,rcar-gen3-iic",
+				     "renesas,rmobile-iic";
+			reg = <0 0xe60b0000 0 0x425>;
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 926>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.0.rc3.207.g0ac5344
