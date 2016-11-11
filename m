Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34258 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933831AbcKKRIQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:16 -0500
Received: by mail-wm0-f67.google.com with SMTP id g23so10796545wme.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:16 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 09/10] arm64: dts: r8a7795: add HDMI support to DU
Date: Fri, 11 Nov 2016 18:07:45 +0100
Message-Id: <1478884066-1090-10-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 34 ++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 811c32e..d9e5706 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -147,6 +147,30 @@
 		clock-frequency = <0>;
 	};
 
+	programmable_clk0: clock_out0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	x21_clk: x21-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	x22_clk: x22-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	programmable_clk1: clock_out1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -1514,8 +1538,14 @@
 				 <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 722>,
 				 <&cpg CPG_MOD 721>,
-				 <&cpg CPG_MOD 727>;
-			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+				 <&cpg CPG_MOD 727>,
+				 <&programmable_clk0>,
+				 <&x21_clk>,
+				 <&x22_clk>,
+				 <&programmable_clk1>;
+			clock-names = "du.0", "du.1", "du.2", "du.3",
+				      "lvds.0", "dclkin.0", "dclkin.1",
+				      "dclkin.2", "dclkin.3";
 			status = "disabled";
 
 			vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
-- 
2.7.4
