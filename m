Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/22] ARM: dts: kzm9g: Configure NMI key as wake-up source
Date: Mon, 25 Apr 2016 14:27:37 +1000
Message-Id: <7e2a1bcd2185c9d7d4c9b2910249a1a8fa841341.1461558315.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461558315.git.horms+renesas@verge.net.au>
References: <cover.1461558315.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add a GPIO key with wake-up capability for the NMI button.
This allows to wake up the system from s2ram without relying on the
buttons on the optional switch board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/sh73a0-kzm9g.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index e40a2f23b6cd..c2d8a080e392 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -149,6 +149,13 @@
 			label = "SW1";
 			wakeup-source;
 		};
+
+		wakeup-key {
+			gpios = <&pfc 159 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			label = "NMI";
+			wakeup-source;
+		};
 	};
 
 	sound {
-- 
2.7.0.rc3.207.g0ac5344
