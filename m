Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:14458 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751938AbdI0JvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 05:51:20 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] usb: renesas_usbhs: fix usbhsf_fifo_clear() for RX direction
Date: Wed, 27 Sep 2017 18:47:13 +0900
Message-Id: <1506505633-4688-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1506505633-4688-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506505633-4688-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the usbhsf_fifo_clear() is possible
to cause 10 msec delay if the pipe is RX direction and empty because
the FRDY bit will never be set to 1 in such case.

Fixes: e8d548d54968 ("usb: renesas_usbhs: fifo became independent from pipe.")
Cc: <stable@vger.kernel.org> # v3.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/fifo.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 03cac07..68f2690 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -284,8 +284,17 @@ static void usbhsf_fifo_clear(struct usbhs_pipe *pipe,
 	struct usbhs_priv *priv = usbhs_pipe_to_priv(pipe);
 	int ret = 0;
 
-	if (!usbhs_pipe_is_dcp(pipe))
-		ret = usbhsf_fifo_barrier(priv, fifo);
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
 
 	/*
 	 * if non-DCP pipe, this driver should set BCLR when
-- 
1.9.1
