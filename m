Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:54546 "EHLO
	smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932453AbcF3PZJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 11:25:09 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: vinod.koul@intel.com, geert+renesas@glider.be,
	laurent.pinchart+renesas@ideasonboard.com, mfarooq@visteon.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 0/4] Residue patches for rcar-dmac from renesas-drivers
Date: Thu, 30 Jun 2016 17:15:14 +0200
Message-Id: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

I have looked over the DMA residue branches in renesas-drivers tree
(topic/rcar-dmac-hamza-v3 and topic/rcar-dmac-residue-v1) hoping to
bring them to upstream. The original author for the bulk of the patches
Hamza Farooq have not shown any activity since autumn 2015.

In this cover letter I talk about all the patches in the above branches
but for obvious reasons only patches I think should be forwarded to
upstream are included in the series. All patches are based on top of
v4.7-rc1 and are tested on Koelsch using Geerts sertest tool to generate
DMA traffic. The highest baud I could get to work at was 921600 bps.
>From reading the original mail threads my conclusion is that this is
good enough since all errors reported by Hamza Farooq where related to
the serial sh-sci driver.

* Patches from topic/rcar-dmac-hamza-v3

- dma: rcar-dma: add wait after stopping dma engine
    In a perfect world one should check that RCAR_DMACHCR_DE is read
    back as 0 after it have been cleared. The documentation clearly
    states that one should do so.

    In the real world the worst case time for this register to be
    cleared as Morimoto-san checked with HW is 700us. Laurent later
    pointed out this is too long to busy loop over since this is done
    from both interrupt context and user context with a spinlock hold.

    Also in the real world the rcar-dmac driver WARN_ON_ONCE() that
    RCAR_DMACHCR_DE is not set before it attempts to start an transferee
    in rcar_dmac_chan_start_xfer(). So if this ever becomes a problem we
    will know about it. At least I have never seen this warning while
    using DMA. Whit this in mind I have not tried to implement a fix for
    this and I think the original patch can be dropped.

- dma: rcar-dma: Added dma_pause operation to rcar_dma driver
    This patch adds support for device pause operation, but not the
    resume operation. As pointed out in the original mail thread the
    pausing must not destroy any already started transaction which it do
    in its current form according to its author.

    Since the feature is incomplete and the use case never documented I
    propose we drop this patch and if we can find the use case create a
    separate task to add pause/resume functionality to the driver later.

- dma: rcar-dma: check if complete DMA packet received but not processed
    This patch is already addressed by Laurent in the original mail
    thread:

    "I don't think this will work. In particular rcar_dmac_tx_status()
    can be called with a cookie corresponding to a transfer not yet
    scheduled. A pending transfer complete interrupt doesn't mean that
    that cookie is complete.

    Furthermore I'm not sure this will really improve performances. The
    dma_cookie_status() call below just compares cookie values, I don't
    expect it to be much slower than a register read."

    I can see no reason to disagree with Laurent here and I propose this
    patch is dropped.

- dma: rcar-dma: use result of updated get_residue in tx_status
    Patch is IMHO good but needs a explanation in commit message to
    address the questions raised in the original mail thread. I have
    added en explanation and included the original patch.

- dma: rcar-dma: warn if transfer cannot start as TE = 1
    Patch is a bit oddly implemented and uses new functionality from
    patch 'dma: rcar-dma: add wait after stopping dma engine' above. I
    do however think the patch have merit. One should make sure
    according to the documentation that RCAR_DMACHCR_TE is not set
    before starting a transfer. I have reworked the check and proposed a
    different solution.

- dma: rcar-dma: Fixed active descriptor initializing
    Patch is clearly a bugfix and looks good. Laurent had a good comment
    in the original mail thread about how it can be made differently by
    reworking rcar_dmac_free_chan_resources() to call
    rcar_dmac_chan_reinit() which would correctly set
    rchan->desc.running to NULL.

    I have tried to implement this but failed. In my attempts to
    implement Laurents proposal which I thought would be trivial the
    kernel locks-up after a while with 'rcu_sched self-detected stall on
    CPU'. And I'm not smart enough to figure out why so I have kept the
    original patch so the bug fix part can be merged since that in
    itself is good.

* Patch from topic/rcar-dmac-residue-v1

- dmaengine: rcar-dmac: Fix residue reporting for pending descriptors
    Patch is good AFIK. There where one report on the mail list by
    Hamza Farooq that state he saw lots of warnings coming from the
    WARN() introduced in this patch. I have run lots of testes using
    Geerts nice sertest tool and have not once seen the warning once. The
    patch is included in this series.


Changes since v1:
- Remove extra blank line from 4/4
- Fix commit title to be consistent with 'dmaengine: rcar-dmac:'
- Collect Ack-by from Laurent

Laurent Pinchart (1):
  dmaengine: rcar-dmac: Fix residue reporting for pending descriptors

Muhammad Hamza Farooq (2):
  dmaengine: rcar-dmac: use result of updated get_residue in tx_status
  dmaengine: rcar-dmac: Fixed active descriptor initializing

Niklas Söderlund (1):
  dmaengine: rcar-dmac: warn if transfer cannot start as TE = 1

 drivers/dma/sh/rcar-dmac.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

-- 
2.9.0
