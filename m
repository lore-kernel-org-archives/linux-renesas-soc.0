Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:39056 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753176AbdLFIWu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 03:22:50 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: renesas_usbhs: remove redundant polling in usbhsf_fifo_barrier()
Date: Wed,  6 Dec 2017 17:18:31 +0900
Message-Id: <1512548313-20175-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The datasheet doesn't mention that needs to poll of FRDY is set or not.
So, this patch removes such handling in the usbhsf_fifo_barrier().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 2d24ef3..ff96c2e 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -256,15 +256,9 @@ static void usbhsf_send_terminator(struct usbhs_pipe *pipe,
 static int usbhsf_fifo_barrier(struct usbhs_priv *priv,
 			       struct usbhs_fifo *fifo)
 {
-	int timeout = 1024;
-
-	do {
-		/* The FIFO port is accessible */
-		if (usbhs_read(priv, fifo->ctr) & FRDY)
-			return 0;
-
-		udelay(10);
-	} while (timeout--);
+	/* The FIFO port is accessible */
+	if (usbhs_read(priv, fifo->ctr) & FRDY)
+		return 0;
 
 	return -EBUSY;
 }
@@ -278,8 +272,8 @@ static void usbhsf_fifo_clear(struct usbhs_pipe *pipe,
 	if (!usbhs_pipe_is_dcp(pipe)) {
 		/*
 		 * This driver checks the pipe condition first to avoid -EBUSY
-		 * from usbhsf_fifo_barrier() with about 10 msec delay in
-		 * the interrupt handler if the pipe is RX direction and empty.
+		 * from usbhsf_fifo_barrier() if the pipe is RX direction and
+		 * empty.
 		 */
 		if (usbhs_pipe_is_dir_in(pipe))
 			ret = usbhs_pipe_is_accessible(pipe);
-- 
1.9.1
