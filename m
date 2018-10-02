Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14154 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727510AbeJBSmn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Oct 2018 14:42:43 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix b-device mode for "workaround"
Date: Tue,  2 Oct 2018 20:57:44 +0900
Message-Id: <1538481464-24766-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If the "workaround_for_vbus" is true, the driver will not call
usb_disconnect(). So, since the controller keeps some registers'
value, the driver doesn't re-enumarate suitable speed after
the b-device mode is disabled. To fix the issue, this patch
adds usb_disconnect() calling in renesas_usb3_b_device_write()
if workaround_for_vbus is true.

Fixes: 43ba968b00ea ("usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode")
Cc: <stable@vger.kernel.org> # v4.14+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index e1656f3..67d8a50 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2437,6 +2437,9 @@ static ssize_t renesas_usb3_b_device_write(struct file *file,
 	else
 		usb3->forced_b_device = false;
 
+	if (usb3->workaround_for_vbus)
+		usb3_disconnect(usb3);
+
 	/* Let this driver call usb3_connect() anyway */
 	usb3_check_id(usb3);
 
-- 
1.9.1
