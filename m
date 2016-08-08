Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:54215 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752014AbcHHMyb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 08:54:31 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	"Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: renesas_usbhs: Fix receiving data corrupt on R-Car Gen3 with dmac
Date: Mon, 8 Aug 2016 21:50:51 +0900
Message-ID: <1470660653-21743-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

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
