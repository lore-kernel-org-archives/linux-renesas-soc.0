Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:47510 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751862AbeDJFjM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 01:39:12 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/6] usb: gadget: udc: renesas_usb3: should call pm_runtime_enable() before add udc
Date: Tue, 10 Apr 2018 14:38:51 +0900
Message-Id: <1523338734-20474-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver causes panic if a gadget
driver is already loaded because usb_add_gadget_udc() might call
renesas_usb3_start() via .udc_start, and then pm_runtime_get_sync()
in renesas_usb3_start() doesn't work correctly.
Note that the usb3_to_dev() macro should not be called at this timing
because the macro uses the gadget structure.

Fixes: cf06df3fae28 ("usb: gadget: udc: renesas_usb3: move pm_runtime_{en,dis}able()")
Cc: <stable@vger.kernel.org> # v4.15+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
Changes from v1:
 - Add Reviewed-by.

 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 1c54a77..738b734 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2632,6 +2632,7 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_alloc_prd;
 
+	pm_runtime_enable(&pdev->dev);
 	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
 	if (ret < 0)
 		goto err_add_udc;
@@ -2653,7 +2654,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	renesas_usb3_debugfs_init(usb3, &pdev->dev);
 
 	dev_info(&pdev->dev, "probed%s\n", usb3->phy ? " with phy" : "");
-	pm_runtime_enable(usb3_to_dev(usb3));
 
 	return 0;
 
-- 
1.9.1
