Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from condef-06.nifty.com ([202.248.20.71]:17226 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751018AbdKXQmP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 11:42:15 -0500
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-06.nifty.com with ESMTP id vAOGQ7lD019308
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2017 01:26:11 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Simon Horman <simon.horman@netronome.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 22/22] mmc: tmio: remove dma_ops from tmio_mmc_host_probe() argument
Date: Sat, 25 Nov 2017 01:24:57 +0900
Message-Id: <1511540697-27387-23-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
References: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Drivers need to set up various struct members for tmio_mmc_host before
calling tmio_mmc_host_probe().  Do likewise for host->dma_ops instead
of passing it as a function argument.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mmc/host/renesas_sdhi_core.c | 3 ++-
 drivers/mmc/host/tmio_mmc.c          | 2 +-
 drivers/mmc/host/tmio_mmc.h          | 3 +--
 drivers/mmc/host/tmio_mmc_core.c     | 4 +---
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a5749d7..825378a 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -531,6 +531,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	host->clk_update	= renesas_sdhi_clk_update;
 	host->clk_disable	= renesas_sdhi_clk_disable;
 	host->multi_io_quirk	= renesas_sdhi_multi_io_quirk;
+	host->dma_ops		= dma_ops;
 
 	/* SDR speeds are only available on Gen2+ */
 	if (mmc_data->flags & TMIO_MMC_MIN_RCAR2) {
@@ -574,7 +575,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
-	ret = tmio_mmc_host_probe(host, dma_ops);
+	ret = tmio_mmc_host_probe(host);
 	if (ret < 0)
 		goto edisclk;
 
diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
index 11b87ce..43a2ea5 100644
--- a/drivers/mmc/host/tmio_mmc.c
+++ b/drivers/mmc/host/tmio_mmc.c
@@ -104,7 +104,7 @@ static int tmio_mmc_probe(struct platform_device *pdev)
 	host->mmc->f_max = pdata->hclk;
 	host->mmc->f_min = pdata->hclk / 512;
 
-	ret = tmio_mmc_host_probe(host, NULL);
+	ret = tmio_mmc_host_probe(host);
 	if (ret)
 		goto host_free;
 
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index f46d282..7609434 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -198,8 +198,7 @@ struct tmio_mmc_host {
 struct tmio_mmc_host *tmio_mmc_host_alloc(struct platform_device *pdev,
 					  struct tmio_mmc_data *pdata);
 void tmio_mmc_host_free(struct tmio_mmc_host *host);
-int tmio_mmc_host_probe(struct tmio_mmc_host *host,
-			const struct tmio_mmc_dma_ops *dma_ops);
+int tmio_mmc_host_probe(struct tmio_mmc_host *host);
 void tmio_mmc_host_remove(struct tmio_mmc_host *host);
 void tmio_mmc_do_data_irq(struct tmio_mmc_host *host);
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 02e1438..1d60a41 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1210,8 +1210,7 @@ void tmio_mmc_host_free(struct tmio_mmc_host *host)
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_host_free);
 
-int tmio_mmc_host_probe(struct tmio_mmc_host *_host,
-			const struct tmio_mmc_dma_ops *dma_ops)
+int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 {
 	struct platform_device *pdev = _host->pdev;
 	struct tmio_mmc_data *pdata = _host->pdata;
@@ -1304,7 +1303,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host,
 	INIT_WORK(&_host->done, tmio_mmc_done_work);
 
 	/* See if we also get DMA */
-	_host->dma_ops = dma_ops;
 	tmio_mmc_request_dma(_host, pdata);
 
 	pm_runtime_set_active(&pdev->dev);
-- 
2.7.4
