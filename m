Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37539 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751244AbdGMLGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 07:06:54 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] arm64: dts: renesas: salvator-xs: Add VC6 clock generator
Date: Thu, 13 Jul 2017 14:06:53 +0300
Message-Id: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The VC6 is an I2C-controlled programmable clock generator, used on the
board to provide a display dot clock. Add it to DT.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Regards,

Laurent Pinchart
