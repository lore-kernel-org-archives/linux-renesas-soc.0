Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:34935 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752020AbcHHMyc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 08:54:32 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	"Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: renesas_usbhs: clear the BRDYSTS in usbhsg_ep_enable()
Date: Mon, 8 Aug 2016 21:50:52 +0900
Message-ID: <1470660653-21743-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that unexpected BRDY interruption happens
when the usb_ep_{enable,disable}() are called with different direction.
In this case, the driver will cause the following message:

 renesas_usbhs e6590000.usb: irq_ready run_error 1 : -16

This issue causes the followings:
 1) A pipe is enabled as transmission
 2) The pipe sent a data
 3) The pipe is disabled and re-enabled as reception.
 4) The pipe got a queue

Since the driver doesn't clear the BRDYSTS flags after 2) above, the issue
happens. If we add such clearing the flags into the driver, the code will
become complicate. So, this patch clears the BRDYSTS flag of reception in
usbhsg_ep_enable() to avoid complicate.

Cc: <stable@vger.kernel.org> # v4.1+ (usbhs_xxxsts_clear() is needed)
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 50f3363..92bc83b 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -617,10 +617,13 @@ static int usbhsg_ep_enable(struct usb_ep *ep,
 		 * use dmaengine if possible.
 		 * It will use pio handler if impossible.
 		 */
-		if (usb_endpoint_dir_in(desc))
+		if (usb_endpoint_dir_in(desc)) {
 			pipe->handler = &usbhs_fifo_dma_push_handler;
-		else
+		} else {
 			pipe->handler = &usbhs_fifo_dma_pop_handler;
+			usbhs_xxxsts_clear(priv, BRDYSTS,
+					   usbhs_pipe_number(pipe));
+		}
 
 		ret = 0;
 	}
-- 
1.9.1
