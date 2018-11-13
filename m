Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731494AbeKMPrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 10:47:04 -0500
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 34/44] clk: renesas: r9a06g032: Fix UART34567 clock rate
Date: Tue, 13 Nov 2018 00:49:40 -0500
Message-Id: <20181113054950.77898-34-sashal@kernel.org>
In-Reply-To: <20181113054950.77898-1-sashal@kernel.org>
References: <20181113054950.77898-1-sashal@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Phil Edworthy <phil.edworthy@renesas.com>

[ Upstream commit ee02950d53eee0d4c7f1c08a35272b77d24b9459 ]

The clock for UARTs 0 through 2 is UART012, the clock for UARTs 3 through
7 is UART34567.
For UART012, we stop the clock driver from changing the clock rate. This
is because the Synopsys UART driver simply sets the reference clock to 16x
the baud rate, but doesn't check if the actual rate is within the required
tolerance. The RZ/N1 clock divider can't provide this (we have to rely on
the UART's internal divider to set the correct clock rate), so you end up
with a clock rate that is way off what you wanted.

In addition, since the clock is shared between multiple UARTs, you don't
want the driver trying to change the clock rate as it may affect the other
UARTs (which may not have been configured yet, so you don't know what baud
rate they will use). Normally, the clock rate is set early on before Linux
to some very high rate that supports all of the clock rates you want.

This change stops the UART34567 clock rate from changing for the same
reasons.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index a0b6ecdc63dd..6d2b56891559 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -539,7 +539,8 @@ r9a06g032_div_round_rate(struct clk_hw *hw,
 	 * several uarts attached to this divider, and changing this impacts
 	 * everyone.
 	 */
-	if (clk->index == R9A06G032_DIV_UART) {
+	if (clk->index == R9A06G032_DIV_UART ||
+	    clk->index == R9A06G032_DIV_P2_PG) {
 		pr_devel("%s div uart hack!\n", __func__);
 		return clk_get_rate(hw->clk);
 	}
-- 
2.17.1
