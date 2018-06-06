Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:39594 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752336AbeFFXYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 19:24:03 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask register
Date: Thu,  7 Jun 2018 01:22:50 +0200
Message-Id: <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

The initial value of the interrupt mask register may be different from
the H/W manual at the startup of the kernel by setting of initial program.
Since the error interrupts may be unmasked, the driver sets initial value.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc.h      | 1 +
 drivers/mmc/host/tmio_mmc_core.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index e7d651352dc90fb8..bfb76b2963f80894 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -102,6 +102,7 @@
 
 /* Define some IRQ masks */
 /* This is the mask used at reset by the chip */
+#define TMIO_MASK_INIT          0x8b7f031d /* H/W initial value */
 #define TMIO_MASK_ALL           0x837f031d
 #define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
 #define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 3080299303045adc..2ede81476daf76ce 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1273,6 +1273,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	tmio_mmc_clk_stop(_host);
 	tmio_mmc_reset(_host);
 
+	sd_ctrl_write32_as_16_and_16(_host, CTL_IRQ_MASK, TMIO_MASK_INIT);
 	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
 
-- 
2.17.0
