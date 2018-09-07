Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:14148 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727629AbeIGNGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:06:02 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, geert+renesas@glider.be
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 3/4] arm64: dts: r8a77995-draak: Enable Audio
Date: Fri,  7 Sep 2018 17:25:42 +0900
Message-Id: <1536308743-29573-4-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
References: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

This patch enables Audio support for the D3 Draak board on the R8A77995

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 123 +++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index a8e8f26..0f17335 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -83,6 +83,12 @@
 		reg = <0x0 0x48000000 0x0 0x18000000>;
 	};
 
+	x19_clk: x19_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -101,6 +107,36 @@
 		regulator-always-on;
 	};
 
+	audio_clkout: audio-clkout {
+		/*
+		 * This is same as <&rcar_sound 0>
+		 * but needed to avoid cs2000/rcar_sound probe dead-lock
+		 */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <11289600>;
+	};
+
+	rsnd_ak4613: sound {
+		compatible = "simple-scu-audio-card";
+
+		simple-audio-card,name = "rsnd-ak4613";
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&sndcpu>;
+		simple-audio-card,frame-master = <&sndcpu>;
+
+		simple-audio-card,prefix = "ak4613";
+		simple-audio-card,routing = "ak4613 Playback", "DAI0 Playback",
+		"DAI0 Capture", "ak4613 Capture";
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			 sound-dai = <&ak4613>;
+		};
+	};
+
 	x12_clk: x12 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -162,6 +198,16 @@
 		power-source = <1800>;
 	};
 
+	sound_pins: sound {
+		groups = "ssi3_data", "ssi34_ctrl", "ssi4_data_a";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a", "audio_clk_b", "audio_clkout", "audio_clkout1";
+		function = "audio_clk";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -184,6 +230,33 @@
 		pagesize = <8>;
 	};
 
+	ak4613: codec@10 {
+		compatible = "asahi-kasei,ak4613";
+		#sound-dai-cells = <0>;
+		reg = <0x10>;
+		clocks = <&rcar_sound 3>;
+
+		asahi-kasei,in1-single-end;
+		asahi-kasei,in2-single-end;
+		asahi-kasei,out1-single-end;
+		asahi-kasei,out2-single-end;
+		asahi-kasei,out3-single-end;
+		asahi-kasei,out4-single-end;
+		asahi-kasei,out5-single-end;
+		asahi-kasei,out6-single-end;
+	};
+
+	cs2000: clk-multiplier@4f {
+		#clock-cells = <0>;
+		compatible = "cirrus,cs2000-cp";
+		reg = <0x4f>;
+		clocks = <&audio_clkout>, <&x19_clk>;
+		clock-names = "clk_in", "ref_clk";
+
+		assigned-clocks = <&cs2000>;
+		assigned-clock-rates = <24576000>; /* 1/1 divide */
+	};
+
 	composite-in@20 {
 		compatible = "adi,adv7180cp";
 		reg = <0x20>;
@@ -352,6 +425,56 @@
 	status = "okay";
 };
 
+&rcar_sound {
+	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <12288000 11289600>;
+	clkout-lr-synchronous;
+
+	status = "okay";
+
+	/* update <audio_clk_b> to <cs2000> */
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+		 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1017>,
+		 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+		 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&cs2000>, <&audio_clk_b>,
+		 <&cpg CPG_CORE R8A77995_CLK_ZA2>;
+
+	rcar_sound,dai {
+
+		dai0 {
+		    playback = <&ssi3 &src5 &dvc0>;
+		    capture  = <&ssi4 &src6 &dvc1>;
+		};
+	};
+
+};
+
+&ssi4 {
+	shared-pin;
+};
+
+&audio_clk_b {
+	clock-frequency = <22579200>;
+};
+
 &vin4 {
 	pinctrl-0 = <&vin4_pins_cvbs>;
 	pinctrl-names = "default";
-- 
2.7.4
