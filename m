Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:39680 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753465AbdLFIWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 03:22:51 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: renesas_usbhs: use PIPEnCLR.ACLRM instead of {C,Dn}FIFOCTR.BCLR in usbhs_pkt_pop()
Date: Wed,  6 Dec 2017 17:18:33 +0900
Message-Id: <1512548313-20175-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch uses usbhs_pipe_clear_without_sequence() instead of
usbhsf_fifo_clear() because usbhsf_fifo_clear() may not clear the pipe
buffer completely. This patch also changes the clearing condition from
DMA only to both DMA and PIO.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index ff96c2e..5925d11 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -94,8 +94,6 @@ static struct usbhs_pkt *__usbhsf_pkt_get(struct usbhs_pipe *pipe)
 	return list_first_entry_or_null(&pipe->list, struct usbhs_pkt, node);
 }
 
-static void usbhsf_fifo_clear(struct usbhs_pipe *pipe,
-			      struct usbhs_fifo *fifo);
 static void usbhsf_fifo_unselect(struct usbhs_pipe *pipe,
 				 struct usbhs_fifo *fifo);
 static struct dma_chan *usbhsf_dma_chan_get(struct usbhs_fifo *fifo,
@@ -124,10 +122,11 @@ struct usbhs_pkt *usbhs_pkt_pop(struct usbhs_pipe *pipe, struct usbhs_pkt *pkt)
 			chan = usbhsf_dma_chan_get(fifo, pkt);
 		if (chan) {
 			dmaengine_terminate_all(chan);
-			usbhsf_fifo_clear(pipe, fifo);
 			usbhsf_dma_unmap(pkt);
 		}
 
+		usbhs_pipe_clear_without_sequence(pipe, 0, 0);
+
 		__usbhsf_pkt_del(pkt);
 	}
 
-- 
1.9.1
