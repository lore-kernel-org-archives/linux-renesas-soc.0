Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7438 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732286AbeGKCNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 22:13:21 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] dmaengine: sh: rcar-dmac: Add dma_pause operation
Date: Wed, 11 Jul 2018 11:10:14 +0900
Message-Id: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

Changes from v1:
 - Rebase the latest slave-dma / next branch.
 - Fix the subsystem name in each subject.
 - Minor fix the commit log in patch 2.

Yoshihiro Shimoda (2):
  dmaengine: sh: rcar-dmac: add a new function to clear CHCR.DE with
    barrier
  dmaengine: sh: rcar-dmac: Add dma_pause operation

 drivers/dma/sh/rcar-dmac.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

-- 
1.9.1
