Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:38400 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdAQNhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 08:37:00 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 3v2qd63fmFzMs5G9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2017 13:47:38 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] clk: renesas: cpg-mssr: Migrate to CLK_IS_CRITICAL
Date: Tue, 17 Jan 2017 13:46:29 +0100
Message-Id: <1484657190-12838-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When the Renesas CPG/MSSR driver was introduced, it was anticipated that
critical clocks would be handled through a new CLK_ENABLE_HAND_OFF flag
soon.  However, CLK_ENABLE_HAND_OFF never made it upstream.

Instead, commit 32b9b10961860860 ("clk: Allow clocks to be marked as
CRITICAL") introduced CLK_IS_CRITICAL, a flag with slightly differing
semantics.  Still, it can be used to prevent e.g. the GIC module clock
from being turned off, until the GIC-400 driver has full support for
Runtime PM.

Hence migrate the Renesas CPG/MSSR driver from CLK_ENABLE_HAND_OFF to
CLK_IS_CRITICAL.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Should this have a Fixes tag? ;-)

Fixes: 32b9b10961860860 ("clk: Allow clocks to be marked as CRITICAL")
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 8359ce75db7aa4fb..6947482d48a55094 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -346,17 +346,10 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
 	for (i = 0; i < info->num_crit_mod_clks; i++)
 		if (id == info->crit_mod_clks[i]) {
-#ifdef CLK_ENABLE_HAND_OFF
-			dev_dbg(dev, "MSTP %s setting CLK_ENABLE_HAND_OFF\n",
+			dev_dbg(dev, "MSTP %s setting CLK_IS_CRITICAL\n",
 				mod->name);
-			init.flags |= CLK_ENABLE_HAND_OFF;
+			init.flags |= CLK_IS_CRITICAL;
 			break;
-#else
-			dev_dbg(dev, "Ignoring MSTP %s to prevent disabling\n",
-				mod->name);
-			kfree(clock);
-			return;
-#endif
 		}
 
 	parent_name = __clk_get_name(parent);
-- 
1.9.1
