Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:26241 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751171AbcEFGU3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 6 May 2016 02:20:29 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<stable@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3] usb: host: xhci-rcar: Avoid long wait in xhci_reset()
Date: Fri, 6 May 2016 15:20:11 +0900
Message-ID: <1462515611-6972-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The firmware of R-Car USB 3.0 host controller will control the reset.
So, if the xhci driver doesn't do firmware downloading (e.g. kernel
configuration is CONFIG_USB_XHCI_PLATFORM=y and CONFIG_USB_XHCI_RCAR
is not set), the reset of USB 3.0 host controller doesn't work
correctly. Then, the host controller will cause long wait in
xhci_reset() because the CMD_RESET bit of op_regs->command is not
cleared for 10 seconds.

So, this patch modifies the Kconfig to enable both CONFIG_USB_XHCI_PLATFORM
and CONFIG_USB_XHCI_RCAR.

Fixes: 4ac8918f3a7 (usb: host: xhci-plat: add support for the R-Car H2 and M2 xHCI controllers)
Cc: <stable@vger.kernel.org> # v3.17+

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v2:
  - Modify the Kconfig instead of xhci-rcar.h
    http://www.spinics.net/lists/linux-usb/msg139681.html
    http://www.spinics.net/lists/linux-usb/msg139722.html

 Changes from v1:
  - Revise the commit log.
    http://www.spinics.net/lists/stable/msg130007.html

 drivers/usb/host/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 3050b18..e9d4dde 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -35,6 +35,7 @@ config USB_XHCI_PCI
 
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
+	select USB_XHCI_RCAR if ARCH_RENESAS
 	---help---
 	  Adds an xHCI host driver for a generic platform device, which
 	  provides a memory space and an irq.
@@ -63,7 +64,7 @@ config USB_XHCI_MVEBU
 
 config USB_XHCI_RCAR
 	tristate "xHCI support for Renesas R-Car SoCs"
-	select USB_XHCI_PLATFORM
+	depends on USB_XHCI_PLATFORM
 	depends on ARCH_RENESAS || COMPILE_TEST
 	---help---
 	  Say 'Y' to enable the support for the xHCI host controller
-- 
1.9.1
