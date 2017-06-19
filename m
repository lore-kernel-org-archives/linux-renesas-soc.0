Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41499 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752464AbdFSRFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:39 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 11/12] media: rcar: vin: Store VIN instance id
Date: Mon, 19 Jun 2017 19:04:48 +0200
Message-Id: <1497891889-8038-12-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Store VIN instance id in rvin_dev.
The instance id is reported by "renesas,id" OF property.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 1 +
 drivers/media/platform/rcar-vin/rcar-vin.h  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 1d0b492..67494ee 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -776,6 +776,7 @@ static int rvin_group_graph_parse(struct rvin_dev *vin, unsigned long *bitmap)
 
 	vin_dbg(vin, "I'm VIN number %u", val);
 	vin->group->vin[val] = vin;
+	vin->id = val;
 
 	/* Parse all endpoints on Port@1 (CSI-2) and eventually on Port@2 */
 	vin->mbus_cfg.type = 0;
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 333ef3b..eaae927 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -139,6 +139,7 @@ struct rvin_info {
  * struct rvin_dev - Renesas VIN device structure
  * @dev:		(OF) device
  * @base:		device I/O register space remapped to virtual memory
+ * @id:			VIN instance number
  * @info:		info about VIN instance
  *
  * @vdev:		V4L2 video device associated with VIN
@@ -171,6 +172,7 @@ struct rvin_info {
 struct rvin_dev {
 	struct device *dev;
 	void __iomem *base;
+	unsigned int id;
 	const struct rvin_info *info;
 
 	struct video_device vdev;
-- 
2.7.4
