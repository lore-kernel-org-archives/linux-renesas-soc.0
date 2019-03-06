Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEE9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 09:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F063C21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 09:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfCFJNb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 04:13:31 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:9706 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729307AbfCFJNa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 04:13:30 -0500
X-IronPort-AV: E=Sophos;i="5.58,447,1544454000"; 
   d="scan'208";a="9391012"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2019 18:13:28 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB09B4209848;
        Wed,  6 Mar 2019 18:13:25 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] usb: gadget: udc: renesas_usb3: use extcon framework to receive connect/disconnect
Date:   Wed,  6 Mar 2019 09:07:21 +0000
Message-Id: <1551863246-11656-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2E cat874 board is capable of detecting cable connect and disconnect
events. Add support for renesas_usb3 to receive connect and disconnect
notification using extcon framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 115 +++++++++++++++++++++++++++++-----
 1 file changed, 99 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7dc2485..2c69d5d 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -351,6 +351,11 @@ struct renesas_usb3 {
 	int disabled_count;
 
 	struct usb_request *ep0_req;
+
+	struct extcon_dev *edev;
+	struct notifier_block ufp_nb;
+	struct notifier_block dfp_nb;
+
 	u16 test_mode;
 	u8 ep0_buf[USB3_EP0_BUF_SIZE];
 	bool softconnect;
@@ -644,22 +649,6 @@ static void usb3_disconnect(struct renesas_usb3 *usb3)
 		usb3->driver->disconnect(&usb3->gadget);
 }
 
-static void usb3_check_vbus(struct renesas_usb3 *usb3)
-{
-	if (usb3->workaround_for_vbus) {
-		usb3_connect(usb3);
-	} else {
-		usb3->extcon_usb = !!(usb3_read(usb3, USB3_USB_STA) &
-							USB_STA_VBUS_STA);
-		if (usb3->extcon_usb)
-			usb3_connect(usb3);
-		else
-			usb3_disconnect(usb3);
-
-		schedule_work(&usb3->extcon_work);
-	}
-}
-
 static void renesas_usb3_role_work(struct work_struct *work)
 {
 	struct renesas_usb3 *usb3 =
@@ -724,6 +713,32 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
 	schedule_work(&usb3->extcon_work);
 }
 
+static void usb3_check_vbus(struct renesas_usb3 *usb3)
+{
+	if (usb3->workaround_for_vbus) {
+		if (usb3->edev) {
+			if (extcon_get_state(usb3->edev, EXTCON_USB) == true) {
+				usb3->forced_b_device = true;
+				usb3->start_to_connect = true;
+				usb3_disconnect(usb3);
+				usb3_check_id(usb3);
+			} else if (extcon_get_state(usb3->edev,
+						EXTCON_USB_HOST) == false)
+				usb3_vbus_out(usb3, false);
+		} else
+			usb3_connect(usb3);
+	} else {
+		usb3->extcon_usb = !!(usb3_read(usb3, USB3_USB_STA) &
+							USB_STA_VBUS_STA);
+		if (usb3->extcon_usb)
+			usb3_connect(usb3);
+		else
+			usb3_disconnect(usb3);
+
+		schedule_work(&usb3->extcon_work);
+	}
+}
+
 static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 {
 	usb3_init_axi_bridge(usb3);
@@ -2656,6 +2671,47 @@ static const struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
 	.allow_userspace_control = true,
 };
 
+static int renesas_usb3_ufp_notifier(struct notifier_block *nb,
+					unsigned long event, void *ptr)
+{
+	struct renesas_usb3 *usb3 = container_of(nb,
+					struct renesas_usb3, ufp_nb);
+
+	usb3->start_to_connect = false;
+	if (event && usb3->driver) {
+		usb3->forced_b_device = true;
+		usb3->start_to_connect = true;
+	}
+
+	if (usb3->driver) {
+		usb3_disconnect(usb3);
+		usb3_check_id(usb3);
+	}
+
+	usb3_vbus_out(usb3, false);
+	dev_dbg(usb3_to_dev(usb3), "ufp_notifier event=%ld", event);
+
+	return NOTIFY_DONE;
+}
+
+static int renesas_usb3_dfp_notifier(struct notifier_block *nb,
+					unsigned long event, void *ptr)
+{
+	struct renesas_usb3 *usb3 = container_of(nb,
+					struct renesas_usb3, dfp_nb);
+
+	if (event) {
+		usb3->forced_b_device = false;
+		usb3_disconnect(usb3);
+		usb3_check_id(usb3);
+	} else
+		usb3_vbus_out(usb3, false);
+
+	dev_dbg(usb3_to_dev(usb3), "dfp_notifier event=%ld", event);
+
+	return NOTIFY_DONE;
+}
+
 static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
@@ -2703,6 +2759,33 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		return ret;
 
 	INIT_WORK(&usb3->extcon_work, renesas_usb3_extcon_work);
+
+	if (priv->workaround_for_vbus &&
+			of_property_read_bool(pdev->dev.of_node, "extcon")) {
+		usb3->edev = extcon_get_edev_by_phandle(&pdev->dev, 0);
+		if (IS_ERR(usb3->edev))
+			return PTR_ERR(usb3->edev);
+
+		usb3->ufp_nb.notifier_call = renesas_usb3_ufp_notifier;
+		ret = devm_extcon_register_notifier(&pdev->dev, usb3->edev,
+						EXTCON_USB, &usb3->ufp_nb);
+		if (ret < 0)
+			dev_dbg(&pdev->dev, "USB register notifier failed\n");
+
+		usb3->dfp_nb.notifier_call = renesas_usb3_dfp_notifier;
+		ret = devm_extcon_register_notifier(&pdev->dev, usb3->edev,
+						EXTCON_USB_HOST, &usb3->dfp_nb);
+		if (ret < 0)
+			dev_dbg(&pdev->dev,
+					"USB-HOST register notifier failed\n");
+		if (extcon_get_state(usb3->edev, EXTCON_USB) == true) {
+			usb3->forced_b_device = true;
+			usb3->start_to_connect = true;
+		} else	if (extcon_get_state(usb3->edev,
+						 EXTCON_USB_HOST) == false)
+			usb3_vbus_out(usb3, false);
+	}
+
 	usb3->extcon = devm_extcon_dev_allocate(&pdev->dev, renesas_usb3_cable);
 	if (IS_ERR(usb3->extcon))
 		return PTR_ERR(usb3->extcon);
-- 
2.7.4

