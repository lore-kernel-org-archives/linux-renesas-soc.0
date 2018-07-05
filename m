Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:13867 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753581AbeGEOUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 10:20:18 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/4] mmc: tmio: Fix SCC error detection
Date: Thu,  5 Jul 2018 16:18:39 +0200
Message-Id: <20180705141841.11121-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

SDR104 and HS200 need to check for SCC error. If SCC error is detected,
retuning is necessary.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: update commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 000fa9dff784ecb0..525f16f4e33b01ae 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -919,8 +919,8 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 	if (mrq->cmd->error || (mrq->data && mrq->data->error))
 		tmio_mmc_abort_dma(host);
 
-	if (host->check_scc_error)
-		host->check_scc_error(host);
+	if (host->check_scc_error && host->check_scc_error(host))
+		mrq->cmd->error = -EILSEQ;
 
 	/* If SET_BLOCK_COUNT, continue with main command */
 	if (host->mrq && !mrq->cmd->error) {
-- 
2.17.0
