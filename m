Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:38570 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750760AbdJBFFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 01:05:44 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Fix DMAC sequence for receiving zero-length packet
Date: Mon,  2 Oct 2017 14:01:41 +0900
Message-Id: <1506920501-24149-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

The DREQE bit of the DnFIFOSEL should be set to 1 after the DE bit of
USB-DMAC on R-Car SoCs is set to 1 after the USB-DMAC received a
zero-length packet. Otherwise, a transfer completion interruption
of USB-DMAC doesn't happen. Even if the driver changes the sequence,
normal operations (transmit/receive without zero-length packet) will
not cause any side-effects. So, this patch fixes the sequence anyway.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
[shimoda: revise the commit log]
Fixes: e73a9891b3a1 ("usb: renesas_usbhs: add DMAEngine support")
Cc: <stable@vger.kernel.org> # v3.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the lastest Felipe's usb.git / testing/fixes branch
(commit id = c3cdce45f8d3dfa5c3467894aa89798314920328).

 drivers/usb/renesas_usbhs/fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 68f2690..50285b0 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -857,9 +857,9 @@ static void xfer_work(struct work_struct *work)
 		fifo->name, usbhs_pipe_number(pipe), pkt->length, pkt->zero);
 
 	usbhs_pipe_running(pipe, 1);
-	usbhsf_dma_start(pipe, fifo);
 	usbhs_pipe_set_trans_count_if_bulk(pipe, pkt->trans);
 	dma_async_issue_pending(chan);
+	usbhsf_dma_start(pipe, fifo);
 	usbhs_pipe_enable(pipe);
 
 xfer_work_end:
-- 
1.9.1
