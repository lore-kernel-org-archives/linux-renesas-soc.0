Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:62608 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753888AbcHXI41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 04:56:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] usb: host: xhci: plat: add support for Renesas r8a7796 SoC
Date: Wed, 24 Aug 2016 17:52:42 +0900
Message-ID: <1472028762-6640-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for Renesas r8a7796 SoC. This SoC is not
compatible with r8a7795 because using firmware version differs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 drivers/usb/host/xhci-plat.c                       | 4 ++++
 drivers/usb/host/xhci-rcar.c                       | 1 +
 3 files changed, 6 insertions(+)

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
index c1a6b5a..3dc4bc4d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -90,6 +90,7 @@ static const struct xhci_plat_priv xhci_plat_marvell_armada = {
 
 XHCI_PLAT_RENESAS_RCAR_PRIV(gen2, XHCI_RCAR_FIRMWARE_NAME_V1);
 XHCI_PLAT_RENESAS_RCAR_PRIV(gen3, XHCI_RCAR_FIRMWARE_NAME_V2);
+XHCI_PLAT_RENESAS_RCAR_PRIV(r8a7796, XHCI_RCAR_FIRMWARE_NAME_V3);
 
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
@@ -115,6 +116,9 @@ static const struct of_device_id usb_xhci_of_match[] = {
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
index 723f575..49f7698 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -99,6 +99,7 @@ static int xhci_rcar_is_gen3(struct device *dev)
 	struct device_node *node = dev->of_node;
 
 	return of_device_is_compatible(node, "renesas,xhci-r8a7795") ||
+	       of_device_is_compatible(node, "renesas,xhci-r8a7796") ||
 		of_device_is_compatible(node, "renesas,rcar-gen3-xhci");
 }
 
-- 
1.9.1
