Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40165 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752648AbdFSRFd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:33 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 06/12] media: rcar: vin: Accept parallel input on Gen3
Date: Mon, 19 Jun 2017 19:04:43 +0200
Message-Id: <1497891889-8038-7-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Accept parallel/BT.565 bus types when parsing OF on Gen3.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 37 +++++++++++++----------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index ef61bcc..6738825 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -360,29 +360,24 @@ static int rvin_parse_v4l2(struct rvin_dev *vin,
 	}
 
 	mbus_cfg->type = v4l2_ep.bus_type;
+	mbus_cfg->flags = 0;
 
-	if (vin->info->chip == RCAR_GEN3) {
-		switch (mbus_cfg->type) {
-		case V4L2_MBUS_CSI2:
-			vin_dbg(vin, "Found CSI-2 media bus\n");
-			mbus_cfg->flags = 0;
-			return 0;
-		default:
-			break;
-		}
-	} else {
-		switch (mbus_cfg->type) {
-		case V4L2_MBUS_PARALLEL:
-			vin_dbg(vin, "Found PARALLEL media bus\n");
-			mbus_cfg->flags = v4l2_ep.bus.parallel.flags;
-			return 0;
-		case V4L2_MBUS_BT656:
-			vin_dbg(vin, "Found BT656 media bus\n");
-			mbus_cfg->flags = 0;
-			return 0;
-		default:
+	switch (mbus_cfg->type) {
+	case V4L2_MBUS_CSI2:
+		if (vin->info->chip < RCAR_GEN3)
 			break;
-		}
+
+		vin_dbg(vin, "Found CSI-2 media bus\n");
+		return 0;
+	case V4L2_MBUS_PARALLEL:
+		vin_dbg(vin, "Found PARALLEL media bus\n");
+		mbus_cfg->flags = v4l2_ep.bus.parallel.flags;
+		return 0;
+	case V4L2_MBUS_BT656:
+		vin_dbg(vin, "Found BT656 media bus\n");
+		return 0;
+	default:
+		break;
 	}
 
 	vin_err(vin, "Unknown media bus type\n");
-- 
2.7.4
