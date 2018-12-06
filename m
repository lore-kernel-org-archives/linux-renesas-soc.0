Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbeLFV7q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:46 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 9/9] soc: renesas: rcar-sysc: Fix power domain control after system resume
Date: Thu,  6 Dec 2018 13:58:57 -0800
Message-Id: <7fc4650cc2417d7a2907a000f6f88240baa42018.1544131943.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

To control power to a power domain, the System Controller (SYSC) needs
the corresponding interrupt source to be enabled, but masked, to prevent
the CPU from receiving it.

Currently this is handled in the driver's probe() routine, and set up
for every domain present, even if it will not be controlled directly by
SYSC (CPU domains are powered through the APMU on R-Car Gen2 and later).

On R-Car Gen3, PSCI powers down the SoC during system suspend, thus
losing any configured interrupt state.  Hence after system resume, power
domains not controlled through the APMU (e.g. A3IR, A3VC, A3VP) fail to
power up.

Fix this by replacing the global interrupt setup in the probe() routine
by a domain-specific interrupt setup in rcar_sysc_power(), where the
domain's power is actually controlled.  This brings the code more in
line with the flowchart in the Hardware User's Manual.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/rcar-sysc.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 123e553510e8..0c80fab4f8de 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -105,6 +105,15 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 
 	spin_lock_irqsave(&rcar_sysc_lock, flags);
 
+	/*
+	 * The interrupt source needs to be enabled, but masked, to prevent the
+	 * CPU from receiving it.
+	 */
+	iowrite32(ioread32(rcar_sysc_base + SYSCIMR) | isr_mask,
+		  rcar_sysc_base + SYSCIMR);
+	iowrite32(ioread32(rcar_sysc_base + SYSCIER) | isr_mask,
+		  rcar_sysc_base + SYSCIER);
+
 	iowrite32(isr_mask, rcar_sysc_base + SYSCISCR);
 
 	/* Submit power shutoff or resume request until it was accepted */
@@ -324,7 +333,6 @@ static int __init rcar_sysc_pd_init(void)
 	const struct of_device_id *match;
 	struct rcar_pm_domains *domains;
 	struct device_node *np;
-	u32 syscier, syscimr;
 	void __iomem *base;
 	unsigned int i;
 	int error;
@@ -363,24 +371,6 @@ static int __init rcar_sysc_pd_init(void)
 	domains->onecell_data.num_domains = ARRAY_SIZE(domains->domains);
 	rcar_sysc_onecell_data = &domains->onecell_data;
 
-	for (i = 0, syscier = 0; i < info->num_areas; i++)
-		syscier |= BIT(info->areas[i].isr_bit);
-
-	/*
-	 * Mask all interrupt sources to prevent the CPU from receiving them.
-	 * Make sure not to clear reserved bits that were set before.
-	 */
-	syscimr = ioread32(base + SYSCIMR);
-	syscimr |= syscier;
-	pr_debug("%pOF: syscimr = 0x%08x\n", np, syscimr);
-	iowrite32(syscimr, base + SYSCIMR);
-
-	/*
-	 * SYSC needs all interrupt sources enabled to control power.
-	 */
-	pr_debug("%pOF: syscier = 0x%08x\n", np, syscier);
-	iowrite32(syscier, base + SYSCIER);
-
 	for (i = 0; i < info->num_areas; i++) {
 		const struct rcar_sysc_area *area = &info->areas[i];
 		struct rcar_sysc_pd *pd;
-- 
2.11.0
