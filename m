Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:46323 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756719AbcGGIdl (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 04:33:41 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 3/4] usb: gadget: f_ncm: add support for no_skb_reserve
Date: Thu, 7 Jul 2016 17:32:41 +0900
Message-ID: <1467880362-4844-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1467880362-4844-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1467880362-4844-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds to support no_skb_reserve function to improve
performance for some platforms. About the detail, please refer to
the commit log of "quirk_avoids_skb_reserve" in
include/linux/usb/gadget.h.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/function/f_ncm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 97f0a9b..8c43298 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -852,6 +852,8 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			 */
 			ncm->port.is_zlp_ok =
 				gadget_is_zlp_supported(cdev->gadget);
+			ncm->port.no_skb_reserve =
+				gadget_avoids_skb_reserve(cdev->gadget);
 			ncm->port.cdc_filter = DEFAULT_FILTER;
 			DBG(cdev, "activate ncm\n");
 			net = gether_connect(&ncm->port);
-- 
1.9.1
