Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:65500 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726300AbeK0D6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 22:58:48 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 2/3] mmc: tmio: fix reset operation
Date: Mon, 26 Nov 2018 18:02:46 +0100
Message-Id: <20181126170247.4076-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
References: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SD / MMC did not operate properly when suspend transition failed.
Because the SCC was not reset at resume, issue of the command failed.
Call the host specific reset function and reset the hardware in order to
add reset of SCC. This change also fixes tuning on some stubborn cards
on Gen2.

Based on work from Masaharu Hayakawa.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
* Changes sine v1
- Merge tmio_mmc_reset() into tmio_mmc_hw_reset() as it's now the only
  caller.

* Changes since v2
- Rebased on mmc/next caused small refactoring of the code.

* Changes since v3
- Remove call to tmio_mmc_abort_dma() in tmio_mmc_reset_work() as it
  already calls tmio_mmc_hw_reset() which with this change already
  aborts the DMA. Thanks Yamada-san for pointing this out.
---
 drivers/mmc/host/tmio_mmc_core.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 35acfa4f40b2ef57..d396c5156053e410 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -171,6 +171,18 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	}
 }
 
+static void tmio_mmc_hw_reset(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	host->reset(host);
+
+	tmio_mmc_abort_dma(host);
+
+	if (host->hw_reset)
+		host->hw_reset(host);
+}
+
 static void tmio_mmc_reset_work(struct work_struct *work)
 {
 	struct tmio_mmc_host *host = container_of(work, struct tmio_mmc_host,
@@ -209,12 +221,11 @@ static void tmio_mmc_reset_work(struct work_struct *work)
 
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	host->reset(host);
+	tmio_mmc_hw_reset(host->mmc);
 
 	/* Ready for new calls */
 	host->mrq = NULL;
 
-	tmio_mmc_abort_dma(host);
 	mmc_request_done(host->mmc, mrq);
 }
 
@@ -696,14 +707,6 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
 	return 0;
 }
 
-static void tmio_mmc_hw_reset(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-
-	if (host->hw_reset)
-		host->hw_reset(host);
-}
-
 static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
@@ -1226,7 +1229,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
 
 	_host->set_clock(_host, 0);
-	_host->reset(_host);
+	tmio_mmc_hw_reset(mmc);
 
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
@@ -1327,7 +1330,7 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
 	tmio_mmc_clk_enable(host);
-	host->reset(host);
+	tmio_mmc_hw_reset(host->mmc);
 
 	if (host->clk_cache)
 		host->set_clock(host, host->clk_cache);
-- 
2.19.1
