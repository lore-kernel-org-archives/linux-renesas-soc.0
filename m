Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:10422 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753009AbeGBJTD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 05:19:03 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dma: sh: rcar-dmac: avoid to write CHCR.TE to 1 if TCR is set to 0
Date: Mon,  2 Jul 2018 18:18:03 +0900
Message-Id: <1530523083-2106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that unexpected retransfering happens
if TCR is set to 0 before rcar_dmac_sync_tcr() writes DE bit to
the CHCR register. For example, sh-sci driver can reproduce this
issue like below:

 In rx_timer_fn():		/* CHCR DE bit may be set to 1 */
  dmaengine_tx_status()
   rcar_dmac_tx_status()
    rcar_dmac_chan_get_residue()
     rcar_dmac_sync_tcr()	/* TCR is possible to be set to 0 */

According to the description of commit 73a47bd0da66 ("dmaengine:
rcar-dmac: use TCRB instead of TCR for residue"), "this buffered data
will be transferred if CHCR::DE bit was cleared". So, this patch
doesn't need to check TCRB register.

Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest slave-dma / fixes branch.

 This issue can be reproduced by the following commands on r8a7795
Salvator-XS and Windows Teraterm :) :
 # stty 921600
 (Change Teraterm baud rate)
 # cat > rx.txt
 (Send 5MiB file by Teraterm. After a few minutes later, we cannot
  input any commands by the serial console.)

 drivers/dma/sh/rcar-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2a2ccd9..8305a1c 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -774,8 +774,9 @@ static void rcar_dmac_sync_tcr(struct rcar_dmac_chan *chan)
 	/* make sure all remaining data was flushed */
 	rcar_dmac_chcr_de_barrier(chan);
 
-	/* back DE */
-	rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
+	/* back DE if remain data exists */
+	if (rcar_dmac_chan_read(chan, RCAR_DMATCR))
+		rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
 }
 
 static void rcar_dmac_chan_halt(struct rcar_dmac_chan *chan)
-- 
1.9.1
