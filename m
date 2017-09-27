Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:26385 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751362AbdI0IH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 04:07:59 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: fix usbhsf_fifo_clear() behavior
Date: Wed, 27 Sep 2017 17:04:05 +0900
Message-Id: <1506499445-14826-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes two issues:
 - the usbhsf_fifo_clear() is possible to cause 10 msec delay if
   the pipe is RX direction and empty because the FRDY bit will never
   be set to 1 in such case.
 - sets the BCLR of {C,Dn}FIFOCTR to 1 even when it's non-DCP pipe and
   the FRDY bit sets to 0.

Fixes: e8d548d54968 ("usb: renesas_usbhs: fifo became independent from pipe.")
Cc: <stable@vger.kernel.org> # v3.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch set is based on the Felipe's usb.git / testing/fixes branch
 (The commit is 7661ca09b2ff98f48693f431bb01fed62830e433).

 drivers/usb/renesas_usbhs/fifo.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index d1af831..68f2690 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -282,11 +282,26 @@ static void usbhsf_fifo_clear(struct usbhs_pipe *pipe,
 			      struct usbhs_fifo *fifo)
 {
 	struct usbhs_priv *priv = usbhs_pipe_to_priv(pipe);
+	int ret = 0;
 
-	if (!usbhs_pipe_is_dcp(pipe))
-		usbhsf_fifo_barrier(priv, fifo);
+	if (!usbhs_pipe_is_dcp(pipe)) {
+		/*
+		 * This driver checks the pipe condition first to avoid -EBUSY
+		 * from usbhsf_fifo_barrier() with about 10 msec delay in
+		 * the interrupt handler if the pipe is RX direction and empty.
+		 */
+		if (usbhs_pipe_is_dir_in(pipe))
+			ret = usbhs_pipe_is_accessible(pipe);
+		if (!ret)
+			ret = usbhsf_fifo_barrier(priv, fifo);
+	}
 
-	usbhs_write(priv, fifo->ctr, BCLR);
+	/*
+	 * if non-DCP pipe, this driver should set BCLR when
+	 * usbhsf_fifo_barrier() returns 0.
+	 */
+	if (!ret)
+		usbhs_write(priv, fifo->ctr, BCLR);
 }
 
 static int usbhsf_fifo_rcv_len(struct usbhs_priv *priv,
-- 
1.9.1
