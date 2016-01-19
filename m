Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35181 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399AbcASMSV (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 19 Jan 2016 07:18:21 -0500
Received: by mail-lf0-f66.google.com with SMTP id c134so13718193lfb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2016 04:18:20 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: ryo.kodama.vz@renesas.com, takeshi.kihara.df@renesas.com,
	harunobu.kurokawa.dn@renesas.com, magnus.damm@gmail.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 4/4] arm64: dts: r8a7795: Add PWM device nodes
Date: Tue, 19 Jan 2016 13:18:08 +0100
Message-Id: <1453205888-8985-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1453205888-8985-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1453205888-8985-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ryo Kodama <ryo.kodama.vz@renesas.com>

Signed-off-by: Ryo Kodama <ryo.kodama.vz@renesas.com>
Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
[uli: adapted to new MSTP clock scheme]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |  1 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 21 ++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 48 ++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
index 0822a08..d6de643 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
@@ -7,6 +7,7 @@ Required Properties:
  - "renesas,pwm-r8a7790": for R-Car H2
  - "renesas,pwm-r8a7791": for R-Car M2-W
  - "renesas,pwm-r8a7794": for R-Car E2
+ - "renesas,pwm-r8a7795": for R-Car H3
 - reg: base address and length of the registers block for the PWM.
 - #pwm-cells: should be 2. See pwm.txt in this directory for a description of
   the cells format.
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 265d12f..04661cf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -93,6 +93,15 @@
 };
 
 &pfc {
+	pwm1_pins: pwm1 {
+		renesas,groups = "pwm1_a", "pwm1_b";
+		renesas,function = "pwm1";
+	};
+	pwm2_pins: pwm2 {
+		renesas,groups = "pwm2_a", "pwm2_b";
+		renesas,function = "pwm2";
+	};
+
 	scif1_pins: scif1 {
 		renesas,groups = "scif1_data_a", "scif1_ctrl";
 		renesas,function = "scif1";
@@ -174,6 +183,18 @@
 	};
 };
 
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pwm2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index bb353cd..3c88b04 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -446,6 +446,54 @@
 			status = "disabled";
 		};
 
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
+			reg = <0 0xe6e35000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
+			reg = <0 0xe6e36000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a7795", "renesas,scif";
 			reg = <0 0xe6e60000 0 64>;
-- 
2.6.4
