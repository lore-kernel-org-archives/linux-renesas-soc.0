Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:59784 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932073AbeFFUsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 16:48:39 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/4] mmc: renesas_sdhi: Fix SCC error detection
Date: Wed,  6 Jun 2018 22:47:24 +0200
Message-Id: <20180606204724.26055-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

SDR104 and HS200 need to check SCC error. If SCC error is detected,
retuning is necessary.

In addition SCC error checking during retuning is unnecessary.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: fix small style issue]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 85152e73e6386f1c..c5af7a8645f9eea2 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -358,6 +358,13 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
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
