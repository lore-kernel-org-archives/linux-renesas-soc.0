Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:61751 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753243AbcHVIta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 04:49:30 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] usb: renesas_usbhs: set quirk_avoids_skb_reserve if USB-DMAC is used
Date: Mon, 22 Aug 2016 17:48:28 +0900
Message-ID: <1471855708-10897-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch sets the quirk_avoids_skb_reserve flag to improve performance
of a network gadget driver (e.g. f_ncm.c) if USB-DMAC is used.

For example (on r8a7795 board + f_ncm.c + iperf udp mode / receiving):
  - without this patch:  90.3 Mbits/sec
  - with    this patch: 273   Mbits/sec

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 92bc83b..b4e9e6f 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -1106,6 +1106,8 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 	gpriv->gadget.name		= "renesas_usbhs_udc";
 	gpriv->gadget.ops		= &usbhsg_gadget_ops;
 	gpriv->gadget.max_speed		= USB_SPEED_HIGH;
+	gpriv->gadget.quirk_avoids_skb_reserve = usbhs_get_dparam(priv,
+								has_usb_dmac);
 
 	INIT_LIST_HEAD(&gpriv->gadget.ep_list);
 
-- 
1.9.1
