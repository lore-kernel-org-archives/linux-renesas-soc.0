Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49252 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932665AbeFRM6E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 08:58:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v5 1/3] mmc: core: more fine-grained hooks for HS400 tuning
Date: Mon, 18 Jun 2018 14:57:49 +0200
Message-Id: <20180618125751.27615-2-horms+renesas@verge.net.au>
In-Reply-To: <20180618125751.27615-1-horms+renesas@verge.net.au>
References: <20180618125751.27615-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This adds two new HS400 tuning operations:
* hs400_downgrade
* hs400_complete

These supplement the existing HS400 operation:
* prepare_hs400_tuning

This is motivated by a requirement of Renesas SDHI for the following:
1. Disabling SCC before selecting to HS if selection of HS400 has occurred.
   This can be done in an implementation of prepare_hs400_tuning_downgrade
2. Updating registers after switching to HS400
   This can be done in an implementation of complete_hs400_tuning

If hs400_downgrade or hs400_complete are not implemented then they are not
called. Thus means there should be no affect for existing drivers as none
implemt these ops.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v5
* Reworked as per feedback from Ulf Hansson
  - Call ops from mmc_hs400_to_hs200() and mmc_select_hs400()
    rather than mmc_retune() and mmc_select_timing().
    This moves card code further away from core code and
    makes the patch somewhat tider.
  - Use shorter names for new ops.

v4
* New patch
---
 drivers/mmc/core/mmc.c   | 10 ++++++++++
 include/linux/mmc/host.h |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 4466f5de54d4..63a52379e8ab 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1169,6 +1169,10 @@ static int mmc_select_hs400(struct mmc_card *card)
 	/* Set host controller to HS timing */
 	mmc_set_timing(card->host, MMC_TIMING_MMC_HS);
 
+	/* Prepare host to downgrade to HS timing */
+	if (host->ops->hs400_downgrade)
+		host->ops->hs400_downgrade(host);
+
 	/* Reduce frequency to HS frequency */
 	max_dtr = card->ext_csd.hs_max_dtr;
 	mmc_set_clock(host, max_dtr);
@@ -1209,6 +1213,9 @@ static int mmc_select_hs400(struct mmc_card *card)
 	if (err)
 		goto out_err;
 
+	if (host->ops->hs400_complete)
+		host->ops->hs400_complete(host);
+
 	return 0;
 
 out_err:
@@ -1256,6 +1263,9 @@ int mmc_hs400_to_hs200(struct mmc_card *card)
 
 	mmc_set_timing(host, MMC_TIMING_MMC_HS);
 
+	if (host->ops->hs400_downgrade)
+		host->ops->hs400_downgrade(host);
+
 	err = mmc_switch_status(card);
 	if (err)
 		goto out_err;
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 64300a48dcce..a39e2925c84c 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -146,6 +146,13 @@ struct mmc_host_ops {
 
 	/* Prepare HS400 target operating frequency depending host driver */
 	int	(*prepare_hs400_tuning)(struct mmc_host *host, struct mmc_ios *ios);
+
+	/* Prepare for switching from HS400 to HS200 */
+	void	(*hs400_downgrade)(struct mmc_host *host);
+
+	/* Complete selection of HS400 */
+	void	(*hs400_complete)(struct mmc_host *host);
+
 	/* Prepare enhanced strobe depending host driver */
 	void	(*hs400_enhanced_strobe)(struct mmc_host *host,
 					 struct mmc_ios *ios);
-- 
2.11.0
