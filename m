Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36191 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbeDRJ5K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 05:57:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 1/4] mmc: core: select HS400 from HS200 tuning function
Date: Wed, 18 Apr 2018 11:56:57 +0200
Message-Id: <20180418095700.29948-2-horms+renesas@verge.net.au>
In-Reply-To: <20180418095700.29948-1-horms+renesas@verge.net.au>
References: <20180418095700.29948-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Call mmc_select_hs400() from mmc_hs200_tuning().

This should have no run-time effect as the existing call to
mmc_select_hs400() is right after a call to mmc_hs200_tuning() in
mmc_init_card() and that is the only caller of mmc_hs200_tuning().

This is in preparation for adding a new mmc_host_opp to be called
after tuning and selecting HS400 - or in other words,
after mmc_execute_tuning() and mmc_select_hs400().

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4
- New patch
---
 drivers/mmc/core/mmc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 6f8ebd6caa4c..099b327e10ca 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1508,6 +1508,7 @@ static int mmc_select_timing(struct mmc_card *card)
 static int mmc_hs200_tuning(struct mmc_card *card)
 {
 	struct mmc_host *host = card->host;
+	int err;
 
 	/*
 	 * Timing should be adjusted to the HS400 target
@@ -1518,7 +1519,11 @@ static int mmc_hs200_tuning(struct mmc_card *card)
 		if (host->ops->prepare_hs400_tuning)
 			host->ops->prepare_hs400_tuning(host, &host->ios);
 
-	return mmc_execute_tuning(card);
+	err = mmc_execute_tuning(card);
+	if (err)
+		return err;
+
+	return mmc_select_hs400(card);
 }
 
 /*
@@ -1733,10 +1738,6 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 		err = mmc_hs200_tuning(card);
 		if (err)
 			goto free_card;
-
-		err = mmc_select_hs400(card);
-		if (err)
-			goto free_card;
 	} else if (!mmc_card_hs400es(card)) {
 		/* Select the desired bus width optionally */
 		err = mmc_select_bus_width(card);
-- 
2.11.0
