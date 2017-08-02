Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:23329 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750742AbdHBEY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 00:24:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Fix UGCTRL2 value for R-Car Gen3
Date: Wed,  2 Aug 2017 13:21:45 +0900
Message-Id: <1501647705-11636-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The latest HW manual (Rev.0.55) shows us this UGCTRL2.VBUSSEL bit.
If the bit sets to 1, the VBUS drive is controlled by phy related
registers (called "UCOM Registers" on the manual). Since R-Car Gen3
environment will control VBUS by phy-rcar-gen3-usb2 driver,
the UGCTRL2.VBUSSEL bit should be set to 1. So, this patch fixes
the register's value. Otherwise, even if the ID pin indicates to
peripheral, the R-Car will output USBn_PWEN to 1 when a host driver
is running.

Fixes: de18757e272d ("usb: renesas_usbhs: add R-Car Gen3 power control"
Cc: <stable@vger.kernel.org> # v4.6+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest Felipe's usb.git / testing/fixes branch
(the commit id = 0539cab2ed9e52a57182a909e02db545e8fb1a38).

 drivers/usb/renesas_usbhs/rcar3.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index d544b33..02b67ab 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -20,9 +20,13 @@
 /* Low Power Status register (LPSTS) */
 #define LPSTS_SUSPM	0x4000
 
-/* USB General control register 2 (UGCTRL2), bit[31:6] should be 0 */
+/*
+ * USB General control register 2 (UGCTRL2)
+ * Remarks: bit[31:11] and bit[9:6] should be 0
+ */
 #define UGCTRL2_RESERVED_3	0x00000001	/* bit[3:0] should be B'0001 */
 #define UGCTRL2_USB0SEL_OTG	0x00000030
+#define UGCTRL2_VBUSSEL		0x00000400
 
 static void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
 {
@@ -34,7 +38,8 @@ static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 {
 	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
 
-	usbhs_write32(priv, UGCTRL2, UGCTRL2_RESERVED_3 | UGCTRL2_USB0SEL_OTG);
+	usbhs_write32(priv, UGCTRL2, UGCTRL2_RESERVED_3 | UGCTRL2_USB0SEL_OTG |
+		      UGCTRL2_VBUSSEL);
 
 	if (enable) {
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
-- 
1.9.1
