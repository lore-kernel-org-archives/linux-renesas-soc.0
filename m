Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:62275 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753123AbcHVIt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 04:49:29 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] usb: gadget: u_ether: add a flag to avoid skb_reserve() calling
Date: Mon, 22 Aug 2016 17:48:26 +0900
Message-ID: <1471855708-10897-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds a flag "no_skb_reserve" in struct eth_dev.
So, if a peripheral driver sets the quirk_avoids_skb_reserve flag,
upper network gadget drivers (e.g. f_ncm.c) can avoid skb_reserve()
calling using the flag as well.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/function/u_ether.c | 5 ++++-
 drivers/usb/gadget/function/u_ether.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 5f562c1..3be4b93 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -82,6 +82,7 @@ struct eth_dev {
 #define	WORK_RX_MEMORY		0
 
 	bool			zlp;
+	bool			no_skb_reserve;
 	u8			host_mac[ETH_ALEN];
 	u8			dev_mac[ETH_ALEN];
 };
@@ -233,7 +234,8 @@ rx_submit(struct eth_dev *dev, struct usb_request *req, gfp_t gfp_flags)
 	 * but on at least one, checksumming fails otherwise.  Note:
 	 * RNDIS headers involve variable numbers of LE32 values.
 	 */
-	skb_reserve(skb, NET_IP_ALIGN);
+	if (likely(!dev->no_skb_reserve))
+		skb_reserve(skb, NET_IP_ALIGN);
 
 	req->buf = skb->data;
 	req->length = size;
@@ -1063,6 +1065,7 @@ struct net_device *gether_connect(struct gether *link)
 
 	if (result == 0) {
 		dev->zlp = link->is_zlp_ok;
+		dev->no_skb_reserve = link->no_skb_reserve;
 		DBG(dev, "qlen %d\n", qlen(dev->gadget, dev->qmult));
 
 		dev->header_len = link->header_len;
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index c77145b..81d94a7 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -64,6 +64,7 @@ struct gether {
 	struct usb_ep			*out_ep;
 
 	bool				is_zlp_ok;
+	bool				no_skb_reserve;
 
 	u16				cdc_filter;
 
-- 
1.9.1
