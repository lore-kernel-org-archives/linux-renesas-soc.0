Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:51566 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751647AbdDCJpz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 05:45:55 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: r8a7791: Correct parent of SSI[0-9] clocks
Date: Mon,  3 Apr 2017 11:45:42 +0200
Message-Id: <1491212743-6911-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1491212743-6911-1-git-send-email-geert+renesas@glider.be>
References: <1491212743-6911-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The SSI-ALL gate clock is located in between the P clock and the
individual SSI[0-9] clocks, hence the former should be listed as their
parent.

Fixes: ee9141522dcf13f8 ("ARM: shmobile: r8a7791: add MSTP10 support on DTSI")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index b319ef4d57b0eb7a..a6478ca3f4ca7554 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1447,8 +1447,11 @@
 			compatible = "renesas,r8a7791-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150998 0 4>, <0 0xe61509a8 0 4>;
 			clocks = <&p_clk>,
-				<&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>,
-				<&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>,
+				<&mstp10_clks R8A7791_CLK_SSI_ALL>, <&mstp10_clks R8A7791_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7791_CLK_SSI_ALL>, <&mstp10_clks R8A7791_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7791_CLK_SSI_ALL>, <&mstp10_clks R8A7791_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7791_CLK_SSI_ALL>, <&mstp10_clks R8A7791_CLK_SSI_ALL>,
+				<&mstp10_clks R8A7791_CLK_SSI_ALL>, <&mstp10_clks R8A7791_CLK_SSI_ALL>,
 				<&p_clk>,
 				<&mstp10_clks R8A7791_CLK_SCU_ALL>, <&mstp10_clks R8A7791_CLK_SCU_ALL>,
 				<&mstp10_clks R8A7791_CLK_SCU_ALL>, <&mstp10_clks R8A7791_CLK_SCU_ALL>,
-- 
2.7.4
