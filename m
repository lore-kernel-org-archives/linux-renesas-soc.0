Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:23102 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756940AbcH2JB2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 05:01:28 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: fix clearing the {BRDY,BEMP}STS condition
Date: Mon, 29 Aug 2016 18:00:38 +0900
Message-ID: <1472461238-27304-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The previous driver is possible to stop the transfer wrongly.
For example:
 1) An interrupt happens, but not BRDY interruption.
 2) Read INTSTS0. And than state->intsts0 is not set to BRDY.
 3) BRDY is set to 1 here.
 4) Read BRDYSTS.
 5) Clear the BRDYSTS. And then. the BRDY is cleared wrongly.

Remarks:
 - The INTSTS0.BRDY is read only.
  - If any bits of BRDYSTS are set to 1, the BRDY is set to 1.
  - If BRDYSTS is 0, the BRDY is set to 0.

So, this patch adds condition to avoid such situation. (And about
NRDYSTS, this is not used for now. But, avoiding any side effects,
this patch doesn't touch it.)

Fixes: d5c6a1e024dd ("usb: renesas_usbhs: fixup interrupt status clear method")
Cc: <stable@vger.kernel.org> # v3.8+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index d4be5d5..28965ef 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -282,9 +282,16 @@ static irqreturn_t usbhs_interrupt(int irq, void *data)
 	if (usbhs_mod_is_host(priv))
 		usbhs_write(priv, INTSTS1, ~irq_state.intsts1 & INTSTS1_MAGIC);
 
-	usbhs_write(priv, BRDYSTS, ~irq_state.brdysts);
+	/*
+	 * The driver should not clear the xxxSTS after the line of
+	 * "call irq callback functions" because each "if" statement is
+	 * possible to call the callback function for avoiding any side effects.
+	 */
+	if (irq_state.intsts0 & BRDY)
+		usbhs_write(priv, BRDYSTS, ~irq_state.brdysts);
 	usbhs_write(priv, NRDYSTS, ~irq_state.nrdysts);
-	usbhs_write(priv, BEMPSTS, ~irq_state.bempsts);
+	if (irq_state.intsts0 & BEMP)
+		usbhs_write(priv, BEMPSTS, ~irq_state.bempsts);
 
 	/*
 	 * call irq callback functions
-- 
1.9.1
