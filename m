Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:23016 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751548AbdGSHUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2017 03:20:02 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] usb: renesas_usbhs: fix usbhsc_resume() for !USBHSF_RUNTIME_PWCTRL
Date: Wed, 19 Jul 2017 16:16:54 +0900
Message-ID: <1500448615-25287-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500448615-25287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500448615-25287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that some registers may be not initialized
after resume if the USBHSF_RUNTIME_PWCTRL is not set. Otherwise,
if a cable is not connected, the driver will not enable INTENB0.VBSE
after resume. And then, the driver cannot detect the VBUS.

Fixes: ca8a282a5373 ("usb: gadget: renesas_usbhs: add suspend/resume support")
Cc: <stable@vger.kernel.org> # v3.2+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 623c513..f0ce304 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -752,8 +752,10 @@ static int usbhsc_resume(struct device *dev)
 	struct usbhs_priv *priv = dev_get_drvdata(dev);
 	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
 
-	if (!usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL))
+	if (!usbhsc_flags_has(priv, USBHSF_RUNTIME_PWCTRL)) {
 		usbhsc_power_ctrl(priv, 1);
+		usbhs_mod_autonomy_mode(priv);
+	}
 
 	usbhs_platform_call(priv, phy_reset, pdev);
 
-- 
1.9.1
