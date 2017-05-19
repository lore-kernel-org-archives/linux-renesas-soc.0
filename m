Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46667 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752301AbdESNcN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 09:32:13 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/6] mmc: tmio: make tmio_mmc_request function more readable
Date: Fri, 19 May 2017 15:31:50 +0200
Message-Id: <20170519133155.22945-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170519133155.22945-1-wsa+renesas@sang-engineering.com>
References: <20170519133155.22945-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This part confused me and I had to read it twice until I got it. Let's
follow the standard pattern to bail out if something is wrong and keep
in the body of the function when everything is as expected.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index a649a5ff995740..5f5a4a2d81be7c 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -926,11 +926,12 @@ static void tmio_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	ret = tmio_mmc_start_command(host, mrq->cmd);
-	if (!ret) {
-		schedule_delayed_work(&host->delayed_reset_work,
-				      msecs_to_jiffies(CMDREQ_TIMEOUT));
-		return;
-	}
+	if (ret)
+		goto fail;
+
+	schedule_delayed_work(&host->delayed_reset_work,
+			      msecs_to_jiffies(CMDREQ_TIMEOUT));
+	return;
 
 fail:
 	host->force_pio = false;
-- 
2.11.0
