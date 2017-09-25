Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12755 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933580AbdIYIFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 04:05:08 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: gadget: udc: renesas_usb3: fix for no-data control transfer
Date: Mon, 25 Sep 2017 17:01:23 +0900
Message-Id: <1506326485-26254-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When bRequestType & USB_DIR_IN is false and req.length is 0 in control
transfer, since it means non-data, this driver should not set the mode
as control write. So, this patch fixes it.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index df37c1e..555c105 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1150,7 +1150,8 @@ static void usb3_start_pipe0(struct renesas_usb3_ep *usb3_ep,
 		usb3_set_p0_con_for_ctrl_read_data(usb3);
 	} else {
 		usb3_clear_bit(usb3, P0_MOD_DIR, USB3_P0_MOD);
-		usb3_set_p0_con_for_ctrl_write_data(usb3);
+		if (usb3_req->req.length)
+			usb3_set_p0_con_for_ctrl_write_data(usb3);
 	}
 
 	usb3_p0_xfer(usb3_ep, usb3_req);
-- 
1.9.1
