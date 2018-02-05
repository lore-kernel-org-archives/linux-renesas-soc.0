Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:20841 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750962AbeBEIRV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 03:17:21 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: missed the "running" flag in usb_dmac with rx path
Date: Mon,  5 Feb 2018 17:12:35 +0900
Message-Id: <1517818355-8513-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This fixes an issue that a gadget driver (usb_f_fs) is possible to
stop rx transactions after the usb-dmac is used because the following
functions missed to set/check the "running" flag.
 - usbhsf_dma_prepare_pop_with_usb_dmac()
 - usbhsf_dma_pop_done_with_usb_dmac()

So, if next transaction uses pio, the usbhsf_prepare_pop() can not
start the transaction because the "running" flag is 0.

Fixes: 8355b2b3082d ("usb: renesas_usbhs: fix the behavior of some usbhs_pkt_handle")
Cc: <stable@vger.kernel.org> # v3.19+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 2d24ef3..b295e20 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -989,6 +989,10 @@ static int usbhsf_dma_prepare_pop_with_usb_dmac(struct usbhs_pkt *pkt,
 	if ((uintptr_t)pkt->buf & (USBHS_USB_DMAC_XFER_SIZE - 1))
 		goto usbhsf_pio_prepare_pop;
 
+	/* return at this time if the pipe is running */
+	if (usbhs_pipe_is_running(pipe))
+		return 0;
+
 	usbhs_pipe_config_change_bfre(pipe, 1);
 
 	ret = usbhsf_fifo_select(pipe, fifo, 0);
@@ -1179,6 +1183,7 @@ static int usbhsf_dma_pop_done_with_usb_dmac(struct usbhs_pkt *pkt,
 	usbhsf_fifo_clear(pipe, fifo);
 	pkt->actual = usbhs_dma_calc_received_size(pkt, chan, rcv_len);
 
+	usbhs_pipe_running(pipe, 0);
 	usbhsf_dma_stop(pipe, fifo);
 	usbhsf_dma_unmap(pkt);
 	usbhsf_fifo_unselect(pipe, pipe->fifo);
-- 
1.9.1
