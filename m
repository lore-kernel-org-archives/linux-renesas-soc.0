Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:41932 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752656AbcLLTvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 14:51:50 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 6/9] mmc: sh_mobile_sdhi: remove superfluous check in SCC error check
Date: Mon, 12 Dec 2016 20:51:25 +0100
Message-Id: <20161212195128.16633-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20161212195128.16633-1-wsa+renesas@sang-engineering.com>
References: <20161212195128.16633-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The function will only be available if SDR104 was detected in probe,
so no need to check in the function itself again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/sh_mobile_sdhi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sh_mobile_sdhi.c b/drivers/mmc/host/sh_mobile_sdhi.c
index 22bedbea8ec502..2bd17890ec4b77 100644
--- a/drivers/mmc/host/sh_mobile_sdhi.c
+++ b/drivers/mmc/host/sh_mobile_sdhi.c
@@ -433,12 +433,7 @@ static int sh_mobile_sdhi_select_tuning(struct tmio_mmc_host *host)
 
 static bool sh_mobile_sdhi_check_scc_error(struct tmio_mmc_host *host)
 {
-	struct sh_mobile_sdhi *priv;
-
-	if (!(host->mmc->caps & MMC_CAP_UHS_SDR104))
-		return 0;
-
-	priv = host_to_priv(host);
+	struct sh_mobile_sdhi *priv = host_to_priv(host);
 
 	/* Check SCC error */
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
-- 
2.10.2
