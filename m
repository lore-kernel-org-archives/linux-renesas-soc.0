Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48101 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1035588AbdEAJD5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 May 2017 05:03:57 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/6] mmc: tmio: make tmio_mmc_request function more readable
Date: Mon,  1 May 2017 11:03:41 +0200
Message-Id: <20170501090346.10801-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170501090346.10801-1-wsa+renesas@sang-engineering.com>
References: <20170501090346.10801-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This part confused me and I had to read it twice until I got it. Let's
follow the standard pattern to bail out if something is wrong and keep
in the body of the function when everything is as expected.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_pio.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_pio.c b/drivers/mmc/host/tmio_mmc_pio.c
index a2d92f10501bdd..ba1a233f97f03c 100644
--- a/drivers/mmc/host/tmio_mmc_pio.c
+++ b/drivers/mmc/host/tmio_mmc_pio.c
@@ -889,11 +889,12 @@ static void tmio_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
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
