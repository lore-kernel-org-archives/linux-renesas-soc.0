Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:65384 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726294AbeK0D6g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 22:58:36 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 1/3] mmc: tmio: enable module clock before resetting when resuming
Date: Mon, 26 Nov 2018 18:02:45 +0100
Message-Id: <20181126170247.4076-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
References: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On runtime power management resume, the host clock needs to be
enabled before calling tmio_mmc_reset. If the mmc device has a power
domain entry, the host clock is enabled via genpd_runtime_resume,
running before tmio_mmc_host_runtime_resume. If the mmc device has no
power domain entry, however, genpd_runtime_resume is not called. This
patch changes tmio_mmc_host_runtime_resume to enable the host clock
before calling tmio_mmc_reset.

Based on work from Masaharu Hayakawa.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index a8f917f744fb9f63..35acfa4f40b2ef57 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1326,8 +1326,8 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 
-	host->reset(host);
 	tmio_mmc_clk_enable(host);
+	host->reset(host);
 
 	if (host->clk_cache)
 		host->set_clock(host, host->clk_cache);
-- 
2.19.1
