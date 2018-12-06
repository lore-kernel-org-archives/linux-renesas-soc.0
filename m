Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbeLFV7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:42 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/9] soc: renesas: r8a77990-sysc: Fix initialization order of 3DG-{A,B}
Date: Thu,  6 Dec 2018 13:58:54 -0800
Message-Id: <b0d7fbf8b174168c580bb310964c3c809e5569a9.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The workaround for the wrong hierarchy of the 3DG-{A,B} power
domains on R-Car E3 ES1.0 corrected the parent domains.
However, the 3DG-{A,B} power domains were still initialized and powered
in the wrong order, causing 3DG operation to fail.

Fix this by changing the order in the table at runtime, when running on
an affected SoC.

Fixes: 086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77990-sysc.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/r8a77990-sysc.c b/drivers/soc/renesas/r8a77990-sysc.c
index 15579ebc5ed2..664b244eb1dd 100644
--- a/drivers/soc/renesas/r8a77990-sysc.c
+++ b/drivers/soc/renesas/r8a77990-sysc.c
@@ -28,19 +28,6 @@ static struct rcar_sysc_area r8a77990_areas[] __initdata = {
 	{ "3dg-b",	0x100, 1, R8A77990_PD_3DG_B,	R8A77990_PD_3DG_A },
 };
 
-static void __init rcar_sysc_fix_parent(struct rcar_sysc_area *areas,
-					unsigned int num_areas, u8 id,
-					int new_parent)
-{
-	unsigned int i;
-
-	for (i = 0; i < num_areas; i++)
-		if (areas[i].isr_bit == id) {
-			areas[i].parent = new_parent;
-			return;
-		}
-}
-
 /* Fixups for R-Car E3 ES1.0 revision */
 static const struct soc_device_attribute r8a77990[] __initconst = {
 	{ .soc_id = "r8a77990", .revision = "ES1.0" },
@@ -50,12 +37,10 @@ static const struct soc_device_attribute r8a77990[] __initconst = {
 static int __init r8a77990_sysc_init(void)
 {
 	if (soc_device_match(r8a77990)) {
-		rcar_sysc_fix_parent(r8a77990_areas,
-				     ARRAY_SIZE(r8a77990_areas),
-				     R8A77990_PD_3DG_A, R8A77990_PD_3DG_B);
-		rcar_sysc_fix_parent(r8a77990_areas,
-				     ARRAY_SIZE(r8a77990_areas),
-				     R8A77990_PD_3DG_B, R8A77990_PD_ALWAYS_ON);
+		/* Fix incorrect 3DG hierarchy */
+		swap(r8a77990_areas[7], r8a77990_areas[8]);
+		r8a77990_areas[7].parent = R8A77990_PD_ALWAYS_ON;
+		r8a77990_areas[8].parent = R8A77990_PD_3DG_B;
 	}
 
 	return 0;
-- 
2.11.0
