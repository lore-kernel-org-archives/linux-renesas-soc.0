Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:39901 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753742AbeGEOUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 10:20:23 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/4] mmc: renesas_sdhi: skip SCC error check when retuning
Date: Thu,  5 Jul 2018 16:18:41 +0200
Message-Id: <20180705141841.11121-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

Checking for SCC error during retuning is unnecessary.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: fix small style issue]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 589da18bd636c2f4..ef711c532a26babe 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -445,6 +445,13 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
+	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200))
+		return false;
+
+	if (host->mmc->doing_retune)
+		return false;
+
 	/* Check SCC error */
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
 	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &&
-- 
2.17.0
