Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40250 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751890AbeAaMCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 07:02:55 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: host: xhci-hub: avoid xhci_warn() when PORT_PE was clear.
Date: Wed, 31 Jan 2018 20:58:13 +0900
Message-Id: <1517399893-24883-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The commit 37be66767e3c ("usb: hub: Fix auto-remount of safely removed
or ejected USB-3 devices") causes the following error when we
disconnected a usb 3.0 device on some environment (e.g. R-Car H3):

 xhci-hcd ee000000.usb: Cannot set link state.
 usb usb8-port1: cannot disable (err = -32)

According to Figure 35 in xhci spec, the PED (PORT_PE) will
be set to 0 after the usb3 root hub enters "Error" or "Disconnected"
state. So, this patch avoids the error messages to return -ENODEV when
asked to set the USB_PORT_FEAT_LINK_STATE feature to U3 and PORT_PE
was clear.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-hub.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 2a90229..7e95f9e 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1229,8 +1229,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * port link state above '3' (U3) and the port
 			 * must be enabled.
 			 */
-			if ((temp & PORT_PE) == 0 ||
-				(link_state > USB_SS_PORT_LS_U3)) {
+			if ((temp & PORT_PE) == 0) {
+				retval = -ENODEV;
+				break;
+			}
+			if (link_state > USB_SS_PORT_LS_U3) {
 				xhci_warn(xhci, "Cannot set link state.\n");
 				goto error;
 			}
-- 
1.9.1
