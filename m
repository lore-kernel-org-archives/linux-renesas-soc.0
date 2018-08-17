Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46655 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbeHQOoN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 10:44:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id 203-v6so6093067ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Aug 2018 04:41:04 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mmc: tmio_mmc_core: don't claim spurious interrupts
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <f2295f99-2354-a2ad-5013-0501ecb0d3a1@cogentembedded.com>
Date: Fri, 17 Aug 2018 14:41:02 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have encountered an interrupt storm  during the eMMC chip probing (and
the chip finally didn't get detected). It  turned out  that U-Boot  left
the DMAC interrupts enabled while the  Linux driver didn't use those.
The SDHI driver's interrupt handler somehow  assumes that, even if a
SDIO interrupt didn't happen, it should return IRQ_HANDLED. I think that
if none of the enabled interrupts happened and got handled, we should
return IRQ_NONE -- that  way the kernel IRQ code recoginizes a spurious
interrupt and masks  it  off pretty quickly...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.

 drivers/mmc/host/tmio_mmc_core.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

Index: mmc/drivers/mmc/host/tmio_mmc_core.c
===================================================================
--- mmc.orig/drivers/mmc/host/tmio_mmc_core.c
+++ mmc/drivers/mmc/host/tmio_mmc_core.c
@@ -691,7 +691,7 @@ static bool __tmio_mmc_sdcard_irq(struct
 	return false;
 }
 
-static void __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
+static bool __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
 {
 	struct mmc_host *mmc = host->mmc;
 	struct tmio_mmc_data *pdata = host->pdata;
@@ -699,7 +699,7 @@ static void __tmio_mmc_sdio_irq(struct t
 	unsigned int sdio_status;
 
 	if (!(pdata->flags & TMIO_MMC_SDIO_IRQ))
-		return;
+		return false;
 
 	status = sd_ctrl_read16(host, CTL_SDIO_STATUS);
 	ireg = status & TMIO_SDIO_MASK_ALL & ~host->sdio_irq_mask;
@@ -712,6 +712,8 @@ static void __tmio_mmc_sdio_irq(struct t
 
 	if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ)
 		mmc_signal_sdio_irq(mmc);
+
+	return ireg ? true : false;
 }
 
 irqreturn_t tmio_mmc_irq(int irq, void *devid)
@@ -730,9 +732,10 @@ irqreturn_t tmio_mmc_irq(int irq, void *
 	if (__tmio_mmc_sdcard_irq(host, ireg, status))
 		return IRQ_HANDLED;
 
-	__tmio_mmc_sdio_irq(host);
+	if (__tmio_mmc_sdio_irq(host))
+		return IRQ_HANDLED;
 
-	return IRQ_HANDLED;
+	return IRQ_NONE;
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_irq);
 
