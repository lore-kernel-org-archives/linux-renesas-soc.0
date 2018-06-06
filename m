Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:44423 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932073AbeFFUsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 16:48:30 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/4] mmc: renesas_sdhi: Fix sampling clock position selecting
Date: Wed,  6 Jun 2018 22:47:23 +0200
Message-Id: <20180606204724.26055-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

When the result of tuning was different between the first set and the
second set, there was a case where the wrong sampling clock position was
selected. As a countermeasure, make the two results the same.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: update commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 45c015da2e757c90..85152e73e6386f1c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -301,6 +301,15 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	/* Clear SCC_RVSREQ */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
+	/* Merge the results */
+	for (i = 0; i < host->tap_num * 2; i++) {
+		if (!test_bit(i, host->taps)) {
+			clear_bit(i % host->tap_num, host->taps);
+			clear_bit((i % host->tap_num) + host->tap_num,
+				  host->taps);
+		}
+	}
+
 	/*
 	 * Find the longest consecutive run of successful probes.  If that
 	 * is more than SH_MOBILE_SDHI_MAX_TAP probes long then use the
-- 
2.17.0
