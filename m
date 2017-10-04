Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77995: add PWM device nodes
Date: Wed,  4 Oct 2017 19:27:30 +0900
Message-Id: <1507112851-10042-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1507112851-10042-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507112851-10042-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds PWM device nodes for r8a77995.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 56e4292..bcc4d13 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -310,6 +310,46 @@
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a77995", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a77995", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a77995", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a77995", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			status = "disabled";
+		};
+
 		ehci0: usb@ee080100 {
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
-- 
1.9.1

