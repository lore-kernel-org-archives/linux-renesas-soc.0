Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35235 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934392AbcKKRIN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:13 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so10775512wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:12 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 07/10] arm64: dts: r8a7795: Add HDMI encoder support
Date: Fri, 11 Nov 2016 18:07:43 +0100
Message-Id: <1478884066-1090-8-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Based on work by  Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index af1d175..811c32e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1546,5 +1546,27 @@
 				};
 			};
 		};
+
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,rcar-dw-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>;
+			clock-names = "isfr";
+			interlaced = <1>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		hdmi1: hdmi1@feae0000 {
+			compatible = "renesas,rcar-dw-hdmi";
+			reg = <0 0xfeae0000 0 0x10000>;
+			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 728>;
+			clock-names = "isfr";
+			interlaced = <1>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.4
