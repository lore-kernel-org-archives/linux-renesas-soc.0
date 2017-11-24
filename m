Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from condef-07.nifty.com ([202.248.20.72]:62296 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753990AbdKXQao (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 11:30:44 -0500
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-07.nifty.com with ESMTP id vAOGQCiV023223
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2017 01:26:12 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Simon Horman <simon.horman@netronome.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 18/22] mmc: tmio: remove useless TMIO_MASK_CMD handling in tmio_mmc_host_probe()
Date: Sat, 25 Nov 2017 01:24:53 +0900
Message-Id: <1511540697-27387-19-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
References: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

TMIO_MASK_CMD is properly enabled in tmio_mmc_start_command().

We have no reason to set it up in tmio_mmc_host_probe().  (If we
really wanted to set it in the probe, we would have to do likewise
when resuming.)

Even worse, the following code is extremely confusing:

  _host->sdcard_irq_mask &= ~irq_mask;

The logic is opposite between "->sdcard_irq_mask" and "irq_mask".
The intention is not clear at a glance.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mmc/host/tmio_mmc_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 345e379..f5b11b8 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1194,7 +1194,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host,
 	struct mmc_host *mmc = _host->mmc;
 	struct resource *res_ctl;
 	int ret;
-	u32 irq_mask = TMIO_MASK_CMD;
 
 	tmio_mmc_of_parse(pdev, pdata);
 
@@ -1289,8 +1288,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host,
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
 
-	_host->sdcard_irq_mask &= ~irq_mask;
-
 	if (_host->native_hotplug)
 		tmio_mmc_enable_mmc_irqs(_host,
 				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
-- 
2.7.4
