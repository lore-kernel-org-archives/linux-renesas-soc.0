Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43427 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbeKUWqC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 17:46:02 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] arm64: dts: renesas: r8a77990: Add I2C-DVFS device node
Date: Wed, 21 Nov 2018 13:11:39 +0100
Message-Id: <20181121121139.25493-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds I2C-DVFS device node for the R8A77990 SoC.

v2
* Drop aliases update as in upstream it is not required to configure the
  BD9571 PMIC for DDR backup, nor is the use of i2c are aliases desired.
* Do not describe the device as compatible with "renesas,rcar-gen3-iic" or
  "renesas,rmobile-iic" fallback compat strings. The absence of automatic
  transmission registers leads us to declare the r8a77990 IIC controller as
  incompatible.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
[simon: drop aliases hunk and fallback compat string usage]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

 Based on renesas-devel-20181121-v4.20-rc3

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index b0398e05e8ed..4ce07ce791b4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -357,6 +357,20 @@
 			reg = <0 0xe6060000 0 0x508>;
 		};
 
+		i2c_dvfs: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a77990";
+			reg = <0 0xe60b0000 0 0x34>;
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 926>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 926>;
+			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77990-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.11.0
