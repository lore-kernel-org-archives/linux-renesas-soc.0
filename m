Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f180.google.com ([209.85.210.180]:34349 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbeJUFr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 01:47:27 -0400
Received: by mail-pf1-f180.google.com with SMTP id f78-v6so12297931pfe.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Oct 2018 14:35:37 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990: Enable I2C DMA
Date: Sun, 21 Oct 2018 06:35:26 +0900
Message-Id: <1540071326-27428-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch enables I2C DMA.

NOTE: I2C7 DMA is not supported by R-Car Gen3 Hardware User's Manual
Rev.0.80E.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index a437862..9df0751 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -213,6 +213,9 @@
 			clocks = <&cpg CPG_MOD 931>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 931>;
+			dmas = <&dmac1 0x91>, <&dmac1 0x90>,
+			       <&dmac2 0x91>, <&dmac2 0x90>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -227,6 +230,9 @@
 			clocks = <&cpg CPG_MOD 930>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 930>;
+			dmas = <&dmac1 0x93>, <&dmac1 0x92>,
+			       <&dmac2 0x93>, <&dmac2 0x92>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -241,6 +247,9 @@
 			clocks = <&cpg CPG_MOD 929>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 929>;
+			dmas = <&dmac1 0x95>, <&dmac1 0x94>,
+			       <&dmac2 0x95>, <&dmac2 0x94>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -255,6 +264,8 @@
 			clocks = <&cpg CPG_MOD 928>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 928>;
+			dmas = <&dmac0 0x97>, <&dmac0 0x96>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			status = "disabled";
 		};
@@ -269,6 +280,8 @@
 			clocks = <&cpg CPG_MOD 927>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 927>;
+			dmas = <&dmac0 0x99>, <&dmac0 0x98>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -283,6 +296,8 @@
 			clocks = <&cpg CPG_MOD 919>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 919>;
+			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
@@ -297,6 +312,8 @@
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 918>;
+			dmas = <&dmac0 0x9d>, <&dmac0 0x9c>;
+			dma-names = "tx", "rx";
 			i2c-scl-internal-delay-ns = <6>;
 			status = "disabled";
 		};
-- 
1.9.1
