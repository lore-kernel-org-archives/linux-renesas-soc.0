Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:39577 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751010AbdCQJFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 05:05:35 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: always get number of taps
Date: Fri, 17 Mar 2017 10:04:50 +0100
Message-Id: <20170317090450.18593-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

Current code gets number of taps only once and keeps the value. This is
not correct, we need to obtain it every time before executing tuning,
so remove the outer if-block.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[wsa: extracted from a larger patch and reworded commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_pio.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_pio.c b/drivers/mmc/host/tmio_mmc_pio.c
index 5b01d22932cdbf..a2d92f10501bdd 100644
--- a/drivers/mmc/host/tmio_mmc_pio.c
+++ b/drivers/mmc/host/tmio_mmc_pio.c
@@ -815,16 +815,14 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 	int i, ret = 0;
 
-	if (!host->tap_num) {
-		if (!host->init_tuning || !host->select_tuning)
-			/* Tuning is not supported */
-			goto out;
+	if (!host->init_tuning || !host->select_tuning)
+		/* Tuning is not supported */
+		goto out;
 
-		host->tap_num = host->init_tuning(host);
-		if (!host->tap_num)
-			/* Tuning is not supported */
-			goto out;
-	}
+	host->tap_num = host->init_tuning(host);
+	if (!host->tap_num)
+		/* Tuning is not supported */
+		goto out;
 
 	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
 		dev_warn_once(&host->pdev->dev,
-- 
2.11.0
