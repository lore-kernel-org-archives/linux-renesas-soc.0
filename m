Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:37227 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751812AbeDJFjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 01:39:11 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/6] usb: gadget: udc: renesas_usb3: should remove debugfs
Date: Tue, 10 Apr 2018 14:38:50 +0900
Message-Id: <1523338734-20474-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that this driver doesn't remove its debugfs.

Fixes: 43ba968b00ea ("usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode")
Cc: <stable@vger.kernel.org> # v4.14+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
Changes from v1:
 - Add Reviewed-by.

 drivers/usb/gadget/udc/renesas_usb3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 78a12a5..1c54a77 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -333,6 +333,7 @@ struct renesas_usb3 {
 	struct extcon_dev *extcon;
 	struct work_struct extcon_work;
 	struct phy *phy;
+	struct dentry *dentry;
 
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
@@ -2393,8 +2394,12 @@ static void renesas_usb3_debugfs_init(struct renesas_usb3 *usb3,
 
 	file = debugfs_create_file("b_device", 0644, root, usb3,
 				   &renesas_usb3_b_device_fops);
-	if (!file)
+	if (!file) {
 		dev_info(dev, "%s: Can't create debugfs mode\n", __func__);
+		debugfs_remove_recursive(root);
+	} else {
+		usb3->dentry = root;
+	}
 }
 
 /*------- platform_driver ------------------------------------------------*/
@@ -2402,6 +2407,7 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3 = platform_get_drvdata(pdev);
 
+	debugfs_remove_recursive(usb3->dentry);
 	device_remove_file(&pdev->dev, &dev_attr_role);
 
 	usb_del_gadget_udc(&usb3->gadget);
-- 
1.9.1
