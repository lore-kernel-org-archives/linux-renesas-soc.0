Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:39852 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752257AbeFFXY3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 19:24:29 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] mmc: tmio: Fix reset operation
Date: Thu,  7 Jun 2018 01:22:52 +0200
Message-Id: <20180606232252.31583-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

SD / MMC did not operate properly when suspend transition failed.
Because the SCC was not reset at resume, issue of the command failed.
Changed tmio_mmc_reset() to tmio_mmc_hw_reset() in order to add reset
of SCC to tmio_mmc_host_runtime_resume().

On runtime power management resume, the host clock needs to be
enabled before calling tmio_mmc_reset. If the mmc device has a power
domain entry, the host clock is enabled via genpd_runtime_resume,
running before tmio_mmc_host_runtime_resume. If the mmc device has
no power domain entry, however, genpd_runtime_resume is not called.
This patch changes tmio_mmc_host_runtime_resume to enable the host
clock before calling tmio_mmc_reset.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: small fixes when rebase to mmc/next]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 9f5793407552a23a..da10b26d8f2d80e7 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -247,6 +247,10 @@ static void tmio_mmc_hw_reset(struct mmc_host *mmc)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 
+	tmio_mmc_reset(host);
+
+	tmio_mmc_abort_dma(host);
+
 	if (host->hw_reset)
 		host->hw_reset(host);
 }
@@ -289,7 +293,7 @@ static void tmio_mmc_reset_work(struct work_struct *work)
 
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	tmio_mmc_reset(host);
+	tmio_mmc_hw_reset(host->mmc);
 
 	/* Ready for new calls */
 	host->mrq = NULL;
@@ -1271,7 +1275,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
 
 	tmio_mmc_clk_stop(_host);
-	tmio_mmc_reset(_host);
+	tmio_mmc_hw_reset(mmc);
 
 	sd_ctrl_write32_as_16_and_16(_host, CTL_IRQ_MASK, TMIO_MASK_INIT);
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
@@ -1372,8 +1376,8 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
-	tmio_mmc_reset(host);
 	tmio_mmc_clk_enable(host);
+	tmio_mmc_hw_reset(host->mmc);
 
 	if (host->clk_cache)
 		tmio_mmc_set_clock(host, host->clk_cache);
-- 
2.17.0
