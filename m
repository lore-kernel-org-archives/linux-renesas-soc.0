Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58288 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726568AbeKUJkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 04:40:18 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: [RFC PATCH 2/3] mmc: core: use mrq->sbc when sending CMD23 for RPMB
Date: Wed, 21 Nov 2018 00:08:31 +0100
Message-Id: <20181120230832.1840-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When sending out CMD23 in the blk preparation, the comment there
rightfully says:

	 * However, it is not sufficient to just send CMD23,
	 * and avoid the final CMD12, as on an error condition
	 * CMD12 (stop) needs to be sent anyway. This, coupled
	 * with Auto-CMD23 enhancements provided by some
	 * hosts, means that the complexity of dealing
	 * with this is best left to the host. If CMD23 is
	 * supported by card and host, we'll fill sbc in and let
	 * the host deal with handling it correctly.

Let's do this behaviour for RPMB as well, and not send CMD23
independently. Otherwise IP cores (like Renesas SDHI) may timeout
because of automatic CMD23/CMD12 handling.

Reported-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I also noticed that write_flag is an int, and we are playing with the sign bit
on 32-bit systems. But sadly this is exported to userspace...

 drivers/mmc/core/block.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 9e0f7e4aa8c6..66fc425615cd 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -472,7 +472,7 @@ static int ioctl_do_sanitize(struct mmc_card *card)
 static int __mmc_blk_ioctl_cmd(struct mmc_card *card, struct mmc_blk_data *md,
 			       struct mmc_blk_ioc_data *idata)
 {
-	struct mmc_command cmd = {};
+	struct mmc_command cmd = {}, sbc = {};
 	struct mmc_data data = {};
 	struct mmc_request mrq = {};
 	struct scatterlist sg;
@@ -553,10 +553,11 @@ static int __mmc_blk_ioctl_cmd(struct mmc_card *card, struct mmc_blk_data *md,
 		if (data.blocks > 65535 || !data.blocks)
 			return -EINVAL;
 
-		err = mmc_set_blockcount(card, data.blocks,
-			idata->ic.write_flag & (1 << 31));
-		if (err)
-			return err;
+		sbc.opcode = MMC_SET_BLOCK_COUNT;
+		/* copy the 'Reliable Write' bit */
+		sbc.arg = data.blocks | (idata->ic.write_flag & BIT(31));
+		sbc.flags = MMC_RSP_R1 | MMC_CMD_AC;
+		mrq.sbc = &sbc;
 	}
 
 	if ((MMC_EXTRACT_INDEX_FROM_ARG(cmd.arg) == EXT_CSD_SANITIZE_START) &&
-- 
2.11.0
