Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43231 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbeHQXZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 19:25:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id f135-v6so6725004lfg.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Aug 2018 13:20:26 -0700 (PDT)
Subject: [PATCH 2/2] mmc: renesas_sdhi_internal_dmac: fix comment typo
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
Message-ID: <c83a18f4-8901-b631-9ba9-ab102e216b3a@cogentembedded.com>
Date: Fri, 17 Aug 2018 23:20:23 +0300
MIME-Version: 1.0
In-Reply-To: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix the typo in the comment to #define DTRAN_MODE_CH_NUM_CH1.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -35,7 +35,7 @@
 
 /* DM_CM_DTRAN_MODE */
 #define DTRAN_MODE_CH_NUM_CH0	0	/* "downstream" = for write commands */
-#define DTRAN_MODE_CH_NUM_CH1	BIT(16)	/* "uptream" = for read commands */
+#define DTRAN_MODE_CH_NUM_CH1	BIT(16)	/* "upstream" = for read commands */
 #define DTRAN_MODE_BUS_WIDTH	(BIT(5) | BIT(4))
 #define DTRAN_MODE_ADDR_MODE	BIT(0)	/* 1 = Increment address */
 
