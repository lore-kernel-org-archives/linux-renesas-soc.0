Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:38553 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751892AbdI0JvS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 05:51:18 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] usb: renesas_usbhs: fix the BCLR setting condition for non-DCP pipe
Date: Wed, 27 Sep 2017 18:47:12 +0900
Message-Id: <1506505633-4688-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1506505633-4688-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506505633-4688-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the driver sets the BCLR bit of
{C,Dn}FIFOCTR register to 1 even when it's non-DCP pipe and
the FRDY bit of {C,Dn}FIFOCTR register is set to 1.

Fixes: e8d548d54968 ("usb: renesas_usbhs: fifo became independent from pipe.")
Cc: <stable@vger.kernel.org> # v3.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index d1af831..03cac07 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -282,11 +282,17 @@ static void usbhsf_fifo_clear(struct usbhs_pipe *pipe,
 			      struct usbhs_fifo *fifo)
 {
 	struct usbhs_priv *priv = usbhs_pipe_to_priv(pipe);
+	int ret = 0;
 
 	if (!usbhs_pipe_is_dcp(pipe))
-		usbhsf_fifo_barrier(priv, fifo);
+		ret = usbhsf_fifo_barrier(priv, fifo);
 
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
