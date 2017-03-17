Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:31330 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750999AbdCQK26 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 06:28:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: host: xhci-plat: add resume_quirk()
Date: Fri, 17 Mar 2017 19:02:34 +0900
Message-ID: <1489744955-29553-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds resume_quirk() to do platform specific process in
resume timing.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 15 +++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3528de3..ceb7413 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -54,6 +54,16 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
 	return priv->init_quirk(hcd);
 }
 
+static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (!priv->resume_quirk)
+		return 0;
+
+	return priv->resume_quirk(hcd);
+}
+
 static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	/*
@@ -328,10 +338,15 @@ static int xhci_plat_resume(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
 
 	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
 		clk_prepare_enable(xhci->clk);
 
+	ret = xhci_priv_resume_quirk(hcd);
+	if (ret)
+		return ret;
+
 	return xhci_resume(xhci, 0);
 }
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 9af0cb4..29b2278 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -17,6 +17,7 @@ struct xhci_plat_priv {
 	const char *firmware_name;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
+	int (*resume_quirk)(struct usb_hcd *);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-- 
1.9.1
