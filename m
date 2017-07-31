Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbdGaPDd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:03:33 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/31] arm64: dts: renesas: Move CPG_AUDIO_CLK_I from board to soc files
Date: Mon, 31 Jul 2017 17:02:55 +0200
Message-Id: <6fad293ddbee3d0ada49449a395698303d84ea26.1501509525.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501509525.git.horms+renesas@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The definition of CPG_AUDIO_CLK_I is SoC-specific, not board-specific.
Hence move it from the board-specific .dts files to the SoC-specific
.dtsi files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts     | 2 --
 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 2 --
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts         | 2 --
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 2 --
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts    | 2 --
 arch/arm64/boot/dts/renesas/r8a7795.dtsi               | 2 ++
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts         | 2 --
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts     | 2 --
 arch/arm64/boot/dts/renesas/r8a7796.dtsi               | 2 ++
 9 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
index 95fe207cb6a3..dd4f9b6a4254 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
@@ -9,8 +9,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7795-es1.dtsi"
 #include "ulcb.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index b84c156ed696..3f7d5f51e428 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -8,8 +8,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7795-es1.dtsi"
 #include "salvator-x.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 0426f41765f0..27d4b1a4c475 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -9,8 +9,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7795.dtsi"
 #include "ulcb.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 684fb3b9d154..17953070f38d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -8,8 +8,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7795.dtsi"
 #include "salvator-x.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index de354957144b..6a7d1b22d0fe 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -8,8 +8,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7795.dtsi"
 #include "salvator-xs.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 31d1ba586ec2..0310a6f70356 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -12,6 +12,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a7795-sysc.h>
 
+#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
+
 / {
 	compatible = "renesas,r8a7795";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 38b58b7fca4b..1ff9dffae461 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -9,8 +9,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7796_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7796.dtsi"
 #include "ulcb.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index db4f162d6bdd..b35b15914771 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -8,8 +8,6 @@
  * kind, whether express or implied.
  */
 
-#define CPG_AUDIO_CLK_I		R8A7796_CLK_S0D4
-
 /dts-v1/;
 #include "r8a7796.dtsi"
 #include "salvator-x.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 8dad4b9ad46a..bae1ad97263f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -12,6 +12,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a7796-sysc.h>
 
+#define CPG_AUDIO_CLK_I		R8A7796_CLK_S0D4
+
 / {
 	compatible = "renesas,r8a7796";
 	#address-cells = <2>;
-- 
2.1.4
