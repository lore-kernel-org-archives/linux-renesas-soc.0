Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:40911 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1422803AbcFHHdN (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 03:33:13 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] usb: renesas_usbhs: fix NULL pointer dereference in xfer_work()
Date: Wed, 8 Jun 2016 16:32:49 +0900
Message-ID: <1465371170-4828-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the xfer_work() is possible to cause
NULL pointer dereference if the usb cable is disconnected while data
transfer is running.

In such case, a gadget driver may call usb_ep_disable()) before
xfer_work() is actually called. In this case, the usbhs_pkt_pop()
will call usbhsf_fifo_unselect(), and then usbhs_pipe_to_fifo()
in xfer_work() will return NULL.

Fixes: e73a989 ("usb: renesas_usbhs: add DMAEngine support")
Cc: <stable@vger.kernel.org> # v3.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 7be4e7d..280ed5f 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -810,20 +810,27 @@ static void xfer_work(struct work_struct *work)
 {
 	struct usbhs_pkt *pkt = container_of(work, struct usbhs_pkt, work);
 	struct usbhs_pipe *pipe = pkt->pipe;
-	struct usbhs_fifo *fifo = usbhs_pipe_to_fifo(pipe);
+	struct usbhs_fifo *fifo;
 	struct usbhs_priv *priv = usbhs_pipe_to_priv(pipe);
 	struct dma_async_tx_descriptor *desc;
-	struct dma_chan *chan = usbhsf_dma_chan_get(fifo, pkt);
+	struct dma_chan *chan;
 	struct device *dev = usbhs_priv_to_dev(priv);
 	enum dma_transfer_direction dir;
+	unsigned long flags;
 
+	usbhs_lock(priv, flags);
+	fifo = usbhs_pipe_to_fifo(pipe);
+	if (!fifo)
+		goto xfer_work_end;
+
+	chan = usbhsf_dma_chan_get(fifo, pkt);
 	dir = usbhs_pipe_is_dir_in(pipe) ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
 
 	desc = dmaengine_prep_slave_single(chan, pkt->dma + pkt->actual,
 					pkt->trans, dir,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc)
-		return;
+		goto xfer_work_end;
 
 	desc->callback		= usbhsf_dma_complete;
 	desc->callback_param	= pipe;
@@ -831,7 +838,7 @@ static void xfer_work(struct work_struct *work)
 	pkt->cookie = dmaengine_submit(desc);
 	if (pkt->cookie < 0) {
 		dev_err(dev, "Failed to submit dma descriptor\n");
-		return;
+		goto xfer_work_end;
 	}
 
 	dev_dbg(dev, "  %s %d (%d/ %d)\n",
@@ -842,6 +849,9 @@ static void xfer_work(struct work_struct *work)
 	usbhs_pipe_set_trans_count_if_bulk(pipe, pkt->trans);
 	dma_async_issue_pending(chan);
 	usbhs_pipe_enable(pipe);
+
+xfer_work_end:
+	usbhs_unlock(priv, flags);
 }
 
 /*
-- 
1.9.1
