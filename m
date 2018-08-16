Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:17394 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389265AbeHPKOP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Aug 2018 06:14:15 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 6/7] mmc: renesas_sdhi: refactor CLK_CTL bit calculation
Date: Thu, 16 Aug 2018 16:16:38 +0900
Message-Id: <1534403799-10594-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

  for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
          clock <<= 1;

... is too tricky, hence I replaced with

  roundup_pow_of_two(divisor) >> 2

'(clk >> 22) & 0x1' is the bit test for the 1/1 divisor, but
it is not clear.  'divisor <= 1' is easier to understand.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mmc/host/renesas_sdhi_core.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a15fb2e..98391e9 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -158,7 +158,8 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
-	u32 clk = 0, clock;
+	unsigned int clock, divisor;
+	u32 clk = 0;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -166,14 +167,18 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	if (new_clock == 0)
 		goto out;
 
-	clock = renesas_sdhi_clk_update(host, new_clock) / 512;
+	clock = renesas_sdhi_clk_update(host, new_clock);
 
-	for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
-		clock <<= 1;
+	divisor = clock / new_clock;
 
-	/* 1/1 clock is option */
-	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1))
-		clk |= 0xff;
+	/*
+	 * bit7 set: 1/512, ... bit0 set:1/4, all bits clear: 1/2
+	 * all bits set: 1/1 (Renesas-specific extension?)
+	 */
+	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && divisor <= 1)
+		clk = 0xff;
+	else
+		clk = roundup_pow_of_two(divisor) >> 2;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
-- 
2.7.4
