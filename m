Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:20847 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752542AbcEaMra (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 08:47:30 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <kishon@ti.com>
CC: <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] phy: rcar-gen3-usb2: fix unexpected repeat interrupts of VBUS change
Date: Tue, 31 May 2016 21:47:17 +0900
Message-ID: <1464698837-7556-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the driver is possible to cause
unexpected repeat interrupts if a board condition is wrong
(e.g. even if the ID pin is as function, a board supplies the VBUS.)

The reason why unexpected repeat interrupts happen is:
 1) The driver changed the mode to function if it detected the ID pin
    is high and the VBUS is high.
 2) After the driver changed function mode, it disabled the "VBUS control"
    feature. Then, the VBUS signal will be low.
 3) Since the VBUS change interruption happened, the driver checked
    the ID pin and VBUS.
 4) Since VBUS was low, the driver changed the mode to host and enabled
    the "VBUS control" feature. Then the VBUS signal will be high.
 5) Since the VBUS change interruption happened, the driver did 1) above.

So, this patch modified the condition in rcar_gen3_device_recognition()
to check the ID pin only.

Fixes: 1114e2d (phy: rcar-gen3-usb2: change the mode to OTG on the combined channel)
Cc: <stable@vger.kernel.org> # v4.5+
Reported-by: Simon Horman <horms@verge.net.au>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/phy-rcar-gen3-usb2.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index 76bb88f..4be3f5d 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -144,12 +144,6 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
 	extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
 }
 
-static bool rcar_gen3_check_vbus(struct rcar_gen3_chan *ch)
-{
-	return !!(readl(ch->base + USB2_ADPCTRL) &
-		  USB2_ADPCTRL_OTGSESSVLD);
-}
-
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
@@ -157,13 +151,7 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 
 static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
 {
-	bool is_host = true;
-
-	/* B-device? */
-	if (rcar_gen3_check_id(ch) && rcar_gen3_check_vbus(ch))
-		is_host = false;
-
-	if (is_host)
+	if (!rcar_gen3_check_id(ch))
 		rcar_gen3_init_for_host(ch);
 	else
 		rcar_gen3_init_for_peri(ch);
-- 
1.9.1
