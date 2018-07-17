Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44467 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbeGQUWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 16:22:37 -0400
Received: by mail-pl0-f66.google.com with SMTP id m16-v6so905411pls.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 12:48:29 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT 7/7] arm64: dts: renesas: r8a77965: Add Sound MIX support
Date: Wed, 18 Jul 2018 04:48:03 +0900
Message-Id: <1531856883-19645-8-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Based on a similar patch of the R8A7796 device tree
by Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 2188ad2..56303ac 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1356,6 +1356,7 @@
 				 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
 				 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
 				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
@@ -1367,6 +1368,7 @@
 				      "src.9", "src.8", "src.7", "src.6",
 				      "src.5", "src.4", "src.3", "src.2",
 				      "src.1", "src.0",
+				      "mix.1", "mix.0",
 				      "ctu.1", "ctu.0",
 				      "dvc.0", "dvc.1",
 				      "clk_a", "clk_b", "clk_c", "clk_i";
@@ -1394,6 +1396,11 @@
 				};
 			};
 
+			rcar_sound,mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
 			rcar_sound,ctu {
 				ctu00: ctu-0 { };
 				ctu01: ctu-1 { };
-- 
1.9.1
