Return-Path: <linux-media-owner@vger.kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: vsp1: Fix trivial documentation
Date: Fri,  7 Dec 2018 16:31:34 +0000
Message-Id: <20181207163134.14279-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In the partition sizing the term 'prevents' is inappropriately
pluralized.  Simplify to 'prevent'.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 771dfe1f7c20..7ceaf3222145 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -223,7 +223,7 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
 	 * If the modulus is less than half of the partition size,
 	 * the penultimate partition is reduced to half, which is added
 	 * to the final partition: |1234|1234|1234|12|341|
-	 * to prevents this:       |1234|1234|1234|1234|1|.
+	 * to prevent this:        |1234|1234|1234|1234|1|.
 	 */
 	if (modulus) {
 		/*
-- 
2.17.1
