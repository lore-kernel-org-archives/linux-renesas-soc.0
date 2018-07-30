Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43906 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbeG3JHW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 05:07:22 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: r8a77965: Add SATA controller node
Date: Mon, 30 Jul 2018 09:33:38 +0200
Message-Id: <20180730073338.3639-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds SATA controller node for the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[wsa: rebased to upstream base]
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
	* sorted it according to address (Thanks, Geert!)
	* added Geert's tag

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0cd44461a0bd..bf22efb82cbf 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1507,6 +1507,17 @@
 			status = "disabled";
 		};
 
+		sata: sata@ee300000 {
+			compatible = "renesas,sata-r8a77965",
+				     "renesas,rcar-gen3-sata";
+			reg = <0 0xee300000 0 0x200000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 815>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 815>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.11.0
