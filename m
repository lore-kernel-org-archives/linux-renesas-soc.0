Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:57633 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753066AbcHVIt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 04:49:29 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
Date: Mon, 22 Aug 2016 17:48:25 +0900
Message-ID: <1471855708-10897-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some platforms (e.g. USB-DMAC on R-Car SoCs) has memory alignment
restriction. If memory alignment is not match, the usb peripheral
driver decides not to use the DMA controller. Then, the performance
is not good.

In the case of u_ether.c, since it calls skb_reserve() in rx_submit(),
it is possible to cause memory alignment mismatch.

So, this patch adds a new quirk "quirk_avoids_skb_reserve" to avoid
skb_reserve() calling in u_ether.c to improve performance.

A peripheral driver will set this flag and network gadget drivers
(e.g. f_ncm.c) will reference the flag via gadget_avoids_skb_reserve().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/linux/usb/gadget.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 3cc9323..8e81f9e 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -346,6 +346,8 @@ struct usb_gadget_ops {
  *	or B-Peripheral wants to take host role.
  * @quirk_ep_out_aligned_size: epout requires buffer size to be aligned to
  *	MaxPacketSize.
+ * @quirk_avoids_skb_reserve: udc/platform wants to avoid skb_reserve() in
+ *	u_ether.c to improve performance.
  * @is_selfpowered: if the gadget is self-powered.
  * @deactivated: True if gadget is deactivated - in deactivated state it cannot
  *	be connected.
@@ -398,6 +400,7 @@ struct usb_gadget {
 	unsigned			quirk_altset_not_supp:1;
 	unsigned			quirk_stall_not_supp:1;
 	unsigned			quirk_zlp_not_supp:1;
+	unsigned			quirk_avoids_skb_reserve:1;
 	unsigned			is_selfpowered:1;
 	unsigned			deactivated:1;
 	unsigned			connected:1;
@@ -474,6 +477,16 @@ static inline int gadget_is_zlp_supported(struct usb_gadget *g)
 }
 
 /**
+ * gadget_avoids_skb_reserve - return true iff the hardware would like to avoid
+ *	skb_reserve to improve performance.
+ * @g: controller to check for quirk
+ */
+static inline int gadget_avoids_skb_reserve(struct usb_gadget *g)
+{
+	return g->quirk_avoids_skb_reserve;
+}
+
+/**
  * gadget_is_dualspeed - return true iff the hardware handles high speed
  * @g: controller that might support both high and full speeds
  */
-- 
1.9.1
