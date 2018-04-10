Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:17857 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751851AbeDJFjM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 01:39:12 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/6] usb: gadget: udc: renesas_usb3: should call devm_phy_get() before add udc
Date: Tue, 10 Apr 2018 14:38:52 +0900
Message-Id: <1523338734-20474-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver cannot call phy_init()
if a gadget driver is alreadly loaded because usb_add_gadget_udc()
might call renesas_usb3_start() via .udc_start.
This patch also revises the typo (s/an optional/optional/).

Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for generic phy")
Cc: <stable@vger.kernel.org> # v4.15+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
Changes from v1:
 - Add Reviewed-by.
 - Revise typo in the comment.

 drivers/usb/gadget/udc/renesas_usb3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 738b734..233bc04 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2632,6 +2632,14 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_alloc_prd;
 
+	/*
+	 * This is optional. So, if this driver cannot get a phy,
+	 * this driver will not handle a phy anymore.
+	 */
+	usb3->phy = devm_phy_get(&pdev->dev, "usb");
+	if (IS_ERR(usb3->phy))
+		usb3->phy = NULL;
+
 	pm_runtime_enable(&pdev->dev);
 	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
 	if (ret < 0)
@@ -2641,14 +2649,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
-	/*
-	 * This is an optional. So, if this driver cannot get a phy,
-	 * this driver will not handle a phy anymore.
-	 */
-	usb3->phy = devm_phy_get(&pdev->dev, "usb");
-	if (IS_ERR(usb3->phy))
-		usb3->phy = NULL;
-
 	usb3->workaround_for_vbus = priv->workaround_for_vbus;
 
 	renesas_usb3_debugfs_init(usb3, &pdev->dev);
-- 
1.9.1
