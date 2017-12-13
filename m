Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:38258 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750886AbdLMGvc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 01:51:32 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/4] usb: renesas_usbhs: set the mode by using extcon state for non-otg channel
Date: Wed, 13 Dec 2017 15:46:59 +0900
Message-Id: <1513147620-20925-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The usbhs_rcar3_power_and_pll_ctrl() will be used by non-otg channel
(e.g. R-Car D3) and the previous code has hardcoded as peripheral mode.
So, this patch sets the mode by using extcon state.
If the channel doesn't get any extcon devices, this driver's behavior
is the same as before.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/rcar3.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 50e5fb5..b9a8453 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -27,6 +27,7 @@
  * Remarks: bit[31:11] and bit[9:6] should be 0
  */
 #define UGCTRL2_RESERVED_3	0x00000001	/* bit[3:0] should be B'0001 */
+#define UGCTRL2_USB0SEL_EHCI	0x00000010
 #define UGCTRL2_USB0SEL_HSUSB	0x00000020
 #define UGCTRL2_USB0SEL_OTG	0x00000030
 #define UGCTRL2_VBUSSEL		0x00000400
@@ -49,6 +50,14 @@ static void usbhs_rcar3_set_ugctrl2(struct usbhs_priv *priv, u32 val)
 	usbhs_write32(priv, UGCTRL2, val | UGCTRL2_RESERVED_3);
 }
 
+static void usbhs_rcar3_set_usbsel(struct usbhs_priv *priv, bool ehci)
+{
+	if (ehci)
+		usbhs_rcar3_set_ugctrl2(priv, UGCTRL2_USB0SEL_EHCI);
+	else
+		usbhs_rcar3_set_ugctrl2(priv, UGCTRL2_USB0SEL_HSUSB);
+}
+
 static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 				void __iomem *base, int enable)
 {
@@ -74,10 +83,14 @@ static int usbhs_rcar3_power_and_pll_ctrl(struct platform_device *pdev,
 	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
 	u32 val;
 	int timeout = 1000;
+	bool is_host = false;
 
 	if (enable) {
 		usbhs_write32(priv, UGCTRL, 0);	/* release PLLRESET */
-		usbhs_rcar3_set_ugctrl2(priv, UGCTRL2_USB0SEL_HSUSB);
+		if (priv->edev)
+			is_host = extcon_get_state(priv->edev, EXTCON_USB_HOST);
+
+		usbhs_rcar3_set_usbsel(priv, is_host);
 
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
 		do {
-- 
1.9.1
