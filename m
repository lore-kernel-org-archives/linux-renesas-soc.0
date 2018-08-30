Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53566 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbeH3QQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:16:51 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: more concise clk calculation
Date: Thu, 30 Aug 2018 14:14:38 +0200
Message-Id: <20180830121438.12588-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Concise, but still readable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
index 0ae9ba1ee01b..0ae100e62b57 100644
--- a/drivers/mmc/host/tmio_mmc.c
+++ b/drivers/mmc/host/tmio_mmc.c
@@ -56,14 +56,9 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
 
 	divisor = host->pdata->hclk / new_clock;
 
-	if (divisor <= 1) {
-		clk_sel = 1;
-		clk = 0;
-	} else {
-		clk_sel = 0;
-		/* bit7 set: 1/512, ... bit0 set:1/4, all bits clear: 1/2 */
-		clk = roundup_pow_of_two(divisor) >> 2;
-	}
+	/* bit7 set: 1/512, ... bit0 set: 1/4, all bits clear: 1/2 */
+	clk_sel = (divisor <= 1);
+	clk = clk_sel ? 0 : (roundup_pow_of_two(divisor) >> 2);
 
 	host->pdata->set_clk_div(host->pdev, clk_sel);
 
-- 
2.11.0
