Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 047/102] arm64: dts: renesas: r8a7795-salvator-xs: enable HDMI sound
Date: Fri, 18 May 2018 13:15:09 +0200
Message-Id: <b27ebfa73de08c55414514f632758402529226b4.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 8b50ceb746e8..83676684c6b4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -56,6 +56,12 @@
 	status = "okay";
 };
 
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1	/* HDMI0  */
+		&rsnd_port2>;	/* HDMI1  */
+};
+
 &hdmi0 {
 	status = "okay";
 
@@ -66,6 +72,12 @@
 				remote-endpoint = <&hdmi0_con>;
 			};
 		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint1>;
+			};
+		};
 	};
 };
 
@@ -83,6 +95,12 @@
 				remote-endpoint = <&hdmi1_con>;
 			};
 		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi1_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint2>;
+			};
+		};
 	};
 };
 
@@ -94,6 +112,34 @@
 	status = "okay";
 };
 
+&rcar_sound {
+	ports {
+		/* rsnd_port0 is on salvator-common */
+		rsnd_port1: port@1 {
+			rsnd_endpoint1: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint1>;
+				frame-master = <&rsnd_endpoint1>;
+
+				playback = <&ssi2>;
+			};
+		};
+		rsnd_port2: port@2 {
+			rsnd_endpoint2: endpoint {
+				remote-endpoint = <&dw_hdmi1_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint2>;
+				frame-master = <&rsnd_endpoint2>;
+
+				playback = <&ssi3>;
+			};
+		};
+	};
+};
+
 &pfc {
 	usb2_pins: usb2 {
 		groups = "usb2";
-- 
2.11.0
