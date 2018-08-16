Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:17415 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389276AbeHPKOQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Aug 2018 06:14:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 5/7] mmc: renesas_sdhi: merge clk_{start,stop} functions to set_clock
Date: Thu, 16 Aug 2018 16:16:37 +0900
Message-Id: <1534403799-10594-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

renesas_sdhi_clk_start() and renesas_sdhi_clk_stop() are now only
called from renesas_sdhi_set_clock().  Merge them.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mmc/host/renesas_sdhi_core.c | 39 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 1f4c82e..a15fb2e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -155,35 +155,16 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	return ret == 0 ? best_freq : clk_get_rate(priv->clk);
 }
 
-static void renesas_sdhi_clk_start(struct tmio_mmc_host *host)
-{
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
-		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
-	/* HW engineers overrode docs: no sleep needed on R-Car2+ */
-	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
-		usleep_range(10000, 11000);
-}
-
-static void renesas_sdhi_clk_stop(struct tmio_mmc_host *host)
-{
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
-		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
-	/* HW engineers overrode docs: no sleep needed on R-Car2+ */
-	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
-		usleep_range(10000, 11000);
-}
-
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
 	u32 clk = 0, clock;
 
-	if (new_clock == 0) {
-		renesas_sdhi_clk_stop(host);
-		return;
-	}
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
+		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	if (new_clock == 0)
+		goto out;
 
 	clock = renesas_sdhi_clk_update(host, new_clock) / 512;
 
@@ -194,13 +175,17 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1))
 		clk |= 0xff;
 
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
-			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
 		usleep_range(10000, 11000);
 
-	renesas_sdhi_clk_start(host);
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+out:
+	/* HW engineers overrode docs: no sleep needed on R-Car2+ */
+	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
+		usleep_range(10000, 11000);
 }
 
 static void renesas_sdhi_clk_disable(struct tmio_mmc_host *host)
-- 
2.7.4
