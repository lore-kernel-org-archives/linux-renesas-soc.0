Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42781 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdFSRFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:40 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 12/12] media: rcar: vin: Link digital subdev to VIN instance
Date: Mon, 19 Jun 2017 19:04:49 +0200
Message-Id: <1497891889-8038-13-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Link digital subdevice to the current VIN instance if the instance
support it and we are currently using media controller API.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 67494ee..503c905 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -26,6 +26,12 @@
 
 #include "rcar-vin.h"
 
+static int rvin_group_add_link(struct rvin_dev *vin,
+			       struct media_entity *source,
+			       unsigned int source_idx,
+			       struct media_entity *sink,
+			       unsigned int sink_idx,
+			       u32 flags);
 /* -----------------------------------------------------------------------------
  * Media Controller link notification
  */
@@ -418,6 +424,7 @@ static int rvin_digital_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rvin_dev *vin = notifier_to_vin(notifier);
 	struct v4l2_subdev *sd = vin_to_source(vin);
+	struct media_entity *source, *sink;
 	int ret;
 
 	/* Verify subdevices mbus format */
@@ -464,7 +471,20 @@ static int rvin_digital_notify_complete(struct v4l2_async_notifier *notifier)
 		v4l2_disable_ioctl(&vin->vdev, VIDIOC_ENUMSTD);
 	}
 
-	return rvin_reset_format(vin);
+	ret = rvin_reset_format(vin);
+	if (ret)
+		return ret;
+
+	/* Link the digital subdev with the VIN instance, if supported */
+	if (vin->info->use_mc && (vin->info->din_mask & BIT(vin->id))) {
+		source = &vin->digital.subdev->entity;
+		sink = &vin->group->vin[vin->id]->vdev.entity;
+
+		ret = rvin_group_add_link(vin, source, 0, sink, 0,
+					  MEDIA_LNK_FL_ENABLED);
+	}
+
+	return ret;
 }
 
 static void rvin_digital_notify_unbind(struct v4l2_async_notifier *notifier,
-- 
2.7.4
