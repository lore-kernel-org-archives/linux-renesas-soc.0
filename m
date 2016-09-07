Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:51:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 23/26] ARM: dts: r8a7792: add QSPI clock
Date: Wed,  7 Sep 2016 09:50:10 +0200
Message-Id: <4719d8f9356a9ea8287ebdac04d759482524e67c.1473234372.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Describe the QSPI clock in the R8A7792 device tree.

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index ff47755fb01e..6ff3e365d56a 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -860,6 +860,7 @@
 			clocks = <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&p_clk>, <&p_clk>,
+				 <&cpg_clocks R8A7792_CLK_QSPI>,
 				 <&cp_clk>, <&cp_clk>, <&hp_clk>, <&hp_clk>,
 				 <&hp_clk>, <&hp_clk>, <&hp_clk>, <&hp_clk>;
 			#clock-cells = <1>;
@@ -870,6 +871,7 @@
 				R8A7792_CLK_GPIO1 R8A7792_CLK_GPIO0
 				R8A7792_CLK_GPIO11 R8A7792_CLK_GPIO10
 				R8A7792_CLK_CAN1 R8A7792_CLK_CAN0
+				R8A7792_CLK_QSPI_MOD
 				R8A7792_CLK_GPIO9 R8A7792_CLK_GPIO8
 				R8A7792_CLK_I2C5 R8A7792_CLK_I2C4
 				R8A7792_CLK_I2C3 R8A7792_CLK_I2C2
@@ -879,8 +881,9 @@
 				"gpio7", "gpio6", "gpio5", "gpio4",
 				"gpio3", "gpio2", "gpio1", "gpio0",
 				"gpio11", "gpio10", "can1", "can0",
-				"gpio9", "gpio8", "i2c5", "i2c4",
-				"i2c3",	"i2c2", "i2c1", "i2c0";
+				"qspi_mod", "gpio9", "gpio8",
+				"i2c5", "i2c4", "i2c3", "i2c2",
+				"i2c1", "i2c0";
 		};
 	};
 
-- 
2.7.0.rc3.207.g0ac5344
