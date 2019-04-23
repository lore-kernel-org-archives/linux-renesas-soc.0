Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A95BC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 13:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0180320675
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 13:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfDWNRC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:17:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:45839 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726421AbfDWNRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 09:17:02 -0400
X-IronPort-AV: E=Sophos;i="5.60,385,1549897200"; 
   d="scan'208";a="14095146"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Apr 2019 22:16:59 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3DC5241E26E7;
        Tue, 23 Apr 2019 22:16:57 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add HDMI audio
Date:   Tue, 23 Apr 2019 14:16:48 +0100
Message-Id: <1556025408-16366-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The CAT874 board pushes sound via I2S over SSI0 into the
TDA19988BET chip.
This commit wires things up so that we can get sound out of
the HDMI interface.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch depends on patch:
https://patchwork.kernel.org/patch/10902203/

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 0623950..b7183f1 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a774c0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/display/tda998x.h>
 
 / {
 	model = "Silicon Linux RZ/G2E 96board platform (CAT874)";
@@ -63,6 +64,23 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	sound: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "CAT874 HDMI sound";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sndcpu>;
+		simple-audio-card,frame-master = <&sndcpu>;
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&tda19988>;
+		};
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -93,6 +111,10 @@
 	};
 };
 
+&audio_clk_a {
+	clock-frequency = <22579200>;
+};
+
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
@@ -133,6 +155,10 @@
 
 		video-ports = <0x234501>;
 
+		#sound-dai-cells = <0>;
+		audio-ports = <TDA998x_I2S 0x03>;
+		clocks = <&rcar_sound 1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -216,6 +242,36 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clkout1_a";
+		function = "audio_clk";
+	};
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <11289600>;
+
+	status = "okay";
+
+	rcar_sound,dai {
+		dai0 {
+			playback = <&ssi0 &src0 &dvc0>;
+		};
+	};
 };
 
 &rwdt {
-- 
2.7.4

