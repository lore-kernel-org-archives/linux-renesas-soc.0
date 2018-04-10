Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:37227 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751892AbeDJFjM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 01:39:12 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 5/6] usb: gadget: udc: renesas_usb3: should fail if devm_phy_get() returns error
Date: Tue, 10 Apr 2018 14:38:53 +0900
Message-Id: <1523338734-20474-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver ignores errors other than
the non-existence of the device, f.e. a memory allocation failure
in devm_phy_get(). So, this patch replaces devm_phy_get() with
devm_phy_optional_get().

Reported-by: Simon Horman <horms+renesas@verge.net.au>
Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for generic phy")
Cc: <stable@vger.kernel.org> # v4.15+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Remarks:
 - A new file in v2

 drivers/usb/gadget/udc/renesas_usb3.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 233bc04..0e70163 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2636,9 +2636,11 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	 * This is optional. So, if this driver cannot get a phy,
 	 * this driver will not handle a phy anymore.
 	 */
-	usb3->phy = devm_phy_get(&pdev->dev, "usb");
-	if (IS_ERR(usb3->phy))
-		usb3->phy = NULL;
+	usb3->phy = devm_phy_optional_get(&pdev->dev, "usb");
+	if (IS_ERR(usb3->phy)) {
+		ret = PTR_ERR(usb3->phy);
+		goto err_add_udc;
+	}
 
 	pm_runtime_enable(&pdev->dev);
 	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
-- 
1.9.1
