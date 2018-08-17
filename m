Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36766 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbeHQT6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 15:58:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id u7-v6so6888093lji.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Aug 2018 09:54:12 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <711ef434-1208-4a9b-1c0d-519395251531@cogentembedded.com>
Date: Fri, 17 Aug 2018 19:54:09 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have encountered an interrupt storm during the eMMC chip probing (and
the chip finally didn't get detected). It turned out  that U-Boot  left
the SDHI DMA interrupts enabled while the Linux  driver didn't use those.
Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
rid  of both  issues...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -51,10 +51,12 @@
 #define INFO1_CLEAR		0
 #define INFO1_DTRANEND1		BIT(17)
 #define INFO1_DTRANEND0		BIT(16)
+#define INFO1_RESERVED_BITS	GENMASK_ULL(32, 0)
 
 /* DM_CM_INFO2 and DM_CM_INFO2_MASK */
 #define INFO2_DTRANERR1		BIT(17)
 #define INFO2_DTRANERR0		BIT(16)
+#define INFO2_RESERVED_BITS	GENMASK_ULL(32, 0)
 
 /*
  * Specification of this driver:
@@ -236,6 +238,15 @@ renesas_sdhi_internal_dmac_request_dma(s
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	/*
+	 * We don't use the DMA interrupts,  but they might have been enabled
+	 * by a bootloader,  so mask them to avoid an interrupt storm...
+	 */
+	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO1_MASK,
+					    INFO1_RESERVED_BITS);
+	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO2_MASK,
+					    INFO2_RESERVED_BITS);
+
 	/* Each value is set to non-zero to assume "enabling" each DMA */
 	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
 
