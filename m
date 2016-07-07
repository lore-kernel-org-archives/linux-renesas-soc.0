Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:30157 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933561AbcGGIdJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 04:33:09 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	<stable@vger.kernel.org>
Subject: [PATCH/RFC 0/4] usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
Date: Thu, 7 Jul 2016 17:32:38 +0900
Message-ID: <1467880362-4844-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/next branch.
(commit id = 15e4292a2d21e9997fdb2b8c014cc461b3f268f0)

This patch set also needs an additional patch (like the end of this email)
to fix the renesas_usbhs driver for R-Car Gen3.
(I will submit this patch after v4.8-rc1 was released.)

I'm not sure this is a correct way or not. So, I added "RFC" in this patch set.
About the detail of this patch set, please refer to the commit log of
first patch ("usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c").

Yoshihiro Shimoda (4):
  usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
  usb: gadget: u_ether: add a flag to avoid skb_reserve() calling
  usb: gadget: f_ncm: add support for no_skb_reserve
  usb: renesas_usbhs: set quirk_avoids_skb_reserve if USB-DMAC is used

 drivers/usb/gadget/function/f_ncm.c    |  2 ++
 drivers/usb/gadget/function/u_ether.c  |  5 ++++-
 drivers/usb/gadget/function/u_ether.h  |  1 +
 drivers/usb/renesas_usbhs/mod_gadget.c |  2 ++
 include/linux/usb/gadget.h             | 13 +++++++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)

---
< about an additonal patch >
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Thu, 7 Jul 2016 12:47:20 +0900
Subject: [PATCH] usb: renesas_usbhs: Fix receiving data corrupt on R-Car Gen3
 with dmac

Since R-Car Gen3 SoC has the USB-DMAC, this driver should set
dparam->has_usb_dmac to 1. Otherwise, behavior of this driver and
the usb-dmac driver will be mismatch, then sometimes receiving data will
be corrupt.

Fixes: de18757e272d ("usb: renesas_usbhs: add R-Car Gen3 power control")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8fbbc2d..ac67bab 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -514,7 +514,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	if (gpio > 0)
 		dparam->enable_gpio = gpio;
 
-	if (dparam->type == USBHS_TYPE_RCAR_GEN2)
+	if (dparam->type == USBHS_TYPE_RCAR_GEN2 ||
+	    dparam->type == USBHS_TYPE_RCAR_GEN3)
 		dparam->has_usb_dmac = 1;
 
 	return info;
-- 
1.9.1
