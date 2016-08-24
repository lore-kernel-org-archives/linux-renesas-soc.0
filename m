Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:52718 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753073AbcHXHqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 03:46:45 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: add a compatible string for r8a7796
Date: Wed, 24 Aug 2016 16:39:53 +0900
Message-ID: <1472024393-20956-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for r8a7796 (R-Car M3-W).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 drivers/usb/renesas_usbhs/common.c                      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index b604056..9e18e00 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -9,6 +9,7 @@ Required properties:
 	- "renesas,usbhs-r8a7793" for r8a7793 (R-Car M2-N) compatible device
 	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
+	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
 
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index ac67bab..012a37a 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -482,6 +482,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.data = (void *)USBHS_TYPE_RCAR_GEN3,
 	},
 	{
+		.compatible = "renesas,usbhs-r8a7796",
+		.data = (void *)USBHS_TYPE_RCAR_GEN3,
+	},
+	{
 		.compatible = "renesas,rcar-gen2-usbhs",
 		.data = (void *)USBHS_TYPE_RCAR_GEN2,
 	},
-- 
1.9.1
