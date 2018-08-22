Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33211 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbeHVVs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 17:48:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id c7-v6so2112631lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 11:22:28 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <624fec83-0190-18b4-1d80-b59b1bc964b2@cogentembedded.com>
Date: Wed, 22 Aug 2018 21:22:26 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have encountered an interrupt storm during the eMMC chip probing (and
the chip finally didn't get detected).  It turned out that U-Boot left
the SDHI DMA interrupts enabled while the Linux driver didn't use those.
Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
rid of both issues...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.

Changes in version 2:
- fixed #define INFO{1|2}_RESERVED_BITS, rename them to INFO{1|2}_MASK_CLEAR,
  and moved them higher;
- shortened the comment before masking the DMAC interrupts;
- fixed up the excess whitespace in the patch dsescription.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- renesas.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ renesas/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -49,10 +49,12 @@
 
 /* DM_CM_INFO1 and DM_CM_INFO1_MASK */
 #define INFO1_CLEAR		0
+#define INFO1_MASK_CLEAR	GENMASK_ULL(31, 0)
 #define INFO1_DTRANEND1		BIT(17)
 #define INFO1_DTRANEND0		BIT(16)
 
 /* DM_CM_INFO2 and DM_CM_INFO2_MASK */
+#define INFO2_MASK_CLEAR	GENMASK_ULL(31, 0)
 #define INFO2_DTRANERR1		BIT(17)
 #define INFO2_DTRANERR0		BIT(16)
 
@@ -236,6 +238,12 @@ renesas_sdhi_internal_dmac_request_dma(s
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	/* Disable DMAC interrupts, we don't use them */
+	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO1_MASK,
+					    INFO1_MASK_CLEAR);
+	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO2_MASK,
+					    INFO2_MASK_CLEAR);
+
 	/* Each value is set to non-zero to assume "enabling" each DMA */
 	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
 
