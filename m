Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH v3 09/10] v4l: fdp1: Fix field validation when preparing buffer
Date: Thu,  8 Sep 2016 01:25:09 +0300
Message-Id: <1473287110-780-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1473287110-780-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1473287110-780-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Ensure that the buffer field matches the field configured for the
format.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar_fdp1.c | 40 +++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 480f89381f15..c25531a919db 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -1884,17 +1884,43 @@ static int fdp1_buf_prepare(struct vb2_buffer *vb)
 
 	q_data = get_q_data(ctx, vb->vb2_queue->type);
 
-	/* Default to Progressive if ANY selected */
-	if (vbuf->field == V4L2_FIELD_ANY)
-		vbuf->field = V4L2_FIELD_NONE;
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		bool field_valid = true;
+
+		/* Validate the buffer field. */
+		switch (q_data->format.field) {
+		case V4L2_FIELD_NONE:
+			if (vbuf->field != V4L2_FIELD_NONE)
+				field_valid = false;
+			break;
+
+		case V4L2_FIELD_ALTERNATE:
+			if (vbuf->field != V4L2_FIELD_TOP &&
+			    vbuf->field != V4L2_FIELD_BOTTOM)
+				field_valid = false;
+			break;
 
-	/* We only support progressive CAPTURE */
-	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) &&
-	     vbuf->field != V4L2_FIELD_NONE) {
-		dprintk(ctx->fdp1, "field isn't supported on capture\n");
+		case V4L2_FIELD_INTERLACED:
+		case V4L2_FIELD_SEQ_TB:
+		case V4L2_FIELD_SEQ_BT:
+		case V4L2_FIELD_INTERLACED_TB:
+		case V4L2_FIELD_INTERLACED_BT:
+			if (vbuf->field != q_data->format.field)
+				field_valid = false;
+			break;
+		}
+
+		if (!field_valid) {
+			dprintk(ctx->fdp1,
+				"buffer field %u invalid for format field %u\n",
+				vbuf->field, q_data->format.field);
 			return -EINVAL;
+		}
+	} else {
+		vbuf->field = V4L2_FIELD_NONE;
 	}
 
+	/* Validate the planes sizes. */
 	for (i = 0; i < q_data->format.num_planes; i++) {
 		unsigned long size = q_data->format.plane_fmt[i].sizeimage;
 
-- 
Regards,

Laurent Pinchart
