Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33516 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753465AbdCMOnp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 10:43:45 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: dmaengine@vger.kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        vinod.koul@intel.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, dan.j.williams@intel.com
Date: Mon, 13 Mar 2017 23:38:06 +0900
Message-Id: <148941588599.8144.15993533112695801708.sendpatchset@little-apple>
In-Reply-To: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
References: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
Subject: [PATCH 1/3] dmaengine: rcar-dmac: Priority handling prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The priority handling uses MID/RID values to determine if channels
below to RX or TX sides. The case of RX is unchanged and as low channel
number as possible is used to ensure high priority. New with this code
is that TX is allocated with highest channel number first to force low
priority. Some ugly layer violations are implemented to keep track of
which channels that are in use and which that are free.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/dma/sh/rcar-dmac.c |   96 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 6 deletions(-)

--- 0001/drivers/dma/sh/rcar-dmac.c
+++ work/drivers/dma/sh/rcar-dmac.c	2017-03-13 23:15:01.890607110 +0900
@@ -27,6 +27,11 @@
 #include "../dmaengine.h"
 
 /*
+ * Maximum number of channels this driver handles
+ */
+#define RCAR_DMAC_CHANNELS_MAX 100
+
+/*
  * struct rcar_dmac_xfer_chunk - Descriptor for a hardware transfer
  * @node: entry in the parent's chunks list
  * @src_addr: device source address
@@ -203,8 +208,20 @@ struct rcar_dmac {
 	struct rcar_dmac_chan *channels;
 
 	DECLARE_BITMAP(modules, 256);
+	DECLARE_BITMAP(ch_in_use, RCAR_DMAC_CHANNELS_MAX);
 };
 
+/*
+ * The ch_in_use bitmap is in reverse order to allow fast look up
+ * of the last available channel via find_next_zero_bit().
+ */
+static inline unsigned int rcar_dmac_chan_to_bit(struct dma_chan *chan)
+{
+	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
+
+	return (RCAR_DMAC_CHANNELS_MAX - 1) - rchan->index;
+}
+
 #define to_rcar_dmac(d)		container_of(d, struct rcar_dmac, engine)
 
 /* -----------------------------------------------------------------------------
@@ -965,6 +982,7 @@ rcar_dmac_chan_prep_sg(struct rcar_dmac_
 static int rcar_dmac_alloc_chan_resources(struct dma_chan *chan)
 {
 	struct rcar_dmac_chan *rchan = to_rcar_dmac_chan(chan);
+	struct rcar_dmac *dmac = to_rcar_dmac(chan->device);
 	int ret;
 
 	INIT_LIST_HEAD(&rchan->desc.chunks_free);
@@ -979,7 +997,11 @@ static int rcar_dmac_alloc_chan_resource
 	if (ret < 0)
 		return -ENOMEM;
 
-	return pm_runtime_get_sync(chan->device->dev);
+	ret = pm_runtime_get_sync(chan->device->dev);
+	if (!ret)
+		set_bit(rcar_dmac_chan_to_bit(chan), dmac->ch_in_use);
+
+	return ret;
 }
 
 static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
@@ -1028,6 +1050,8 @@ static void rcar_dmac_free_chan_resource
 	}
 
 	pm_runtime_put(chan->device->dev);
+
+	clear_bit(rcar_dmac_chan_to_bit(chan), dmac->ch_in_use);
 }
 
 static struct dma_async_tx_descriptor *
@@ -1196,7 +1220,6 @@ static int rcar_dmac_device_config(struc
 	rchan->dst.slave_addr = cfg->dst_addr;
 	rchan->src.xfer_size = cfg->src_addr_width;
 	rchan->dst.xfer_size = cfg->dst_addr_width;
-
 	return 0;
 }
 
@@ -1540,10 +1563,16 @@ static irqreturn_t rcar_dmac_isr_error(i
  * OF xlate and channel filter
  */
 
+struct rcar_dmac_filter_data {
+	struct of_phandle_args *dma_spec;
+	unsigned int bit_start;
+};
+
 static bool rcar_dmac_chan_filter(struct dma_chan *chan, void *arg)
 {
 	struct rcar_dmac *dmac = to_rcar_dmac(chan->device);
-	struct of_phandle_args *dma_spec = arg;
+	struct rcar_dmac_filter_data *filter_data = arg;
+	struct of_phandle_args *dma_spec = filter_data->dma_spec;
 
 	/*
 	 * FIXME: Using a filter on OF platforms is a nonsense. The OF xlate
@@ -1556,15 +1585,28 @@ static bool rcar_dmac_chan_filter(struct
 	    dma_spec->np != chan->device->dev->of_node)
 		return false;
 
+	/* Force a certain channel in case bit_start is valid */
+	if (filter_data->bit_start != RCAR_DMAC_CHANNELS_MAX) {
+		dev_dbg(chan->device->dev,
+			"filter ch: %d, start: %d, bit %d\n",
+			to_rcar_dmac_chan(chan)->index,	filter_data->bit_start,
+			rcar_dmac_chan_to_bit(chan));
+
+		if (filter_data->bit_start != rcar_dmac_chan_to_bit(chan))
+			return false;
+	}
+
 	return !test_and_set_bit(dma_spec->args[0], dmac->modules);
 }
 
 static struct dma_chan *rcar_dmac_of_xlate(struct of_phandle_args *dma_spec,
 					   struct of_dma *ofdma)
 {
+	struct rcar_dmac *dmac = ofdma->of_dma_data;
 	struct rcar_dmac_chan *rchan;
 	struct dma_chan *chan;
 	dma_cap_mask_t mask;
+	struct rcar_dmac_filter_data filter_data;
 
 	if (dma_spec->args_count != 1)
 		return NULL;
@@ -1573,7 +1615,48 @@ static struct dma_chan *rcar_dmac_of_xla
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	chan = dma_request_channel(mask, rcar_dmac_chan_filter, dma_spec);
+	/* Setup default filter data */
+	filter_data.dma_spec = dma_spec;
+	filter_data.bit_start = RCAR_DMAC_CHANNELS_MAX;
+
+	/*
+	 * As channel allocation policy, allocate the highest channel first
+	 * for low priority use as the default case.
+	 *
+	 * The exception is RX handling where highest priority possible
+	 * is assigned by allocating the lowest channel index first.
+	 *
+	 * Currently an even MID_RID value is assumed to be RX.
+	 */
+	if (dma_spec->args[0] & 1) {
+		struct dma_chan *last_chan;
+		unsigned int start;
+
+		last_chan = list_last_entry(&dmac->engine.channels,
+					    struct dma_chan, device_node);
+
+		start = rcar_dmac_chan_to_bit(last_chan);
+		filter_data.bit_start = find_next_zero_bit(dmac->ch_in_use,
+					 RCAR_DMAC_CHANNELS_MAX, start);
+
+		/*
+		 * Channels may be allocated by the dma engine subsystem
+		 * while ->device_alloc_chan_resources() is not yet invoked,
+		 * so the channels may be marked with zero bit value but yet
+		 * not available so go back to one earlier channel if so.
+		 */
+		while (filter_data.bit_start < RCAR_DMAC_CHANNELS_MAX) {
+			chan = dma_request_channel(mask, rcar_dmac_chan_filter,
+						   &filter_data);
+			if (chan)
+				break;
+
+			filter_data.bit_start++;
+		}
+	} else
+		chan = dma_request_channel(mask, rcar_dmac_chan_filter,
+					   &filter_data);
+
 	if (!chan)
 		return NULL;
 
@@ -1694,7 +1777,8 @@ static int rcar_dmac_parse_of(struct dev
 		return ret;
 	}
 
-	if (dmac->n_channels <= 0 || dmac->n_channels >= 100) {
+	if (dmac->n_channels <= 0 ||
+	    dmac->n_channels >= RCAR_DMAC_CHANNELS_MAX) {
 		dev_err(dev, "invalid number of channels %u\n",
 			dmac->n_channels);
 		return -EINVAL;
@@ -1801,7 +1885,7 @@ static int rcar_dmac_probe(struct platfo
 
 	/* Register the DMAC as a DMA provider for DT. */
 	ret = of_dma_controller_register(pdev->dev.of_node, rcar_dmac_of_xlate,
-					 NULL);
+					 dmac);
 	if (ret < 0)
 		goto error;
 
