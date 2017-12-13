Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:24870 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750748AbdLMGvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 01:51:33 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel
Date: Wed, 13 Dec 2017 15:47:00 +0900
Message-Id: <1513147620-20925-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds extcon notifier callback to set the mode of
host/peripheral by using extcon state (e.g phy-rcar-gen3-usb2) for
non-otg channel (e.g. R-Car D3).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c |  9 +++++++++
 drivers/usb/renesas_usbhs/common.h |  1 +
 drivers/usb/renesas_usbhs/rcar3.c  | 11 +++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 56079bb..c5289b3 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -581,6 +581,15 @@ static int usbhs_probe(struct platform_device *pdev)
 		break;
 	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
 		priv->pfunc = usbhs_rcar3_with_pll_ops;
+		if (!IS_ERR_OR_NULL(priv->edev)) {
+			priv->nb.notifier_call = priv->pfunc.notifier;
+			ret = devm_extcon_register_notifier(&pdev->dev,
+							    priv->edev,
+							    EXTCON_USB_HOST,
+							    &priv->nb);
+			if (ret < 0)
+				dev_err(&pdev->dev, "no notifier registered\n");
+		}
 		break;
 	default:
 		if (!info->platform_callback.get_id) {
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 6479778..c9747f0 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -249,6 +249,7 @@ struct usbhs_priv {
 	struct platform_device *pdev;
 
 	struct extcon_dev *edev;
+	struct notifier_block nb;
 
 	spinlock_t		lock;
 
diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index b9a8453..d657309 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -112,6 +112,16 @@ static int usbhs_rcar3_get_id(struct platform_device *pdev)
 	return USBHS_GADGET;
 }
 
+int usbhs_rcar3_notifier(struct notifier_block *nb, unsigned long event,
+			 void *data)
+{
+	struct usbhs_priv *priv = container_of(nb, struct usbhs_priv, nb);
+
+	usbhs_rcar3_set_usbsel(priv, !!event);
+
+	return NOTIFY_DONE;
+}
+
 const struct renesas_usbhs_platform_callback usbhs_rcar3_ops = {
 	.power_ctrl = usbhs_rcar3_power_ctrl,
 	.get_id = usbhs_rcar3_get_id,
@@ -120,4 +130,5 @@ static int usbhs_rcar3_get_id(struct platform_device *pdev)
 const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops = {
 	.power_ctrl = usbhs_rcar3_power_and_pll_ctrl,
 	.get_id = usbhs_rcar3_get_id,
+	.notifier = usbhs_rcar3_notifier,
 };
-- 
1.9.1
