Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36041 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QBL (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:11 -0400
Received: by mail-lf0-f66.google.com with SMTP id h68so7204339lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:10 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 17/21] arm64: dts: r8a7795: Add HDMI encoder support
Date: Mon, 30 May 2016 18:00:16 +0200
Message-Id: <1464624020-27709-18-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Based on work by  Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c9919d2..fcad91a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1587,5 +1587,21 @@
 				};
 			};
 		};
+
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		};
+
+		hdmi1: hdmi1@feae0000 {
+			compatible = "renesas,hdmi";
+			reg = <0 0xfeae0000 0 0x10000>;
+			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 728>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		};
 	};
 };
-- 
2.7.4
