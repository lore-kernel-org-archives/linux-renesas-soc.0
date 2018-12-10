Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:56582 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbeLJMIA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:08:00 -0500
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH] media: i2c: adv748x: Fix video standard selection register setting
Date: Mon, 10 Dec 2018 12:07:55 +0000
Message-Id: <20181210120755.12966-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

By video decoder user's manual, the bit 2 in Video Standard
Selection register must be reserved with the value of 1.
This driver cleared it with 0 when writing back.
This patch corrects it.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
---
 drivers/media/i2c/adv748x/adv748x-afe.c | 3 ++-
 drivers/media/i2c/adv748x/adv748x.h     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 71714634efb0..c4d9ffc50702 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -151,7 +151,8 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
 					  int sdpstd)
 {
 	sdp_clrset(state, ADV748X_SDP_VID_SEL, ADV748X_SDP_VID_SEL_MASK,
-		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
+		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT |
+		   ADV748X_SDP_VID_RESERVED_BIT);
 }
 
 static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index b482c7fe6957..f1f513f4327b 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -265,6 +265,7 @@ struct adv748x_state {
 #define ADV748X_SDP_INSEL		0x00	/* user_map_rw_reg_00 */
 
 #define ADV748X_SDP_VID_SEL		0x02	/* user_map_rw_reg_02 */
+#define ADV748X_SDP_VID_RESERVED_BIT	0x04
 #define ADV748X_SDP_VID_SEL_MASK	0xf0
 #define ADV748X_SDP_VID_SEL_SHIFT	4
 
-- 
2.17.1
