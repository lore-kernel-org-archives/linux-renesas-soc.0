Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45669 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752582AbdC1WmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 18:42:08 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] dmaengine: rcar-dmac: fix resource freeing synchronization
Date: Wed, 29 Mar 2017 00:40:32 +0200
Message-Id: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This series fix resource freeing synchronization by:

1. Patch 1/3
   Store the IRQ number in the global struct so it can be used later 
   together with synchronize_irq().

2. Patch 2/3
   Adding support for the device_synchronize() callback in patch 2/3.

3. Patch 3/3
   Waiting for any ISR that might still be running after the channel is 
   halted prior to freeing its resources. This was patch previously part 
   of a patch sent out by Yoshihiro Shimoda and authored by Hiroyuki 
   Yokoyama, see [1].

   In that thread it was suggested by Lars-Peter Clausen to instead 
   implement the device_synchronize() callback. Unfortunately this is not 
   enough to solve the issue. In rcar_dmac_free_chan_resources() the 
   channel is halted by a call to rcar_dmac_chan_halt() and then directly 
   moves on to freeing resources, here it is still needed to add a wait 
   for any ISR to finish before freeing the resources, despite that a 
   device_synchronize() have been added.  This is because call chain:

   dma_release_channel()
     dma_chan_put()
       dmaengine_synchronize()
       rcar_dmac_free_chan_resources()
         rcar_dmac_chan_halt()

   Here dmaengine_synchronize() is called prior to rcar_dmac_chan_halt() 
   so an extra synchronisation to wait for any running ISR is still 
   needed.

By both adding a device_synchronize() which can be used in conjunction 
with device_terminate_all() and fiends and by adding an explicit 
synchronize_irq() when freeing channel resources I feel the 
synchronisation for freeing channel resources are in a much better 
shape. It also solves the issue in the original mail thread.

The series is based on v4.11-rc1 and is tested on r8a7795 Salvator-X.

1. https://patchwork.kernel.org/patch/9557691/

Niklas Söderlund (3):
  dmaengine: rcar-dmac: store channel IRQ in struct rcar_dmac_chan
  dmaengine: rcar-dmac: implement device_synchronize()
  dmaengine: rcar-dmac: wait for ISR to finish before freeing resources

 drivers/dma/sh/rcar-dmac.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

-- 
2.12.0
