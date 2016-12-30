Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
To: kishon@ti.com, maxime.ripard@free-electrons.com, wens@csie.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, chanwoo@kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 2/2] phy: sun4i-usb: Replace the deprecated extcon API
Date: Fri, 30 Dec 2016 13:11:29 +0900
Message-id: <1483071089-8362-3-git-send-email-cw00.choi@samsung.com>
In-reply-to: <1483071089-8362-1-git-send-email-cw00.choi@samsung.com>
References: <1483071089-8362-1-git-send-email-cw00.choi@samsung.com>
 <CGME20161230041136epcas5p4719845a9e04914e91dd6dac1a5d257ef@epcas5p4.samsung.com>
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
index bf28a0fdd569..eae171e18043 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -534,7 +534,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	mutex_unlock(&phy0->mutex);
 
 	if (id_notify) {
-		extcon_set_cable_state_(data->extcon, EXTCON_USB_HOST,
+		extcon_set_state_sync(data->extcon, EXTCON_USB_HOST,
 					!id_det);
 		/* When leaving host mode force end the session here */
 		if (force_session_end && id_det == 1) {
@@ -547,7 +547,7 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 	}
 
 	if (vbus_notify)
-		extcon_set_cable_state_(data->extcon, EXTCON_USB, vbus_det);
+		extcon_set_state_sync(data->extcon, EXTCON_USB, vbus_det);
 
 	if (sun4i_usb_phy0_poll(data))
 		queue_delayed_work(system_wq, &data->detect, POLL_TIME);
-- 
1.9.1
