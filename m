Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751251AbeDEQm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 12:42:29 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: use more generic whitelisting
Date: Thu,  5 Apr 2018 18:42:16 +0200
Message-Id: <20180405164216.7175-1-wsa@the-dreams.de>
In-Reply-To: <20180404164507.3394-1-wsa@the-dreams.de>
References: <20180404164507.3394-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Whitelisting every ES version does not scale. So, we whitelist whole
SoCs independent of ES version. If we need specific handling for an ES
version, we put it to the front, so it will be matched first.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Shimoda-san: here is my example how to re-arrange the whitelisting if we assume
that the DMA RX fix is going to work out (so this patch depends on it). I
tested this patch on H3 ES1.0 and ES2.0 with some additional debug output to
prove that the correct table entry was matched.

What do you think?

Happy hacking,

   Wolfram


 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 561e90755a3b..19ab88b348c1 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -269,12 +269,15 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
  * implementation as others may use a different implementation.
  */
 static const struct soc_device_attribute gen3_soc_whitelist[] = {
+	/* specific ones */
         { .soc_id = "r8a7795", .revision = "ES1.*",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
-        { .soc_id = "r8a7795", .revision = "ES2.0" },
         { .soc_id = "r8a7796", .revision = "ES1.0",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
-        { .soc_id = "r8a77995", .revision = "ES1.0" },
+	/* generic ones */
+        { .soc_id = "r8a7795" },
+        { .soc_id = "r8a7796" },
+        { .soc_id = "r8a77995" },
         { /* sentinel */ }
 };
 
-- 
2.11.0
