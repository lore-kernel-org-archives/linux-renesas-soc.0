Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58302 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbeKUJkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 04:40:18 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 3/3] mmc: core: remove obsolete mmc_set_blockcount() function
Date: Wed, 21 Nov 2018 00:08:32 +0100
Message-Id: <20181120230832.1840-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The only user was converted to fill a sbc command which is the proper
way to do it because of AutoCMD23 feature of some hosts.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/core.c | 14 --------------
 drivers/mmc/core/core.h |  2 --
 2 files changed, 16 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 50a5c340307b..d3085f70e9a4 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2413,20 +2413,6 @@ int mmc_set_blocklen(struct mmc_card *card, unsigned int blocklen)
 }
 EXPORT_SYMBOL(mmc_set_blocklen);
 
-int mmc_set_blockcount(struct mmc_card *card, unsigned int blockcount,
-			bool is_rel_write)
-{
-	struct mmc_command cmd = {};
-
-	cmd.opcode = MMC_SET_BLOCK_COUNT;
-	cmd.arg = blockcount & 0x0000FFFF;
-	if (is_rel_write)
-		cmd.arg |= 1 << 31;
-	cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
-	return mmc_wait_for_cmd(card->host, &cmd, 5);
-}
-EXPORT_SYMBOL(mmc_set_blockcount);
-
 static void mmc_hw_reset_for_init(struct mmc_host *host)
 {
 	mmc_pwrseq_reset(host);
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 087ba68b2920..8fb6bc37f808 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -118,8 +118,6 @@ int mmc_erase_group_aligned(struct mmc_card *card, unsigned int from,
 unsigned int mmc_calc_max_discard(struct mmc_card *card);
 
 int mmc_set_blocklen(struct mmc_card *card, unsigned int blocklen);
-int mmc_set_blockcount(struct mmc_card *card, unsigned int blockcount,
-			bool is_rel_write);
 
 int __mmc_claim_host(struct mmc_host *host, struct mmc_ctx *ctx,
 		     atomic_t *abort);
-- 
2.11.0
