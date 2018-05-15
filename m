Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:41837 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752421AbeEOMU5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 08:20:57 -0400
Received: by mail-wr0-f194.google.com with SMTP id g21-v6so15772639wrb.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 05:20:56 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a77995-draak: add X12 input dot clock
Date: Tue, 15 May 2018 14:20:40 +0200
Message-Id: <1526386840-15368-6-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

74.25 Mhz oscillator X12 is connected to DU_DOTCLKIN0.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index b059e32..04d2018 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -117,6 +117,12 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	x12_clk: x12 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
 };
 
 &extal_clk {
@@ -235,6 +241,11 @@
 	pinctrl-names = "default";
 	status = "okay";
 
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&x12_clk>;
+	clock-names = "du.0", "du.1", "dclkin.0";
+
 	ports {
 		port@0 {
 			endpoint {
-- 
2.7.4
