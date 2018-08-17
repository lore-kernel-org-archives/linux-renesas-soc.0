Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42301 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbeHQXXw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 19:23:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id f1-v6so7269988ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Aug 2018 13:19:04 -0700 (PDT)
Subject: [PATCH 1/2] mmc: renesas_sdhi_internal_dmac: fix typo in
 DM_CM_DTRAN_MODE.BUS_WIDTH field name
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
Message-ID: <f93ace85-6e2a-fec0-b73c-9101bdde60eb@cogentembedded.com>
Date: Fri, 17 Aug 2018 23:19:02 +0300
MIME-Version: 1.0
In-Reply-To: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix a stray underscore in the DM_CM_DTRAN_MODE.BUS_WIDTH register field
name.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -36,7 +36,7 @@
 /* DM_CM_DTRAN_MODE */
 #define DTRAN_MODE_CH_NUM_CH0	0	/* "downstream" = for write commands */
 #define DTRAN_MODE_CH_NUM_CH1	BIT(16)	/* "uptream" = for read commands */
-#define DTRAN_MODE_BUS_WID_TH	(BIT(5) | BIT(4))
+#define DTRAN_MODE_BUS_WIDTH	(BIT(5) | BIT(4))
 #define DTRAN_MODE_ADDR_MODE	BIT(0)	/* 1 = Increment address */
 
 /* DM_CM_DTRAN_CTRL */
@@ -172,7 +172,7 @@ renesas_sdhi_internal_dmac_start_dma(str
 				     struct mmc_data *data)
 {
 	struct scatterlist *sg = host->sg_ptr;
-	u32 dtran_mode = DTRAN_MODE_BUS_WID_TH | DTRAN_MODE_ADDR_MODE;
+	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH | DTRAN_MODE_ADDR_MODE;
 
 	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
 			mmc_get_dma_dir(data)))
