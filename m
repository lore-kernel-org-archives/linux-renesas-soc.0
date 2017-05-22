Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933850AbdEVN7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 09:59:18 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/35] arm64: dts: r8a7795: salvator-x: Update memory node to 4 GiB map
Date: Mon, 22 May 2017 15:58:37 +0200
Message-Id: <63e76b90f0725c2a61dea4f067f6d652926ac074.1495457812.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495457812.git.horms+renesas@verge.net.au>
References: <cover.1495457812.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch addes memory region:

  - After changes, the Salvator-X board has the following map:
    Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
    Bank1: 1GiB RAM : 0x000500000000 -> 0x0053fffffff
    Bank2: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
    Bank3: 1GiB RAM : 0x000700000000 -> 0x0073fffffff

  - Before changes, the old map looked like this:
    Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 639aa085d996..f1b6ad3def15 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -56,6 +56,21 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x40000000>;
+	};
+
 	x12_clk: x12 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.1.4
