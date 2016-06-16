Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:34199 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752097AbcFPK1t (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 06:27:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 05/13] soc: renesas: rcar-sysc: Improve SYSC interrupt config in legacy wrapper
Date: Thu, 16 Jun 2016 12:27:34 +0200
Message-Id: <1466072862-28030-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Align SYSC interrupt configuration in the legacy wrapper with the DT
version:
  - Mask SYSC interrupt sources before enabling them (doesn't matter
    much as they're disabled at the GIC level anyway),
  - Make sure not to clear reserved SYSCIMR bits that were set before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 drivers/soc/renesas/rcar-sysc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 22f0d646225c444e..65c8e1eb90c09bb3 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -402,12 +402,25 @@ early_initcall(rcar_sysc_pd_init);
 
 void __init rcar_sysc_init(phys_addr_t base, u32 syscier)
 {
+	u32 syscimr;
+
 	if (!rcar_sysc_pd_init())
 		return;
 
 	rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
 
-	/* enable all interrupt sources, but do not use interrupt handler */
+	/*
+	 * Mask all interrupt sources to prevent the CPU from receiving them.
+	 * Make sure not to clear reserved bits that were set before.
+	 */
+	syscimr = ioread32(rcar_sysc_base + SYSCIMR);
+	syscimr |= syscier;
+	pr_debug("%s: syscimr = 0x%08x\n", __func__, syscimr);
+	iowrite32(syscimr, rcar_sysc_base + SYSCIMR);
+
+	/*
+	 * SYSC needs all interrupt sources enabled to control power.
+	 */
+	pr_debug("%s: syscier = 0x%08x\n", __func__, syscier);
 	iowrite32(syscier, rcar_sysc_base + SYSCIER);
-	iowrite32(0, rcar_sysc_base + SYSCIMR);
 }
-- 
1.9.1
