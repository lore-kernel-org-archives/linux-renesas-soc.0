Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbeLFV7d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:33 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/9] soc: renesas: r8a77965-sysc: Remove non-existent A3IR power domain
Date: Thu,  6 Dec 2018 13:58:49 -0800
Message-Id: <a93913cecb3c98c2310da42a9650cfd817fb00b8.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
removed the A3IR power domain on R-Car M3-N, as this SoC does not have
an Image Processing Unit (IMP-X5).

The definition in the DT bindings header cannot be removed yet, until
its (incorrect) user has been removed.

Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77965-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/renesas/r8a77965-sysc.c b/drivers/soc/renesas/r8a77965-sysc.c
index d7f7928e3c07..e0533beb50fd 100644
--- a/drivers/soc/renesas/r8a77965-sysc.c
+++ b/drivers/soc/renesas/r8a77965-sysc.c
@@ -28,7 +28,6 @@ static const struct rcar_sysc_area r8a77965_areas[] __initconst = {
 	{ "a2vc1",	0x3c0, 1, R8A77965_PD_A2VC1,	R8A77965_PD_A3VC },
 	{ "3dg-a",	0x100, 0, R8A77965_PD_3DG_A,	R8A77965_PD_ALWAYS_ON },
 	{ "3dg-b",	0x100, 1, R8A77965_PD_3DG_B,	R8A77965_PD_3DG_A },
-	{ "a3ir",	0x180, 0, R8A77965_PD_A3IR,	R8A77965_PD_ALWAYS_ON },
 };
 
 const struct rcar_sysc_info r8a77965_sysc_info __initconst = {
-- 
2.11.0
