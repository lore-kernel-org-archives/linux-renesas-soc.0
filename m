Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60608 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754578AbcK3F5q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 00:57:46 -0500
From: Chanwoo Choi <cw00.choi@samsung.com>
To: balbi@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        sre@kernel.org
Cc: Peter.Chen@nxp.com, wens@csie.org,
        yoshihiro.shimoda.uh@renesas.com, maxime.ripard@free-electrons.com,
        b-liu@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, cw00.choi@samsung.com,
        chanwoo@kernel.org
Subject: [PATCH 01/12] phy: rcar-gen3-usb2: Replace the deprecated extcon API
Date: Wed, 30 Nov 2016 14:57:29 +0900
Message-id: <1480485460-2663-2-git-send-email-cw00.choi@samsung.com>
In-reply-to: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch replaces the deprecated extcon API as following:
- extcon_set_cable_state_() -> extcon_set_state_sync()

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/phy/phy-rcar-gen3-usb2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index bd2430d7339c..7f8081f157f4 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -93,11 +93,11 @@ static void rcar_gen3_phy_usb2_work(struct work_struct *work)
 						 work);
 
 	if (ch->extcon_host) {
-		extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, true);
-		extcon_set_cable_state_(ch->extcon, EXTCON_USB, false);
+		extcon_set_state_sync(ch->extcon, EXTCON_USB_HOST, true);
+		extcon_set_state_sync(ch->extcon, EXTCON_USB, false);
 	} else {
-		extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, false);
-		extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
+		extcon_set_state_sync(ch->extcon, EXTCON_USB_HOST, false);
+		extcon_set_state_sync(ch->extcon, EXTCON_USB, true);
 	}
 }
 
-- 
1.9.1
