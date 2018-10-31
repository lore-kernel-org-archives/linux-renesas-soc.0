Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:47799 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727979AbeKAIG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:06:26 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/3] mmc: tmio: enable module clock before resetting when resuming
Date: Thu,  1 Nov 2018 00:05:52 +0100
Message-Id: <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On runtime power management resume, the host clock needs to be
enabled before calling tmio_mmc_reset. If the mmc device has a power
domain entry, the host clock is enabled via genpd_runtime_resume,
running before tmio_mmc_host_runtime_resume. If the mmc device has no
power domain entry, however, genpd_runtime_resume is not called. This
patch changes tmio_mmc_host_runtime_resume to enable the host clock
before calling tmio_mmc_reset.

Based on work from Masaharu Hayakawa.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 8d64f6196f33e882..953562a12a0d6ebc 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1328,8 +1328,8 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
-	host->reset(host);
 	tmio_mmc_clk_enable(host);
+	host->reset(host);
 
 	if (host->clk_cache)
 		host->set_clock(host, host->clk_cache);
-- 
2.19.1
