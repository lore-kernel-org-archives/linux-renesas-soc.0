Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38906 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752327AbeDJJit (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 05:38:49 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: [PATCH 4/5] mmc: renesas_sdhi_internal_dmac: use more generic whitelisting
Date: Tue, 10 Apr 2018 11:38:30 +0200
Message-Id: <20180410093831.1759-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Whitelisting every ES version does not scale. So, we whitelist whole
SoCs independent of ES version. If we need specific handling for an ES
version, we put it to the front, so it will be matched first.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 32b8be4c0b81..06b4e0004ca4 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -272,12 +272,15 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
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
