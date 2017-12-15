Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:41184 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756692AbdLOPPA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:15:00 -0500
Received: by mail-wm0-f66.google.com with SMTP id g75so18223822wme.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:15:00 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 3/4] arm64: dts: r8a7796: Add GSX device node
Date: Fri, 15 Dec 2017 16:14:49 +0100
Message-Id: <1513350890-2446-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds GSX device node for R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 0b8558d..d3264e7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2241,6 +2241,14 @@
 			};
 		};
 
+		gsx: gsx@fd000000 {
+			compatible = "renesas,gsx";
+			reg = <0 0xfd000000 0 0x3ffff>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 112>;
+			power-domains = <&sysc R8A7796_PD_3DG_B>;
+		};
+
 		pciec0: pcie@fe000000 {
 			/* placeholder */
 		};
-- 
2.7.4
