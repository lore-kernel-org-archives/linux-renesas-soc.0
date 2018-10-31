Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:62581 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbeKAIBS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:01:18 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] mmc: tmio: delete wait in tuning process
Date: Thu,  1 Nov 2018 00:00:43 +0100
Message-Id: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

The manual does not contain information that a wait is needed in the
tuning process, this might be a leftover from early development.
Removing the wait don't have any effect on operation so delete the wait
to shorten the initialization time.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[Niklas: fixup commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 8d64f6196f33e882..a8f917f744fb9f63 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -734,8 +734,6 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		ret = mmc_send_tuning(mmc, opcode, NULL);
 		if (ret == 0)
 			set_bit(i, host->taps);
-
-		usleep_range(1000, 1200);
 	}
 
 	ret = host->select_tuning(host);
-- 
2.19.1
