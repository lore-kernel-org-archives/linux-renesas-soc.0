Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:59416 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750885AbdCQK25 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 06:28:57 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: host: xhci-plat: set resume_quirk() for R-Car controllers
Date: Fri, 17 Mar 2017 19:02:35 +0900
Message-ID: <1489744955-29553-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch sets resume_quirk() for R-Car controllers to re-download
the firmware in resume timing. Otherwise, if the controller's power
is down in suspend timing, the firmware in the controller goes away,
and then the controller doesn't work after resume.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c |  3 +++
 drivers/usb/host/xhci-rcar.c | 11 +++++++++++
 drivers/usb/host/xhci-rcar.h |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ceb7413..a285595 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -102,18 +102,21 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
 	.init_quirk = xhci_rcar_init_quirk,
 	.plat_start = xhci_rcar_start,
+	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
 	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V2,
 	.init_quirk = xhci_rcar_init_quirk,
 	.plat_start = xhci_rcar_start,
+	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_r8a7796 = {
 	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
 	.init_quirk = xhci_rcar_init_quirk,
 	.plat_start = xhci_rcar_start,
+	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
 static const struct of_device_id usb_xhci_of_match[] = {
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index d28df38..0727822 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -198,3 +198,14 @@ int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 
 	return xhci_rcar_download_firmware(hcd);
 }
+
+int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
+{
+	int ret;
+
+	ret = xhci_rcar_download_firmware(hcd);
+	if (!ret)
+		xhci_rcar_start(hcd);
+
+	return ret;
+}
diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index d2ffe20..d247951 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -18,6 +18,7 @@
 #if IS_ENABLED(CONFIG_USB_XHCI_RCAR)
 void xhci_rcar_start(struct usb_hcd *hcd);
 int xhci_rcar_init_quirk(struct usb_hcd *hcd);
+int xhci_rcar_resume_quirk(struct usb_hcd *hcd);
 #else
 static inline void xhci_rcar_start(struct usb_hcd *hcd)
 {
@@ -27,5 +28,10 @@ static inline int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 {
 	return 0;
 }
+
+static inline int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
+{
+	return 0;
+}
 #endif
 #endif /* _XHCI_RCAR_H */
-- 
1.9.1
