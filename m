Return-Path: <linux-media-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] vsp1: remove UAPI support for R-Car gen2 VSPDs
Date: Wed, 14 Dec 2016 00:15:34 +0300
Message-ID: <3095242.0tNrk30rsv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We  are going to use the  R-Car  gen2 VSPDs as the DU compositors, so will
have to disable  the UAPI support for them...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'media_tree.git' repo's 'master' branch.

 drivers/media/platform/vsp1/vsp1_drv.c |    1 -
 1 file changed, 1 deletion(-)

Index: media_tree/drivers/media/platform/vsp1/vsp1_drv.c
===================================================================
--- media_tree.orig/drivers/media/platform/vsp1/vsp1_drv.c
+++ media_tree/drivers/media/platform/vsp1/vsp1_drv.c
@@ -588,7 +588,6 @@ static const struct vsp1_device_info vsp
 		.uds_count = 1,
 		.wpf_count = 1,
 		.num_bru_inputs = 4,
-		.uapi = true,
 	}, {
 		.version = VI6_IP_VERSION_MODEL_VSPS_M2,
 		.model = "VSP1-S",

