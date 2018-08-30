Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:44764 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728087AbeH3O4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 10:56:20 -0400
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
Subject: [PATCH 1/3] usb: renesas_usbhs: simplify usbhs_status_get_device_state()
Date: Thu, 30 Aug 2018 12:54:01 +0200
Message-ID: <20180830105403.17964-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Similar to usbhs_status_get_ctrl_stage(), *_get_device_state() is not
supposed to return any error code since its return value is the DVSQ
bitfield of the INTSTS0 register. According to SoC HW manual rev1.00,
every single value of DVSQ[2:0] is valid and none is an error:

----8<----
Device State
000: Powered state
001: Default state
010: Address state
011: Configuration state
1xx: Suspended state
----8<----

Hence, simplify the function body. The motivation behind dropping the
switch/case construct is being able to implement reading the suspended
state. The latter (based on the above DVSQ[2:0] description) doesn't
have a unique value, but is rather a list of states (which makes
switch/case less suitable for reading/validating it):

100: (Suspended) Powered state
101: (Suspended) Default state
110: (Suspended) Address state
111: (Suspended) Configuration state

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/usb/renesas_usbhs/mod.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index 28965ef4f824..585568279174 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -179,17 +179,7 @@ void usbhs_mod_remove(struct usbhs_priv *priv)
  */
 int usbhs_status_get_device_state(struct usbhs_irq_state *irq_state)
 {
-	int state = irq_state->intsts0 & DVSQ_MASK;
-
-	switch (state) {
-	case POWER_STATE:
-	case DEFAULT_STATE:
-	case ADDRESS_STATE:
-	case CONFIGURATION_STATE:
-		return state;
-	}
-
-	return -EIO;
+	return (int)irq_state->intsts0 & DVSQ_MASK;
 }
 
 int usbhs_status_get_ctrl_stage(struct usbhs_irq_state *irq_state)
-- 
2.18.0
