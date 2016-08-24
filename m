Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14188 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753724AbcHXI41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 04:56:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] usb: host: xhci: rcar: add a macro XHCI_PLAT_RENESAS_RCAR_PRIV
Date: Wed, 24 Aug 2016 17:52:40 +0900
Message-ID: <1472028762-6640-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds a new macro "XHCI_PLAT_RENESAS_RCAR_PRIV" to make
struct xhci_plat_priv data for R-Car SoCs easily.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-rcar.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index d2ffe20..78379e3 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -28,4 +28,12 @@ static inline int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 	return 0;
 }
 #endif
+
+#define XHCI_PLAT_RENESAS_RCAR_PRIV(soc, firmware)	\
+static const struct xhci_plat_priv xhci_plat_renesas_rcar_##soc = {	\
+	.firmware_name = firmware,			\
+	.init_quirk = xhci_rcar_init_quirk,		\
+	.plat_start = xhci_rcar_start,			\
+}
+
 #endif /* _XHCI_RCAR_H */
-- 
1.9.1
