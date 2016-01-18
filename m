Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 10/14] ARM: dts: gose: enable sound DMA support in device tree
Date: Mon, 18 Jan 2016 14:28:05 +0900
Message-Id: <1453094889-25204-11-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
References: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable DMA transfer to/from SSI in r8a7793/gose device tree.

     DMA
[MEM] -> [SSI]

     DMA
[MEM] <- [SSI]

Based on similar work for the r8a7791/koelsch by Kuninori Morimoto.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index a90af303e21a..0ab0abb9f889 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -322,10 +322,10 @@
 };
 
 &ssi0 {
-	pio-transfer;
+	no-busif;
 };
 
 &ssi1 {
-	pio-transfer;
+	no-busif;
 	shared-pin;
 };
-- 
2.1.4
