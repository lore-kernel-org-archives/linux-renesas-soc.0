Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: dmaengine@vger.kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        vinod.koul@intel.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, dan.j.williams@intel.com
Date: Mon, 13 Mar 2017 23:38:15 +0900
Message-Id: <148941589552.8144.12085740563774580543.sendpatchset@little-apple>
In-Reply-To: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
References: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
Subject: [PATCH 2/3] dmaengine: rcar-dmac: Slow mode prototype
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

This experimental slow mode support code simply extends the MID/RID value
to allow encoding a 4-bit value in bit 8-11 to specify the SLM bit value.
With this value set the channel associated with the device will be processed
slower by the hardware. The idea is that the slow mode can be used for testing
to force underruns to harden other parts of the system.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/dma/sh/rcar-dmac.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

--- 0002/drivers/dma/sh/rcar-dmac.c
+++ work/drivers/dma/sh/rcar-dmac.c	2017-03-13 23:15:54.170607110 +0900
@@ -171,6 +171,7 @@ struct rcar_dmac_chan {
 	struct rcar_dmac_chan_slave dst;
 	struct rcar_dmac_chan_map map;
 	int mid_rid;
+	unsigned int slm;
 
 	spinlock_t lock;
 
@@ -374,7 +375,7 @@ static void rcar_dmac_chan_start_xfer(st
 		rcar_dmac_chan_write(chan, RCAR_DMADPBASE,
 				     (desc->hwdescs.dma & 0xfffffff0) |
 				     RCAR_DMADPBASE_SEL);
-		rcar_dmac_chan_write(chan, RCAR_DMACHCRB,
+		rcar_dmac_chan_write(chan, RCAR_DMACHCRB, chan->slm |
 				     RCAR_DMACHCRB_DCNT(desc->nchunks - 1) |
 				     RCAR_DMACHCRB_DRST);
 
@@ -438,6 +439,7 @@ static void rcar_dmac_chan_start_xfer(st
 		rcar_dmac_chan_write(chan, RCAR_DMATCR,
 				     chunk->size >> desc->xfer_shift);
 
+		rcar_dmac_chan_write(chan, RCAR_DMACHCRB, chan->slm);
 		chcr |= RCAR_DMACHCR_DPM_DISABLED | RCAR_DMACHCR_IE;
 	}
 
@@ -1596,7 +1598,7 @@ static bool rcar_dmac_chan_filter(struct
 			return false;
 	}
 
-	return !test_and_set_bit(dma_spec->args[0], dmac->modules);
+	return !test_and_set_bit(dma_spec->args[0] & 0xff, dmac->modules);
 }
 
 static struct dma_chan *rcar_dmac_of_xlate(struct of_phandle_args *dma_spec,
@@ -1661,7 +1663,12 @@ static struct dma_chan *rcar_dmac_of_xla
 		return NULL;
 
 	rchan = to_rcar_dmac_chan(chan);
-	rchan->mid_rid = dma_spec->args[0];
+	rchan->mid_rid = dma_spec->args[0] & 0xff;
+
+	if (dma_spec->args[0] > 0xff) {
+		rchan->slm = RCAR_DMACHCRB_SLM_CLK(dma_spec->args[0] >> 8);
+		dev_info(chan->device->dev, "slm set to 0x%x\n", rchan->slm);
+	}
 
 	return chan;
 }
