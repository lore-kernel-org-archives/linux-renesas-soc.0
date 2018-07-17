Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:20374 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731800AbeGQPZm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 11:25:42 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 3/4] mmc: renesas_sdhi: Fix sampling clock position selecting
Date: Tue, 17 Jul 2018 16:52:15 +0200
Message-Id: <20180717145216.16840-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When tuning each tap is issued CMD19 twice and the result of both runs
recorded in host->taps. If the result is different between the two runs
the wrong sampling clock position was selected. Fix this by merging the
two runs and only keep the result for each tap if it was good in both
sets.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---

* Changes since v2
- Rewrote the change to use a less clumsy loop.  The patch is now
  completely changed from Hayakawa-sans version and therefor I have also
  claimed authorship.
- Fixed spelling in comment as suggested by Geert.

* Changes since v1
- Updated commit message after discussion with Wolfram.
- Expanded comment in code to better explain why the results are merged.
---
 drivers/mmc/host/renesas_sdhi_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 384ae6cfa289e22c..777e32b0e410e850 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -384,6 +384,18 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	/* Clear SCC_RVSREQ */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
+	/*
+	 * When tuning CMD19 is issued twice for each tap, merge the
+	 * result requiring the tap to be good in both runs before
+	 * considering it for tuning selection.
+	 */
+	for (i = 0; i < host->tap_num * 2; i++) {
+		int offset = host->tap_num * (i < host->tap_num ? 1 : -1);
+
+		if (!test_bit(i, host->taps))
+			clear_bit(i + offset, host->taps);
+	}
+
 	/*
 	 * Find the longest consecutive run of successful probes.  If that
 	 * is more than SH_MOBILE_SDHI_MAX_TAP probes long then use the
-- 
2.18.0
