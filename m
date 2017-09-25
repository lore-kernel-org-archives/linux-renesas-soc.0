Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:56102 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933586AbdIYIFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 04:05:09 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: gadget: udc: renesas_usb3: fix Pn_RAMMAP.Pn_MPKT value
Date: Mon, 25 Sep 2017 17:01:24 +0900
Message-Id: <1506326485-26254-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the datasheet of R-Car Gen3, the Pn_RAMMAP.Pn_MPKT should
be set to one of 8, 16, 32, 64, 512 and 1024. Otherwise, when a gadget
driver uses an interrupt endpoint, unexpected behavior happens. So,
this patch fixes it.

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 555c105..7e0c534 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2054,7 +2054,16 @@ static u32 usb3_calc_ramarea(int ram_size)
 static u32 usb3_calc_rammap_val(struct renesas_usb3_ep *usb3_ep,
 				const struct usb_endpoint_descriptor *desc)
 {
-	return usb3_ep->rammap_val | PN_RAMMAP_MPKT(usb_endpoint_maxp(desc));
+	int i;
+	const u32 max_packet_array[] = {8, 16, 32, 64, 512};
+	u32 mpkt = PN_RAMMAP_MPKT(1024);
+
+	for (i = 0; i < ARRAY_SIZE(max_packet_array); i++) {
+		if (usb_endpoint_maxp(desc) <= max_packet_array[i])
+			mpkt = PN_RAMMAP_MPKT(max_packet_array[i]);
+	}
+
+	return usb3_ep->rammap_val | mpkt;
 }
 
 static int usb3_enable_pipe_n(struct renesas_usb3_ep *usb3_ep,
-- 
1.9.1
