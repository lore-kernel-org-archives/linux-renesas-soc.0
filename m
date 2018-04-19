Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:41320 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753011AbeDSUHs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 16:07:48 -0400
Received: by mail-lf0-f68.google.com with SMTP id m202-v6so1943586lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Apr 2018 13:07:47 -0700 (PDT)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77980 to whitelist
Message-ID: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com>
Date: Thu, 19 Apr 2018 23:07:44 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I've successfully tested eMMC on R8A77980/Condor. R8A77980 has a single
SDHI core anyway, so can't be a subject of the known RX DMA errata...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |    1 +
 1 file changed, 1 insertion(+)

Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -276,6 +276,7 @@ static const struct soc_device_attribute
 	/* generic ones */
 	{ .soc_id = "r8a7795" },
 	{ .soc_id = "r8a7796" },
+	{ .soc_id = "r8a77980" },
 	{ .soc_id = "r8a77995" },
 	{ /* sentinel */ }
 };
