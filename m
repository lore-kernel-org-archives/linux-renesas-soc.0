Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:46636 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751704AbcFURxM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 13:53:12 -0400
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: renesas_usbhs: make usbhs_write32() static
Date: Tue, 21 Jun 2016 18:52:54 +0100
Message-Id: <1466531574-3096-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The usbhs_write32 function is not used outside of the rcar3.c
file, so fix the following sparse warning by making it static:

drivers/usb/renesas_usbhs/rcar3.c:26:6: warning: symbol 'usbhs_write32' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/usb/renesas_usbhs/rcar3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 38b01f2..1d70add 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -23,7 +23,7 @@
 #define UGCTRL2_RESERVED_3	0x00000001	/* bit[3:0] should be B'0001 */
 #define UGCTRL2_USB0SEL_OTG	0x00000030
 
-void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
+static void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
 {
 	iowrite32(data, priv->base + reg);
 }
-- 
2.8.1
