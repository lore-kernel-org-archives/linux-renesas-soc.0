Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D674C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 22:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FC8A20818
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 22:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfDJWXF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 18:23:05 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:4852 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726230AbfDJWXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 18:23:05 -0400
X-Halon-ID: 2de8034a-5bdf-11e9-8fa2-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 2de8034a-5bdf-11e9-8fa2-005056917a89;
        Thu, 11 Apr 2019 00:22:59 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver implementations
Date:   Thu, 11 Apr 2019 00:22:40 +0200
Message-Id: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Both the Renesas and Uniphier implementations perform actions which
affect runtime PM before calling into the core tmio_mmc_host_probe()
which enabled runtime PM. Move pm_runtime_enable() from the core and
tmio_mmc_host_probe() into each drivers probe() so it can be called
before any clocks or other resources are switched on.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c |  6 ++++++
 drivers/mmc/host/tmio_mmc.c          |  5 +++++
 drivers/mmc/host/tmio_mmc_core.c     | 11 +++++++++--
 drivers/mmc/host/uniphier-sd.c       |  3 +++
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e9e36ed2107a01c..db73f9f1b186f0ff 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -770,6 +770,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	/* All SDHI have SDIO status bits which must be 1 */
 	mmc_data->flags |= TMIO_MMC_SDIO_STATUS_SETBITS;
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = renesas_sdhi_clk_enable(host);
 	if (ret)
 		goto efree;
@@ -850,6 +852,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 efree:
 	tmio_mmc_host_free(host);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_probe);
@@ -861,6 +865,8 @@ int renesas_sdhi_remove(struct platform_device *pdev)
 	tmio_mmc_host_remove(host);
 	renesas_sdhi_clk_disable(host);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
index 93e83ad25976e756..8539e10784b40961 100644
--- a/drivers/mmc/host/tmio_mmc.c
+++ b/drivers/mmc/host/tmio_mmc.c
@@ -172,6 +172,8 @@ static int tmio_mmc_probe(struct platform_device *pdev)
 	host->mmc->f_max = pdata->hclk;
 	host->mmc->f_min = pdata->hclk / 512;
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = tmio_mmc_host_probe(host);
 	if (ret)
 		goto host_free;
@@ -191,6 +193,7 @@ static int tmio_mmc_probe(struct platform_device *pdev)
 	tmio_mmc_host_remove(host);
 host_free:
 	tmio_mmc_host_free(host);
+	pm_runtime_disable(&pdev->dev);
 cell_disable:
 	if (cell->disable)
 		cell->disable(pdev);
@@ -207,6 +210,8 @@ static int tmio_mmc_remove(struct platform_device *pdev)
 	if (cell->disable)
 		cell->disable(pdev);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 130b91cb0f8a3fd1..26c148d3c8a2e655 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1152,6 +1152,15 @@ void tmio_mmc_host_free(struct tmio_mmc_host *host)
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_host_free);
 
+/**
+ * tmio_mmc_host_probe() - Common probe for all implementations
+ * @_host: Host to probe
+ *
+ * Perform tasks common to all implementations probe functions.
+ *
+ * The caller should have called pm_runtime_enable() prior to calling
+ * the common probe function.
+ */
 int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 {
 	struct platform_device *pdev = _host->pdev;
@@ -1260,7 +1269,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
 
 	ret = mmc_add_host(mmc);
 	if (ret)
@@ -1296,7 +1304,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
 
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 91a2be41edf6196b..49aad9a79c18d24a 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -631,6 +631,7 @@ static int uniphier_sd_probe(struct platform_device *pdev)
 	host->clk_disable = uniphier_sd_clk_disable;
 	host->set_clock = uniphier_sd_set_clock;
 
+	pm_runtime_enable(&pdev->dev);
 	ret = uniphier_sd_clk_enable(host);
 	if (ret)
 		goto free_host;
@@ -652,6 +653,7 @@ static int uniphier_sd_probe(struct platform_device *pdev)
 
 free_host:
 	tmio_mmc_host_free(host);
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
@@ -662,6 +664,7 @@ static int uniphier_sd_remove(struct platform_device *pdev)
 
 	tmio_mmc_host_remove(host);
 	uniphier_sd_clk_disable(host);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.21.0

