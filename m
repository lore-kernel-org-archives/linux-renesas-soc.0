Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:29761 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751377AbdKMJDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 04:03:32 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: fix number of the pipes
Date: Mon, 13 Nov 2017 17:59:18 +0900
Message-Id: <1510563558-26892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This controller on R-Car Gen3 has 6 pipes that included PIPE 0 for
control actually. But, the datasheet has error in writing as it has
31 pipes. (However, the previous code defined 30 pipes wrongly...)

Anyway, this patch fixes it.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 63a2061..6b3e8ad 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -254,7 +254,7 @@
 #define USB3_EP0_SS_MAX_PACKET_SIZE	512
 #define USB3_EP0_HSFS_MAX_PACKET_SIZE	64
 #define USB3_EP0_BUF_SIZE		8
-#define USB3_MAX_NUM_PIPES		30
+#define USB3_MAX_NUM_PIPES		6	/* This includes PIPE 0 */
 #define USB3_WAIT_US			3
 #define USB3_DMA_NUM_SETTING_AREA	4
 /*
-- 
1.9.1
