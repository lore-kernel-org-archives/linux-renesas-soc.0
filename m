Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:62414 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S966503AbeBNJpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 04:45:01 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: rcar-dmac: fix max_chunk_size for R-Car Gen3
Date: Wed, 14 Feb 2018 18:40:12 +0900
Message-Id: <1518601212-25250-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to R-Car Gen3 Rev.0.80 manual, the DMATCR can be set to
16,777,215 as maximum. So, this patch fixes the max_chunk_size for
safety on all of SoCs. Otherwise, a system may hang if the DMATCR
is set to 0 on R-Car Gen3.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/rcar-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index e3ff162..d0cacdb 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -917,7 +917,7 @@ static void rcar_dmac_chan_configure_desc(struct rcar_dmac_chan *chan,
 
 	rcar_dmac_chan_configure_desc(chan, desc);
 
-	max_chunk_size = (RCAR_DMATCR_MASK + 1) << desc->xfer_shift;
+	max_chunk_size = RCAR_DMATCR_MASK << desc->xfer_shift;
 
 	/*
 	 * Allocate and fill the transfer chunk descriptors. We own the only
-- 
1.9.1
