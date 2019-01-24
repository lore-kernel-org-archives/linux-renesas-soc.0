Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95587C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 674B32184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="c/JKp9cb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbfAXPN2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:28 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:28 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9FD6925BF01;
        Fri, 25 Jan 2019 02:12:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342764; bh=UL3/AaVgzHyo666PafMYIJplrOvJCelX3JYLzEMeb6Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c/JKp9cb+7MgZfoNXXeZdP9k0OKg/63T7xWuq6uXj2QdhujTDyS5ppPRImzHibxqy
         rUAsiL6DN7q+VwPQB3GD3LrgtrZzPLjtlIqNg0AfEeFGCq+2Lw6LujvoyGCKFFQD+9
         4bYTkKVypdjmUUcUJF6g5v0iUVvct7ClotbVD3eE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2B732940D7F; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 35/44] arm64: dts: renesas: ulcb: add HDMI sound support
Date:   Thu, 24 Jan 2019 16:12:29 +0100
Message-Id: <c693b2101c9f84af65b128e6f834ef1ccf99ca23.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing ULCB HDMI sound support.
To use sound card, HDMI video is mandatory.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 8c6c45863ac8..a3878fb3c3f1 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -6,6 +6,14 @@
  * Copyright (C) 2016 Cogent Embedded, Inc.
  */
 
+/*
+ * SSI-AK4613
+ *	aplay   -D plughw:0,0 xxx.wav
+ *	arecord -D plughw:0,0 xxx.wav
+ * SSI-HDMI
+ *	aplay   -D plughw:0,1 xxx.wav
+ */
+
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
@@ -87,7 +95,9 @@
 		compatible = "audio-graph-card";
 		label = "rcar-sound";
 
-		dais = <&rsnd_port0>;
+		dais = <&rsnd_port0	/* ak4613 */
+			&rsnd_port1	/* HDMI0  */
+			>;
 	};
 
 	vcc_sdhi0: regulator-vcc-sdhi0 {
@@ -173,6 +183,12 @@
 				remote-endpoint = <&hdmi0_con>;
 			};
 		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint = <&rsnd_for_hdmi>;
+			};
+		};
 	};
 };
 
@@ -382,7 +398,10 @@
 		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
 
 	ports {
-		rsnd_port0: port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		rsnd_port0: port@0 {
+			reg = <0>;
 			rsnd_for_ak4613: endpoint {
 				remote-endpoint = <&ak4613_endpoint>;
 
@@ -394,6 +413,18 @@
 				capture  = <&ssi1 &src1 &dvc1>;
 			};
 		};
+		rsnd_port1: port@1 {
+			reg = <1>;
+			rsnd_for_hdmi: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_for_hdmi>;
+				frame-master = <&rsnd_for_hdmi>;
+
+				playback = <&ssi2>;
+			};
+		};
 	};
 };
 
-- 
2.11.0

