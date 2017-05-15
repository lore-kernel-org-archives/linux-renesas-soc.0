Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:36184 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753765AbdEOMoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 08:44:19 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 2/3] arm64: dts: r8a7795: salvator-x: Add support for R-Car H3 ES2.0
Date: Mon, 15 May 2017 14:44:12 +0200
Message-Id: <1494852253-8572-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1494852253-8572-1-git-send-email-geert+renesas@glider.be>
References: <1494852253-8572-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Split off support for Salvator-X boards with the ES1.x revision of the
R-Car H3 SoC into a separate file.  The main r8a7795-salvator-x.dts file
now corresponds to Salvator-X with R-Car H3 ES2.0 or later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Rebase on top of r8a7795 HDMI support,

v3:
  - Rebase on top of common Salvator-X board support extraction,

v2:
  - Use a separate file for ES1.x instead of for ES2.0, so
    r8a7795-salvator-x.dts always corresponds to the board with the
    latest SoC revision,
  - Add a dash between SoC part number and revision, for compatibility
    with the BSP,
  - Enhance the hardware description from basic support to everything
    already supported on ES1.x.
---
 arch/arm64/boot/dts/renesas/Makefile                                  | 1 +
 .../renesas/{r8a7795-salvator-x.dts => r8a7795-es1-salvator-x.dts}    | 0
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts                    | 4 ++--
 3 files changed, 3 insertions(+), 2 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a7795-salvator-x.dts => r8a7795-es1-salvator-x.dts} (100%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1618e0a3c81d48bd..b6c723d8f6875f2d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
similarity index 100%
copy from arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
copy to arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 1bb1dd61ba1ca442..8bcf4c0d6c4a65fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -11,11 +11,11 @@
 #define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
 
 /dts-v1/;
-#include "r8a7795-es1.dtsi"
+#include "r8a7795.dtsi"
 #include "salvator-x.dtsi"
 
 / {
-	model = "Renesas Salvator-X board based on r8a7795 ES1.x";
+	model = "Renesas Salvator-X board based on r8a7795 ES2.0+";
 	compatible = "renesas,salvator-x", "renesas,r8a7795";
 
 	memory@48000000 {
-- 
2.7.4
