Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46910 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbeHRVRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Aug 2018 17:17:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id 203-v6so8692824ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Aug 2018 11:08:29 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to whitelist
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
Date: Sat, 18 Aug 2018 21:08:26 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 SoC
has a single SDHI core anyway, so can't be  a subject to the known RX DMA
errata...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |    1 +
 1 file changed, 1 insertion(+)

Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -293,6 +293,7 @@ static const struct soc_device_attribute
 	{ .soc_id = "r8a7795" },
 	{ .soc_id = "r8a7796" },
 	{ .soc_id = "r8a77965" },
+	{ .soc_id = "r8a77970" },
 	{ .soc_id = "r8a77980" },
 	{ .soc_id = "r8a77995" },
 	{ /* sentinel */ }
