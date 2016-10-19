Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:28343 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S942706AbcJSOhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:37:36 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] usb: host: xhci: plat: add support for Renesas r8a7796 SoC
Date: Wed, 19 Oct 2016 17:50:15 +0900
Message-ID: <1476867015-30554-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1476867015-30554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1476867015-30554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for Renesas r8a7796 SoC. This SoC is not
compatible with r8a7795 because using firmware version differs.

Since the "V2" firmware can be used on both r8a7795 (es1.x) and r8a7796,
the "renesas,rcar-gen3-xhci" keeps to use the "V2" for now.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 drivers/usb/host/xhci-plat.c                       | 9 +++++++++
 drivers/usb/host/xhci-rcar.c                       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 966885c..0b7d857 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -11,6 +11,7 @@ Required properties:
     - "renesas,xhci-r8a7791" for r8a7791 SoC
     - "renesas,xhci-r8a7793" for r8a7793 SoC
     - "renesas,xhci-r8a7795" for r8a7795 SoC
+    - "renesas,xhci-r8a7796" for r8a7796 SoC
     - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 compatible device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible device
     - "xhci-platform" (deprecated)
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ed56bf9..ddfab30 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -100,6 +100,12 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 	.plat_start = xhci_rcar_start,
 };
 
+static const struct xhci_plat_priv xhci_plat_renesas_rcar_r8a7796 = {
+	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
+	.init_quirk = xhci_rcar_init_quirk,
+	.plat_start = xhci_rcar_start,
+};
+
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
 		.compatible = "generic-xhci",
@@ -124,6 +130,9 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 		.compatible = "renesas,xhci-r8a7795",
 		.data = &xhci_plat_renesas_rcar_gen3,
 	}, {
+		.compatible = "renesas,xhci-r8a7796",
+		.data = &xhci_plat_renesas_rcar_r8a7796,
+	}, {
 		.compatible = "renesas,rcar-gen2-xhci",
 		.data = &xhci_plat_renesas_rcar_gen2,
 	}, {
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index ced4a76..d28df38 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -95,6 +95,7 @@ static int xhci_rcar_is_gen3(struct device *dev)
 	struct device_node *node = dev->of_node;
 
 	return of_device_is_compatible(node, "renesas,xhci-r8a7795") ||
+		of_device_is_compatible(node, "renesas,xhci-r8a7796") ||
 		of_device_is_compatible(node, "renesas,rcar-gen3-xhci");
 }
 
-- 
1.9.1
