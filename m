Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45516 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729206AbeKSXhn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 18:37:43 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Date: Mon, 19 Nov 2018 14:13:57 +0100
Message-Id: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some variants (namely Renesas SDHI) have bits in the STATS and IRQ_MASK
registers which are 'always 1' and should be written as such. Introduce
a seperate mask for this and apply it whenever such a register is
written.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is my response to BSP patches modifying all the register writes directly
(BSP commits 2d339800bbc73d and f73d5eb86097df). This seems much more future
proof to me.

Yamada-san: could you check if your HW has 'always 1' bits, too?

Tested on a R-Car M3-N. No regression and no performance impacts when reading
large files from eMMC or UHS-SD cards.

 drivers/mmc/host/renesas_sdhi_core.c | 1 +
 drivers/mmc/host/tmio_mmc.h          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a049b01206f1..31a351a20dc0 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -722,6 +722,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.card_busy = renesas_sdhi_card_busy;
 		host->ops.start_signal_voltage_switch =
 			renesas_sdhi_start_signal_voltage_switch;
+		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
 	}
 
 	/* Orginally registers were 16 bit apart, could be 32 or 64 nowadays */
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 5f6dfb86e43e..c03529e3f01a 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -70,6 +70,7 @@
 #define TMIO_STAT_DAT0		BIT(23)	/* only known on R-Car so far */
 #define TMIO_STAT_RXRDY         BIT(24)
 #define TMIO_STAT_TXRQ          BIT(25)
+#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ so far */
 #define TMIO_STAT_ILL_FUNC      BIT(29) /* only when !TMIO_MMC_HAS_IDLE_WAIT */
 #define TMIO_STAT_SCLKDIVEN     BIT(29) /* only when TMIO_MMC_HAS_IDLE_WAIT */
 #define TMIO_STAT_CMD_BUSY      BIT(30)
@@ -154,6 +155,7 @@ struct tmio_mmc_host {
 	u32			sdcard_irq_mask;
 	u32			sdio_irq_mask;
 	unsigned int		clk_cache;
+	u32			sdcard_irq_setbit_mask;
 
 	spinlock_t		lock;		/* protect host private data */
 	unsigned long		last_req_ts;
@@ -268,6 +270,9 @@ static inline void sd_ctrl_write16_rep(struct tmio_mmc_host *host, int addr,
 static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 						int addr, u32 val)
 {
+	if (addr == CTL_IRQ_MASK || addr == CTL_STATUS)
+		val |= host->sdcard_irq_setbit_mask;
+
 	iowrite16(val & 0xffff, host->ctl + (addr << host->bus_shift));
 	iowrite16(val >> 16, host->ctl + ((addr + 2) << host->bus_shift));
 }
-- 
2.11.0
