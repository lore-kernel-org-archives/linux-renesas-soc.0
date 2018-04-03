Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47086 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753169AbeDCV5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Apr 2018 17:57:08 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: Fix error handling when issuing CMD23
Date: Tue,  3 Apr 2018 23:57:03 +0200
Message-Id: <20180403215703.12110-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

If an error was detected when CMD23 was issued, command sequence should
be terminated with errors and CMD23 should be issued after retuning.

Fixes: 8b22c3c18be5 ("mmc: tmio: add CMD23 support")
Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Ulf: I'd think this is suitable for stable...

 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index e30df9ad8197..308029930304 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -913,7 +913,7 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 		host->check_scc_error(host);
 
 	/* If SET_BLOCK_COUNT, continue with main command */
-	if (host->mrq) {
+	if (host->mrq && !mrq->cmd->error) {
 		tmio_process_mrq(host, mrq);
 		return;
 	}
-- 
2.11.0
