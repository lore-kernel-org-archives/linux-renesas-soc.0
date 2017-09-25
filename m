Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:15523 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933619AbdIYIFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 04:05:10 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: gadget: udc: renesas_usb3: Fix return value of usb3_write_pipe()
Date: Mon, 25 Sep 2017 17:01:25 +0900
Message-Id: <1506326485-26254-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver cannot go status stage
in control read when the req.zero is set to 1 and the len in
usb3_write_pipe() is set to 0. Otherwise, if we use g_ncm driver,
usb enumeration takes long time (5 seconds or more).

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7e0c534..63a2061 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1038,7 +1038,7 @@ static int usb3_write_pipe(struct renesas_usb3_ep *usb3_ep,
 			usb3_ep->ep.maxpacket);
 	u8 *buf = usb3_req->req.buf + usb3_req->req.actual;
 	u32 tmp = 0;
-	bool is_last;
+	bool is_last = !len ? true : false;
 
 	if (usb3_wait_pipe_status(usb3_ep, PX_STA_BUFSTS) < 0)
 		return -EBUSY;
@@ -1059,7 +1059,8 @@ static int usb3_write_pipe(struct renesas_usb3_ep *usb3_ep,
 		usb3_write(usb3, tmp, fifo_reg);
 	}
 
-	is_last = usb3_is_transfer_complete(usb3_ep, usb3_req);
+	if (!is_last)
+		is_last = usb3_is_transfer_complete(usb3_ep, usb3_req);
 	/* Send the data */
 	usb3_set_px_con_send(usb3_ep, len, is_last);
 
-- 
1.9.1
