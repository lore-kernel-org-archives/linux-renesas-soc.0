Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:31244 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753382AbcHXI41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 04:56:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] usb: host: xhci: rcar: add a new firmware version for r8a7796
Date: Wed, 24 Aug 2016 17:52:39 +0900
Message-ID: <1472028762-6640-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds a new firmware version "V3" for r8a7796. This patch also
revises the explanation of each version's capability using a table.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-rcar.c | 17 ++++++++++++-----
 drivers/usb/host/xhci-rcar.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 0e4535e..723f575 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -19,13 +19,20 @@
 #include "xhci-rcar.h"
 
 /*
-* - The V2 firmware is possible to use on R-Car Gen2. However, the V2 causes
-*   performance degradation. So, this driver continues to use the V1 if R-Car
-*   Gen2.
-* - The V1 firmware is impossible to use on R-Car Gen3.
-*/
+ *	   |	Gen2	r8a7795	r8a7796
+ *	---+----------------------------
+ *	V3 |	note1	NG	OK
+ *	V2 |	note1	OK	note1
+ *	V1 |	OK	NG	NG
+ *
+ * Gen2: r8a7790, r8a7791 and r8a7793
+ * OK: This firmware version works correctly on such SoC(s)
+ * NG: This firmware version is impossible to use on such SoC(s)
+ * note1: This firmware version causes performance degradation.
+ */
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V1);
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V2);
+MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
 
 /*** Register Offset ***/
 #define RCAR_USB3_INT_ENA	0x224	/* Interrupt Enable */
diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index 2941a25..d2ffe20 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -13,6 +13,7 @@
 
 #define XHCI_RCAR_FIRMWARE_NAME_V1	"r8a779x_usb3_v1.dlmem"
 #define XHCI_RCAR_FIRMWARE_NAME_V2	"r8a779x_usb3_v2.dlmem"
+#define XHCI_RCAR_FIRMWARE_NAME_V3	"r8a779x_usb3_v3.dlmem"
 
 #if IS_ENABLED(CONFIG_USB_XHCI_RCAR)
 void xhci_rcar_start(struct usb_hcd *hcd);
-- 
1.9.1
