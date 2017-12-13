Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:38258 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750819AbdLMGvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 01:51:31 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] usb: renesas_usbhs: Add a function to write the UGCTRL2 register
Date: Wed, 13 Dec 2017 15:46:57 +0900
Message-Id: <1513147620-20925-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To cleanup the code, this patch adds a function to write the UGCTRL2
register.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/rcar3.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index c929d29..50e5fb5 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -44,13 +44,17 @@ static u32 usbhs_read32(struct usbhs_priv *priv, u32 reg)
 	return ioread32(priv->base + reg);
 }
 
+static void usbhs_rcar3_set_ugctrl2(struct usbhs_priv *priv, u32 val)
+{
+	usbhs_write32(priv, UGCTRL2, val | UGCTRL2_RESERVED_3);
+}
+
 static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 				void __iomem *base, int enable)
 {
 	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
 
-	usbhs_write32(priv, UGCTRL2, UGCTRL2_RESERVED_3 | UGCTRL2_USB0SEL_OTG |
-		      UGCTRL2_VBUSSEL);
+	usbhs_rcar3_set_ugctrl2(priv, UGCTRL2_USB0SEL_OTG | UGCTRL2_VBUSSEL);
 
 	if (enable) {
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
@@ -73,8 +77,7 @@ static int usbhs_rcar3_power_and_pll_ctrl(struct platform_device *pdev,
 
 	if (enable) {
 		usbhs_write32(priv, UGCTRL, 0);	/* release PLLRESET */
-		usbhs_write32(priv, UGCTRL2, UGCTRL2_RESERVED_3 |
-			      UGCTRL2_USB0SEL_HSUSB);
+		usbhs_rcar3_set_ugctrl2(priv, UGCTRL2_USB0SEL_HSUSB);
 
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
 		do {
-- 
1.9.1
