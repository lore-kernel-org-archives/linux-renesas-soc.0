Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:57492 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933489AbeGBJW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 05:22:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dma: sh: rcar-dmac: Add dma_pause operation
Date: Mon,  2 Jul 2018 18:21:50 +0900
Message-Id: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the lasest slave-dma / next branch.

This issue can be reproduced by the following commands on r8a7795
Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
 # stty 921600
 (Change Teraterm baud rate)
 # cat > rx.txt
 (Send 5MiB file by Teraterm.)
 # cmp <somewhere the 5MiB file> rx.txt
 output "differ: byte NNNNN, line MMM"

[1] https://patchwork.kernel.org/patch/10500775/

Yoshihiro Shimoda (2):
  dma: sh: rcar-dmac: add a new function to clear CHCR.DE with barrier
  dma: sh: rcar-dmac: Add dma_pause operation

 drivers/dma/sh/rcar-dmac.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

-- 
1.9.1
