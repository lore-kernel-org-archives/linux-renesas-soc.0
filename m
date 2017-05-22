Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933876AbdEVN7h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 09:59:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/35] arm64: dts: r8a7796: Add external audio clocks
Date: Mon, 22 May 2017 15:58:46 +0200
Message-Id: <bab732f84aac51b00399ce63bf76d0b5241e4051.1495457812.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495457812.git.horms+renesas@verge.net.au>
References: <cover.1495457812.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add the external audio clocks as zero Hz fixed-frequency clocks.
Boards that provide these clocks should override them.

Based on commit 623197b90c7aa97c ("arm64: renesas: r8a7795: Sound SSI
PIO support").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 2ec1ed5f4991..101cd41d693a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -120,6 +120,29 @@
 		clock-frequency = <0>;
 	};
 
+	/*
+	 * The external audio clocks are configured as 0 Hz fixed frequency
+	 * clocks by default.
+	 * Boards that provide audio clocks should override them.
+	 */
+	audio_clk_a: audio_clk_a {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	audio_clk_b: audio_clk_b {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	audio_clk_c: audio_clk_c {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
 		compatible = "fixed-clock";
-- 
2.1.4
