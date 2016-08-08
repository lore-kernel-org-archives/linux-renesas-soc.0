Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:8802 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752044AbcHHMyd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 08:54:33 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	"Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: renesas_usbhs: Use dmac only if the pipe type is bulk
Date: Mon, 8 Aug 2016 21:50:53 +0900
Message-ID: <1470660653-21743-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that isochronous transfer's data is possible to
be lost as a workaround. Since this driver uses a workqueue to start
the dmac, the transfer is possible to be delayed when system load is high.

Fixes: 6e4b74e4690d ("usb: renesas: fix scheduling in atomic context bug")
Cc: <stable@vger.kernel.org> # v3.4+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 280ed5f..857e783 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -871,7 +871,7 @@ static int usbhsf_dma_prepare_push(struct usbhs_pkt *pkt, int *is_done)
 
 	/* use PIO if packet is less than pio_dma_border or pipe is DCP */
 	if ((len < usbhs_get_dparam(priv, pio_dma_border)) ||
-	    usbhs_pipe_is_dcp(pipe))
+	    usbhs_pipe_type_is(pipe, USB_ENDPOINT_XFER_ISOC))
 		goto usbhsf_pio_prepare_push;
 
 	/* check data length if this driver don't use USB-DMAC */
@@ -976,7 +976,7 @@ static int usbhsf_dma_prepare_pop_with_usb_dmac(struct usbhs_pkt *pkt,
 
 	/* use PIO if packet is less than pio_dma_border or pipe is DCP */
 	if ((pkt->length < usbhs_get_dparam(priv, pio_dma_border)) ||
-	    usbhs_pipe_is_dcp(pipe))
+	    usbhs_pipe_type_is(pipe, USB_ENDPOINT_XFER_ISOC))
 		goto usbhsf_pio_prepare_pop;
 
 	fifo = usbhsf_get_dma_fifo(priv, pkt);
-- 
1.9.1
