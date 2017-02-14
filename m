Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:62280 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754098AbdBNQIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2017 11:08:31 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3] clk: renesas: mstp: ensure register writes complete
Date: Tue, 14 Feb 2017 11:08:05 -0500
Message-Id: <20170214160805.20156-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When there is no status bit, it is possible for the clock enable/disable
operation to have not completed by the time the driver code resumes
execution. This is due to the fact that write operations are sometimes
queued and delayed internally. Doing a read ensures the write operations
has completed.

Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
* changed clk_readl to cpg_mstp_read to take into account 8-bit registers
* added Reviewed by Geert Uytterhoeven
v2:
* added Fixes because technically this is a bug fix
---
 drivers/clk/renesas/clk-mstp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 3ce819c..4067216 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -91,6 +91,12 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		value |= bitmask;
 	cpg_mstp_write(group, value, group->smstpcr);
 
+	if (!group->mstpsr) {
+		/* dummy read to ensure write has completed */
+		cpg_mstp_read(group, group->smstpcr);
+		barrier_data(group->smstpcr);
+	}
+
 	spin_unlock_irqrestore(&group->lock, flags);
 
 	if (!enable || !group->mstpsr)
-- 
2.10.1
