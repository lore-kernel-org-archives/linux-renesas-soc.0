Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:14118 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbeIGNF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:05:58 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, geert+renesas@glider.be
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 2/4] arm64: dts: r8a77995: Add Audio device nodes
Date: Fri,  7 Sep 2018 17:25:41 +0900
Message-Id: <1536308743-29573-3-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
References: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

This patch adds Audio device nodes for the R8A77995

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 183 ++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 42d8dff..b96fc30 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -50,6 +50,23 @@
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
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -487,6 +504,172 @@
 			dma-channels = <16>;
 		};
 
+		rcar_sound: sound@ec500000 {
+			/*
+			 * #sound-dai-cells is required
+			 *
+			 * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
+			 * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
+			 */
+			/*
+			 * #clock-cells is required for audio_clkout0/1/2/3
+			 *
+			 * clkout   : #clock-cells = <0>;   <&rcar_sound>;
+			 * clkout0/1/2/3: #clock-cells = <1>;   <&rcar_sound N>;
+			 */
+			compatible =  "renesas,rcar_sound-r8a77995", "renesas,rcar_sound-gen3";
+			reg =   <0 0xec500000 0 0x1000>, /* SCU */
+				<0 0xec5a0000 0 0x100>,  /* ADG */
+				<0 0xec540000 0 0x1000>, /* SSIU */
+				<0 0xec541000 0 0x280>,  /* SSI */
+				<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+
+			clocks = <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1011>,
+				 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+				 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1025>,
+				 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1017>,
+				 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+				 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+				 <&audio_clk_a>, <&audio_clk_b>,
+				 <&cpg CPG_CORE R8A77995_CLK_ZA2>;
+
+			clock-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0",
+				      "src.9", "src.8", "src.7", "src.6",
+				      "src.5", "src.4", "src.3", "src.2",
+				      "src.1", "src.0",
+				      "mix.1", "mix.0",
+				      "ctu.1", "ctu.0",
+				      "dvc.0", "dvc.1",
+				      "clk_a", "clk_b", "clk_i";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 1005>,
+				 <&cpg 1006>, <&cpg 1007>,
+				 <&cpg 1008>, <&cpg 1009>,
+				 <&cpg 1010>, <&cpg 1011>,
+				 <&cpg 1012>, <&cpg 1013>,
+				 <&cpg 1014>, <&cpg 1015>;
+			reset-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0";
+			status = "disabled";
+
+			rcar_sound,dvc {
+				dvc0: dvc-0 {
+				    dmas = <&audma0 0xbc>;
+				    dma-names = "tx";
+				};
+				dvc1: dvc-1 {
+				    dmas = <&audma0 0xbe>;
+				    dma-names = "tx";
+				};
+			};
+
+			rcar_sound,mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
+			rcar_sound,ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
+			rcar_sound,src {
+				src0: src-0 {
+					status = "disabled";
+				};
+				src1: src-1 {
+					status = "disabled";
+				};
+				src2: src-2 {
+					status = "disabled";
+				};
+				src3: src-3 {
+					status = "disabled";
+				};
+				src4: src-4 {
+					status = "disabled";
+				};
+				src5: src-5 {
+					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8f>, <&audma0 0xb2>;
+					dma-names = "rx", "tx";
+				};
+				src6: src-6 {
+					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x91>, <&audma0 0xb4>;
+					dma-names = "rx", "tx";
+				};
+				src7: src-7 {
+					status = "disabled";
+				};
+				src8: src-8 {
+					status = "disabled";
+				};
+				src9: src-9 {
+					status = "disabled";
+				};
+			};
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+					status = "disabled";
+				};
+				ssi1: ssi-1 {
+					status = "disabled";
+				};
+				ssi2: ssi-2 {
+					status = "disabled";
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x07>, <&audma0 0x08>,
+					       <&audma0 0x6f>, <&audma0 0x70>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x09>, <&audma0 0x0a>,
+					       <&audma0 0x71>, <&audma0 0x72>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi5: ssi-5 {
+					status = "disabled";
+				};
+				ssi6: ssi-6 {
+					status = "disabled";
+				};
+				ssi7: ssi-7 {
+					status = "disabled";
+				};
+				ssi8: ssi-8 {
+					status = "disabled";
+				};
+				ssi9: ssi-9 {
+					status = "disabled";
+				};
+			};
+		};
+
 		ipmmu_ds0: mmu@e6740000 {
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xe6740000 0 0x1000>;
-- 
2.7.4
