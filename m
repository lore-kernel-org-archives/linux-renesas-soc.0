Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:28659 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728004AbeKAIG1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:06:27 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 3/3] mmc: renesas_sdhi: add initial setting of interrupt mask register
Date: Thu,  1 Nov 2018 00:05:54 +0100
Message-Id: <20181031230554.1660-4-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The initial value of the interrupt mask register may be different from
the H/W manual at the startup of the kernel by setting from the
bootloader. Since the error interrupts may be unmasked, the driver sets
initial value.

The initial value is only known for R-Car Gen2 and Gen3 platforms so
limit the initialization to those platforms.

Based on work from Masaharu Hayakawa.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---

* Changes since v1
- Limit the initialization to Gen2+ platforms by checking the
  TMIO_MMC_MIN_RCAR2 flag.
- Rename the constant for the initialization value to reflect it's only
  for R-Car Gen2+ platforms.
- Move setting of the initial mask to renesas_sdhi.
---
 drivers/mmc/host/renesas_sdhi_core.c | 4 ++++
 drivers/mmc/host/tmio_mmc.h          | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d3ac43c3d0b655dc..f2162f2b7de3ae05 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -532,6 +532,10 @@ static void renesas_sdhi_hw_reset(struct tmio_mmc_host *host)
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
 		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
 		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
+
+	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
+		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
+					     TMIO_MASK_INIT_RCAR2);
 }
 
 static int renesas_sdhi_wait_idle(struct tmio_mmc_host *host, u32 bit)
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 1e317027bf534612..5f6dfb86e43e8208 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -96,6 +96,7 @@
 
 /* Define some IRQ masks */
 /* This is the mask used at reset by the chip */
+#define TMIO_MASK_INIT_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2+ */
 #define TMIO_MASK_ALL           0x837f031d
 #define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
 #define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
-- 
2.19.1
