Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 11/14] ARM: dts: gose: enable sound DMA support via BUSIF in device tree
Date: Mon, 18 Jan 2016 14:28:06 +0900
Message-Id: <1453094889-25204-12-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
References: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable DMA transfer to/from SSIU in gose/r8a7791 device tree.

     DMA
[MEM] -> [SSIU] -> [SSI]

     DMA
[MEM] <- [SSIU] <- [SSI]

Based on similar work for the r8a7791/koelsch by Kuninori Morimoto.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 0ab0abb9f889..4a7048d676c8 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -321,11 +321,6 @@
 	};
 };
 
-&ssi0 {
-	no-busif;
-};
-
 &ssi1 {
-	no-busif;
 	shared-pin;
 };
-- 
2.1.4
