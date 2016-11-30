Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
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
Subject: [PATCH 02/12] phy: sun4i-usb: Replace the deprecated extcon API
Date: Wed, 30 Nov 2016 14:57:30 +0900
Message-id: <1480485460-2663-3-git-send-email-cw00.choi@samsung.com>
In-reply-to: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch replaces the deprecated extcon API as following:
- extcon_set_cable_state_() -> extcon_set_state_sync()

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/phy/phy-sun4i-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index eeda5134c777..95cdb08c339f 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -528,7 +528,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	mutex_unlock(&phy0->mutex);
 
 	if (id_notify) {
-		extcon_set_cable_state_(data->extcon, EXTCON_USB_HOST,
+		extcon_set_state_sync(data->extcon, EXTCON_USB_HOST,
 					!id_det);
 		/* When leaving host mode force end the session here */
 		if (force_session_end && id_det == 1) {
@@ -541,7 +541,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	}
 
 	if (vbus_notify)
-		extcon_set_cable_state_(data->extcon, EXTCON_USB, vbus_det);
+		extcon_set_state_sync(data->extcon, EXTCON_USB, vbus_det);
 
 	if (sun4i_usb_phy0_poll(data))
 		queue_delayed_work(system_wq, &data->detect, POLL_TIME);
-- 
1.9.1
