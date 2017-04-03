Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:50646 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751947AbdDCJpz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 05:45:55 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] ARM: dts: r8a7793: Correct parent of SSI[0-9] clocks
Date: Mon,  3 Apr 2017 11:45:43 +0200
Message-Id: <1491212743-6911-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1491212743-6911-1-git-send-email-geert+renesas@glider.be>
References: <1491212743-6911-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The SSI-ALL gate clock is located in between the P clock and the
individual SSI[0-9] clocks, hence the former should be listed as their
parent.

Fixes: 072d326542e49187 ("ARM: dts: r8a7793: add MSTP10 clocks to device tree")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 9fcf3a9ca0846047..4de6041d61f9d4ec 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -1269,8 +1269,11 @@
 			compatible = "renesas,r8a7793-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150998 0 4>, <0 0xe61509a8 0 4>;
 			clocks = <&p_clk>,
-				<&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>,
-				<&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>,
+				<&mstp10_clks R8A7793_CLK_SSI_ALL>, <&mstp10_clks R8A7793_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7793_CLK_SSI_ALL>, <&mstp10_clks R8A7793_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7793_CLK_SSI_ALL>, <&mstp10_clks R8A7793_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7793_CLK_SSI_ALL>, <&mstp10_clks R8A7793_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7793_CLK_SSI_ALL>, <&mstp10_clks R8A7793_CLK_SSI_ALL>,
 				<&p_clk>,
 				<&mstp10_clks R8A7793_CLK_SCU_ALL>, <&mstp10_clks R8A7793_CLK_SCU_ALL>,
 				<&mstp10_clks R8A7793_CLK_SCU_ALL>, <&mstp10_clks R8A7793_CLK_SCU_ALL>,
-- 
2.7.4
