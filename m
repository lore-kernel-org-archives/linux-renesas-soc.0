Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45290 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbeHVVyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 17:54:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id u83-v6so2146470lje.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 11:28:04 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: fix #define
 RST_RESERVED_BITS
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
Date: Wed, 22 Aug 2018 21:28:01 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DM_CM_RST register actually has bits 0-31 defaulting to 1s and bits
32-63 defaulting to 0s -- fix off-by-one in #define RST_RESERVED_BITS.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
===================================================================
--- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -45,7 +45,7 @@
 /* DM_CM_RST */
 #define RST_DTRANRST1		BIT(9)
 #define RST_DTRANRST0		BIT(8)
-#define RST_RESERVED_BITS	GENMASK_ULL(32, 0)
+#define RST_RESERVED_BITS	GENMASK_ULL(31, 0)
 
 /* DM_CM_INFO1 and DM_CM_INFO1_MASK */
 #define INFO1_CLEAR		0
