Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:44777 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728087AbeH3O42 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 10:56:28 -0400
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-renesas-soc@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 2/3] usb: renesas_usbhs: enable DVSE interrupt
Date: Thu, 30 Aug 2018 12:54:02 +0200
Message-ID: <20180830105403.17964-2-erosca@de.adit-jv.com>
In-Reply-To: <20180830105403.17964-1-erosca@de.adit-jv.com>
References: <20180830105403.17964-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit [1] enabled the possibility of checking the DVST (Device State
Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
the irq_dev_state() handler if the DVST bit is set. But neither
commit [1] nor commit [2] actually enabled the DVSE (Device State
Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
Register 0). As a consequence, irq_dev_state() handler is getting
called as a side effect of other (non-DVSE) interrupts being fired,
which definitely can't be relied upon, if DVST notifications are of
any value.

Why this doesn't hurt is because usbhsg_irq_dev_state() currently
doesn't do much except of a dev_dbg(). Once more work is added to
the handler (e.g. detecting device "Suspended" state and notifying
other USB gadget components about it), enabling DVSE becomes a hard
requirement. Do it in a standalone commit for better visibility and
clear explanation.

[1] f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
[2] 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/usb/renesas_usbhs/mod.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 585568279174..a8ed3c7e19ca 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -348,10 +348,6 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 	 *	usbhs_interrupt
 	 */
 
-	/*
-	 * it don't enable DVSE (intenb0) here
-	 * but "mod->irq_dev_state" will be called.
-	 */
 	if (info->irq_vbus)
 		intenb0 |= VBSE;
 
@@ -362,6 +358,9 @@ void usbhs_irq_callback_update(struct usbhs_priv *priv, struct usbhs_mod *mod)
 		if (mod->irq_ctrl_stage)
 			intenb0 |= CTRE;
 
+		if (mod->irq_dev_state)
+			intenb0 |= DVSE;
+
 		if (mod->irq_empty && mod->irq_bempsts) {
 			usbhs_write(priv, BEMPENB, mod->irq_bempsts);
 			intenb0 |= BEMPE;
-- 
2.18.0
