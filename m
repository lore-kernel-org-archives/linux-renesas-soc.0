Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:34753 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388495AbeGXP7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 11:59:01 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 1/2] mmc: tmio: Fix tuning flow
Date: Tue, 24 Jul 2018 16:51:37 +0200
Message-Id: <20180724145138.26536-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180724145138.26536-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180724145138.26536-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

If the return value of mmc_send_tuning() is error other than -EILSEQ,
the tuning fails and process goes out of for_loop. The correct
processing is to judge their TAP as not good (NG) and continue.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[Niklas: update commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

---

* Changes since v2
- Use a intermediate variable instead of checking the return value of
  mmc_send_tuning() in a if statement, suggested by Geert thanks!
- Added tags from Wolfram.

* Changes since v1
- Change '!mmc_send_tuning()' to 'mmc_send_tuning() == 0'.
---
 drivers/mmc/host/tmio_mmc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 416f9e078fda8b24..72ac806e0c762d83 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -818,8 +818,6 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 			host->prepare_tuning(host, i % host->tap_num);
 
 		ret = mmc_send_tuning(mmc, opcode, NULL);
-		if (ret && ret != -EILSEQ)
-			goto out;
 		if (ret == 0)
 			set_bit(i, host->taps);
 
-- 
2.18.0
