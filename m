Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EB8C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 431352184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="VRB9wWzP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbfAXPNa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:30 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:29 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A136325BF02;
        Fri, 25 Jan 2019 02:12:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342764; bh=v5DClrC0r0sEC0vy6ItBpfidme0s3L8AUKHh3miDLBE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VRB9wWzPT/SuvgnPxqMuwlbOM57MCQF/mZoH/O4fKP5QadluK11Fugq+RhozVinTZ
         GivkTs7embJc+3CLYsbuH6yFlEylPaReELkRvMpj7BBGkd5OX9J0X7TcjucLEFPsdI
         MVO0MCw408J5ZaVbHP65Vr4LwfqMA+67qjWyIQmQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3558B940DF1; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 36/44] arm64: dts: renesas: ulcb-kf: add pcm3168 sound codec
Date:   Thu, 24 Jan 2019 16:12:30 +0100
Message-Id: <80c07701d5918928cb27370e4602e57f2a613515.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

KingFisher has pcm3168 sound codec. This patch enables it.
Because pcm3168 can't handle symmetric channel on playback/
capture, we need to handle it as different DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 138 +++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 1b316d79df88..7a09576b3112 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -6,11 +6,38 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
 
+/*
+ * SSI-PCM3168A
+ *	aplay   -D plughw:0,2 xxx.wav
+ *	arecord -D plughw:0,3 xxx.wav
+ */
+
 / {
 	aliases {
 		serial1 = &hscif0;
 		serial2 = &scif1;
 	};
+
+	clksndsel: clksndsel {
+		#clock-cells = <0>;
+		compatible = "gpio-mux-clock";
+		clocks = <&cs2000>, <&audio_clk_a>; /* clk8snd, clksnd */
+		select-gpios = <&gpio_exp_75 13 GPIO_ACTIVE_HIGH>;
+	};
+
+	snd_3p3v: regulator-snd_3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "snd-3.3v";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	snd_vcc5v: regulator-snd_vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "snd-vcc5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 };
 
 &can0 {
@@ -44,6 +71,7 @@
 };
 
 &i2c2 {
+	/* U11 */
 	gpio_exp_74: gpio@74 {
 		compatible = "ti,tca9539";
 		reg = <0x74>;
@@ -53,6 +81,13 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 
+		audio_out_off {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>; /* P00 */
+			output-high;
+			line-name = "Audio_Out_OFF";
+		};
+
 		hub_pwen {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
@@ -80,8 +115,16 @@
 			output-high;
 			line-name = "OTG EXTLPn";
 		};
+
+		snd_rst {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>; /* P17 */
+			output-high;
+			line-name = "SND_RST";
+		};
 	};
 
+	/* U5 */
 	gpio_exp_75: gpio@75 {
 		compatible = "ti,tca9539";
 		reg = <0x75>;
@@ -98,6 +141,48 @@
 		#size-cells = <0>;
 		reg = <0x71>;
 		reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
+
+		/* Audio_SDA, Audio_SCL */
+		i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			pcm3168a: audio-codec@44 {
+				#sound-dai-cells = <0>;
+				compatible = "ti,pcm3168a";
+				reg = <0x44>;
+				clocks = <&clksndsel>;
+				clock-names = "scki";
+
+				VDD1-supply	= <&snd_3p3v>;
+				VDD2-supply	= <&snd_3p3v>;
+				VCCAD1-supply	= <&snd_vcc5v>;
+				VCCAD2-supply	= <&snd_vcc5v>;
+				VCCDA1-supply	= <&snd_vcc5v>;
+				VCCDA2-supply	= <&snd_vcc5v>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					mclk-fs = <512>;
+					port@0 {
+						reg = <0>;
+						pcm3168a_endpoint_p: endpoint {
+							remote-endpoint = <&rsnd_for_pcm3168a_play>;
+							clocks = <&clksndsel>;
+						};
+					};
+					port@1 {
+						reg = <1>;
+						pcm3168a_endpoint_c: endpoint {
+							remote-endpoint = <&rsnd_for_pcm3168a_capture>;
+							clocks = <&clksndsel>;
+						};
+					};
+				};
+			};
+		};
 	};
 };
 
@@ -173,6 +258,11 @@
 		groups = "usb0";
 		function = "usb0";
 	};
+
+	sound_pcm_pins: sound-pcm {
+		groups = "ssi349_ctrl", "ssi3_data", "ssi4_data";
+		function = "ssi";
+	};
 };
 
 &scif1 {
@@ -193,3 +283,51 @@
 &xhci0 {
 	status = "okay";
 };
+
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1	/* HDMI0  */
+		&rsnd_port2	/* pcm3168a playback */
+		&rsnd_port3	/* pcm3168a capture  */
+		>;
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins
+		     &sound_clk_pins
+		     &sound_pcm_pins>;
+
+	ports {
+		/* rsnd_port0/1 are on salvator-common */
+		rsnd_port2: port@2 {
+			reg = <2>;
+			rsnd_for_pcm3168a_play: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_p>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_for_pcm3168a_play>;
+				frame-master = <&rsnd_for_pcm3168a_play>;
+				dai-tdm-slot-num = <8>;
+
+				playback = <&ssi3>;
+			};
+		};
+		rsnd_port3: port@3 {
+			reg = <3>;
+			rsnd_for_pcm3168a_capture: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_c>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_for_pcm3168a_capture>;
+				frame-master = <&rsnd_for_pcm3168a_capture>;
+				dai-tdm-slot-num = <6>;
+
+				capture  = <&ssi4>;
+			};
+		};
+	};
+};
+
+&ssi4 {
+	shared-pin;
+};
-- 
2.11.0

