Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40165 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750988AbdFSRFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:40 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 08/12] media: rcar: vin: Parse digital input after CSI on Gen3
Date: Mon, 19 Jun 2017 19:04:45 +0200
Message-Id: <1497891889-8038-9-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When parsing available inputs on Gen3 boards, add parsing of digital
input enpoints to the already in-place CSI-2 node parsing.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 6738825..78ca232 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -777,7 +777,9 @@ static int rvin_group_graph_parse(struct rvin_dev *vin, unsigned long *bitmap)
 	vin_dbg(vin, "I'm VIN number %u", val);
 	vin->group->vin[val] = vin;
 
-	/* Parse all CSI-2 nodes */
+	/* Parse all endpoints on Port@1 (CSI-2) and eventually on Port@2 */
+	vin->mbus_cfg.type = 0;
+	vin->mbus_cfg.flags = 0;
 	for (i = 0; i < RVIN_CSI_MAX; i++) {
 
 		/* Check if instance is connected to the CSI-2 */
@@ -804,15 +806,21 @@ static int rvin_group_graph_parse(struct rvin_dev *vin, unsigned long *bitmap)
 		vin->group->csi[i].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
 
 		*bitmap |= BIT(i);
+		vin->mbus_cfg.type = V4L2_MBUS_CSI2;
 
 		vin_dbg(vin, "Handle CSI-2 %s\n", of_node_full_name(csi));
 	}
 
-	/* All our sources are CSI-2 */
-	vin->mbus_cfg.type = V4L2_MBUS_CSI2;
-	vin->mbus_cfg.flags = 0;
+	/* Done with at least one CSI-2 port registered */
+	if (vin->mbus_cfg.type)
+		return 0;
 
-	return 0;
+	/* Check if any digital input is connected to this instance's Port@2 */
+	ret = rvin_digital_graph_parse(vin, 2, -1);
+	if (!ret)
+		*bitmap |=  BIT(RVIN_PARALLEL_IN);
+
+	return (!ret || (ret == -ENOENT)) ? 0 : ret;
 }
 
 /* group lock should be held when calling this function */
-- 
2.7.4
