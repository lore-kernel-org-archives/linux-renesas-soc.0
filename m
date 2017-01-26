Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45215 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753106AbdAZIwr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 03:52:47 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 4/5] arm64: dts: r8a7795: Add I2C for DVFS core to dtsi
Date: Thu, 26 Jan 2017 09:52:29 +0100
Message-Id: <1485420750-12701-5-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1485420750-12701-1-git-send-email-horms+renesas@verge.net.au>
References: <1485420750-12701-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Keita Kobayashi <keita.kobayashi.ym@renesas.com>

This patch adds I2C for DVFS device support for R8A7795 SoC.

Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
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
