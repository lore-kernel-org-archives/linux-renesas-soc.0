Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:64613 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbeH3Dby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 23:31:54 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 2/3] mmc: renesas_sdhi: skip SCC error check when retuning
Date: Thu, 30 Aug 2018 01:32:06 +0200
Message-Id: <20180829233207.30646-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
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

* Changes since v3
- Use the newly introduce helper mmc_doing_retune() instead of checking
  host->mmc->doing_retune in the host driver.

* Changes since v2
- Add comment to describe why checking SCC errors when using 4 taps is
  not needed.

* Changes since v1
- Use intermediate variable use_4tap to simplify check.
---
 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index c2c0e444cfc9f2dc..360777e9f35cbb3e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -500,6 +500,19 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	bool use_4tap = host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400;
+
+	/*
+	 * Skip checking SCC errors when running on 4 taps in HS400 mode as
+	 * any retuning would still result in the same 4 taps being used.
+	 */
+	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
+	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
+	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 && !use_4tap))
+		return false;
+
+	if (mmc_doing_retune(host->mmc))
+		return false;
 
 	/* Check SCC error */
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
-- 
2.18.0
