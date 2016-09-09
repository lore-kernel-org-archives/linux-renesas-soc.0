Return-Path: <devicetree-owner@vger.kernel.org>
From: bd-phuc@jinso.co.jp
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        horms@verge.net.au, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com,
        h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
Subject: [PATCH 3/8] ARM64: dts: r8a7796: Add CMT device to DT
Date: Fri,  9 Sep 2016 20:43:09 +0900
Message-Id: <1473421394-9745-4-git-send-email-bd-phuc@jinso.co.jp>
In-Reply-To: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Bui Duc Phuc <bd-phuc@jinso.co.jp>

Add the CMT0 and CMT1 counters to the r8a7796 device tree

Signed-off-by: Bui Duc Phuc <bd-phuc@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1edf824..6f5ce3f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -98,6 +98,36 @@
 					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "renesas,cmt-48-gen3";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 303>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+
+			renesas,channels-mask = <0x60>;
+	         };
+
+		cmt1: timer@e6130000 {
+			compatible = "renesas,cmt-48-gen3";
+			reg = <0 0xe6130000 0 0x1004>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 302>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+
+			renesas,channels-mask = <0xff>;
+	         };
+
 		wdt0: watchdog@e6020000 {
 			compatible = "renesas,r8a7796-wdt",
 				     "renesas,rcar-gen3-wdt";
-- 
2.7.4

