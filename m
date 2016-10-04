Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48765 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbcJDMbu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:50 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/6] drm: rcar-du: Fix crash in encoder failure error path
Date: Tue,  4 Oct 2016 15:31:39 +0300
Message-Id: <1475584299-21236-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When an encoder fails to initialize the driver prints an error message
to the kernel log. The message contains the name of the encoder's DT
node, which is NULL for internal encoders. Use the of_node_full_name()
macro to avoid dereferencing a NULL pointer, print the output number to
add more context to the error, and make sure we still own a reference to
the encoder's DT node by delaying the of_node_put() call.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index bd9c3bb9252c..d3ab10602e3e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -445,13 +445,13 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 	}
 
 	ret = rcar_du_encoder_init(rcdu, enc_type, output, encoder, connector);
-	of_node_put(encoder);
-	of_node_put(connector);
-
 	if (ret && ret != -EPROBE_DEFER)
 		dev_warn(rcdu->dev,
-			 "failed to initialize encoder %s (%d), skipping\n",
-			 encoder->full_name, ret);
+			 "failed to initialize encoder %s on output %u (%d), skipping\n",
+			 of_node_full_name(encoder), output, ret);
+
+	of_node_put(encoder);
+	of_node_put(connector);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart
