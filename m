Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbdGaPDu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:03:50 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 22/31] arm64: dts: salvator-xs: Add VC6 clock generator
Date: Mon, 31 Jul 2017 17:03:14 +0200
Message-Id: <b127daecc70896fce7a2b2ada2f43b9ba7868b92.1501509526.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501509525.git.horms+renesas@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The VC6 is an I2C-controlled programmable clock generator, used on the
board to provide a display dot clock. Add it to DT.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
index 81227e3c2c6f..bf4d200fb546 100644
--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -18,3 +18,13 @@
 &extal_clk {
 	clock-frequency = <16640000>;
 };
+
+&i2c4 {
+	versaclock6: clock-generator@6a {
+		compatible = "idt,5p49v6901";
+		reg = <0x6a>;
+		#clock-cells = <1>;
+		clocks = <&x23_clk>;
+		clock-names = "xin";
+	};
+};
-- 
2.1.4
