Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754831AbdLFKWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:22:01 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] soc: renesas: Identify R-Car M3-W ES1.1
Date: Wed,  6 Dec 2017 11:21:54 +0100
Message-Id: <90f0d2b344313a8a4c366ef60d0df33008d2be84.1512553442.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512553442.git.horms+renesas@verge.net.au>
References: <cover.1512553442.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The Product Register of R-Car M3-W ES1.1 incorrectly identifies the SoC
revision as ES2.0.  Add a workaround to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/renesas-soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 9f4ee2567c72..926b7fd6db2d 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -250,6 +250,9 @@ static int __init renesas_soc_init(void)
 	if (chipid) {
 		product = readl(chipid);
 		iounmap(chipid);
+		/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
+		if ((product & 0x7fff) == 0x5210)
+			product ^= 0x11;
 		if (soc->id && ((product >> 8) & 0xff) != soc->id) {
 			pr_warn("SoC mismatch (product = 0x%x)\n", product);
 			return -ENODEV;
-- 
2.11.0
