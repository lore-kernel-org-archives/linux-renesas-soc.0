Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58282 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbeKUJkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 04:40:17 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/3] mmc: core: validate user input for RPMB block count
Date: Wed, 21 Nov 2018 00:08:30 +0100
Message-Id: <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For RPMB, block count is a non-zero 16 bit wide number. Reject invalid
values from userspace instead of just masking the unneeded bits. Tested
with a modified 'mmc-utils' package.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/block.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index c35b5b08bb33..9e0f7e4aa8c6 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -550,6 +550,9 @@ static int __mmc_blk_ioctl_cmd(struct mmc_card *card, struct mmc_blk_data *md,
 	}
 
 	if (idata->rpmb) {
+		if (data.blocks > 65535 || !data.blocks)
+			return -EINVAL;
+
 		err = mmc_set_blockcount(card, data.blocks,
 			idata->ic.write_flag & (1 << 31));
 		if (err)
-- 
2.11.0
