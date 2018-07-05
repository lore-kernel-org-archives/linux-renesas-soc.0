Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:13929 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753531AbeGEOUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 10:20:18 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/4] mmc: tmio: Fix tuning flow
Date: Thu,  5 Jul 2018 16:18:38 +0200
Message-Id: <20180705141841.11121-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
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

---

* Changes since v1
- Change '!mmc_send_tuning()' to 'mmc_send_tuning() == 0'.
---
 drivers/mmc/host/tmio_mmc_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 416f9e078fda8b24..000fa9dff784ecb0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -817,10 +817,7 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		if (host->prepare_tuning)
 			host->prepare_tuning(host, i % host->tap_num);
 
-		ret = mmc_send_tuning(mmc, opcode, NULL);
-		if (ret && ret != -EILSEQ)
-			goto out;
-		if (ret == 0)
+		if (mmc_send_tuning(mmc, opcode, NULL) == 0)
 			set_bit(i, host->taps);
 
 		usleep_range(1000, 1200);
-- 
2.17.0
