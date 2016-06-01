Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:42990 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757336AbcFAGo7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 02:44:59 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] usb: host: xhci: plat: add ->quirks value for platform-specific
Date: Wed, 1 Jun 2016 15:44:42 +0900
Message-ID: <1464763483-6224-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds quirks in struct xhci_plat_priv to set xhci->quirks
for platform-specific.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 9af0cb4..c652f33 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -17,6 +17,7 @@ struct xhci_plat_priv {
 	const char *firmware_name;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
+	unsigned int quirks;
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-- 
1.9.1
