Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:39302 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbeKAIAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:00:41 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] mmc: renesas_sdhi: remove workaround for HS400 clock
Date: Wed, 31 Oct 2018 23:59:44 +0100
Message-Id: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The driver sets an incorrect clock and depends on the clock driver
knowledge of this incorrect setting to still set a 200Mhz SDn clock.
Instead of spreading the workaround between the two drivers the clock
driver should be made aware of the ES versions where the special clock
handling is needed no need to keep this workaround in the SDHI driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d3ac43c3d0b655dc..78bd117bbe65de46 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -163,15 +163,6 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	if (new_clock == 0)
 		goto out;
 
-	/*
-	 * Both HS400 and HS200/SD104 set 200MHz, but some devices need to
-	 * set 400MHz to distinguish the CPG settings in HS400.
-	 */
-	if (host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
-	    host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400 &&
-	    new_clock == 200000000)
-		new_clock = 400000000;
-
 	clock = renesas_sdhi_clk_update(host, new_clock) / 512;
 
 	for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
-- 
2.19.1
