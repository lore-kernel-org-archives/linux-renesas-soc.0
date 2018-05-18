Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752608AbeERLSh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/69] ARM: dts: renesas: replace toshiba, mmc-wrprotect-disable with disable-wp
Date: Fri, 18 May 2018 13:16:42 +0200
Message-Id: <9eb663e838aba244b97fed0000cb3917f6013e96.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masahiro Yamada <yamada.masahiro@socionext.com>

Follow up commit 788778b0d21a ("mmc: tmio: deprecate "toshiba,
mmc-wrprotect-disable" DT property").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 4 ++--
 arch/arm/boot/dts/sh73a0.dtsi         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index ec7c86e06538..125c39c0222f 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -234,7 +234,7 @@
 &sdhi0 {
 	vmmc-supply = <&vcc_sdhi0>;
 	bus-width = <4>;
-	toshiba,mmc-wrprotect-disable;
+	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi0_pins>;
 	status = "okay";
@@ -244,7 +244,7 @@
 	vmmc-supply = <&ape6evm_fixed_3v3>;
 	bus-width = <4>;
 	broken-cd;
-	toshiba,mmc-wrprotect-disable;
+	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi1_pins>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 914a7c2a584f..39cc58672bf4 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -336,7 +336,7 @@
 			      GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI1>;
 		power-domains = <&pd_a3sp>;
-		toshiba,mmc-wrprotect-disable;
+		disable-wp;
 		cap-sd-highspeed;
 		status = "disabled";
 	};
@@ -348,7 +348,7 @@
 			      GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI2>;
 		power-domains = <&pd_a3sp>;
-		toshiba,mmc-wrprotect-disable;
+		disable-wp;
 		cap-sd-highspeed;
 		status = "disabled";
 	};
-- 
2.11.0
