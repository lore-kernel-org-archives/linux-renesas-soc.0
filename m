Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4F0C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A029A2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NrocfVFy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfAXPNy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 04FB325BF19;
        Fri, 25 Jan 2019 02:12:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342769; bh=FVv2yxGQcEYPDbykkdoY1N9O1as+GmnTeHaydBwLxjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NrocfVFyKs1JJhS0XAIn+qLmnaSRMagWsoP6Dz9LUf+OoBDJpcka1uUQKwrwVWM7J
         rYaMaNgQ02e/2BLDv8IkT2iG58VsdjW+6RathX8p2EiwE62ri1YW67tM2VgNvD0Tr3
         sRD0/va+OZq59PnAwudiqwEXYBaCQGwhqcYfRaxU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 229C2940DB0; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 34/44] arm64: dts: renesas: ulcb: use audio-graph-card
Date:   Thu, 24 Jan 2019 16:12:28 +0100
Message-Id: <5d3b226ace6d8d6f1a9fecbfb21e7e743a88f33c.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ULCB can use daughter board which is called as KingFisher.
It has extra sound interface, thus we want to use it.
But, basically, ALSA SoC can't use Multiple sound card with single
CPU sound interface (= SSI). Thus we need to use Single Sound Card
with multiple DAI interface.

To be easy to expand ULCB sound card on KingFisher, it is better to
use multi-dai-link style sound card on ULCB sound DT.

Now, "simple-audio-card" / "audio-graph-card" both can support
multi-dai-link style, but HDMI sound support (which is not yet supported
on ULCB) needs "audio-graph-card".
Using audio-graph-card is better selection.
This patch exchange current sound card to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 39 ++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index de694fdae067..8c6c45863ac8 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -83,20 +83,11 @@
 		regulator-always-on;
 	};
 
-	rsnd_ak4613: sound {
-		compatible = "simple-audio-card";
+	sound_card: sound {
+		compatible = "audio-graph-card";
+		label = "rcar-sound";
 
-		simple-audio-card,format = "left_j";
-		simple-audio-card,bitclock-master = <&sndcpu>;
-		simple-audio-card,frame-master = <&sndcpu>;
-
-		sndcpu: simple-audio-card,cpu {
-			sound-dai = <&rcar_sound>;
-		};
-
-		sndcodec: simple-audio-card,codec {
-			sound-dai = <&ak4613>;
-		};
+		dais = <&rsnd_port0>;
 	};
 
 	vcc_sdhi0: regulator-vcc-sdhi0 {
@@ -211,6 +202,12 @@
 		asahi-kasei,out4-single-end;
 		asahi-kasei,out5-single-end;
 		asahi-kasei,out6-single-end;
+
+		port {
+			ak4613_endpoint: endpoint {
+				remote-endpoint = <&rsnd_for_ak4613>;
+			};
+		};
 	};
 
 	cs2000: clk-multiplier@4f {
@@ -384,10 +381,18 @@
 		 <&audio_clk_c>,
 		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
 
-	rcar_sound,dai {
-		dai0 {
-			playback = <&ssi0 &src0 &dvc0>;
-			capture  = <&ssi1 &src1 &dvc1>;
+	ports {
+		rsnd_port0: port {
+			rsnd_for_ak4613: endpoint {
+				remote-endpoint = <&ak4613_endpoint>;
+
+				dai-format = "left_j";
+				bitclock-master = <&rsnd_for_ak4613>;
+				frame-master = <&rsnd_for_ak4613>;
+
+				playback = <&ssi0 &src0 &dvc0>;
+				capture  = <&ssi1 &src1 &dvc1>;
+			};
 		};
 	};
 };
-- 
2.11.0

