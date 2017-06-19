Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41499 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752648AbdFSRFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:37 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 09/12] media: rcar: vin: Install notifier for digital input
Date: Mon, 19 Jun 2017 19:04:46 +0200
Message-Id: <1497891889-8038-10-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Install async notifier for digital input on Gen3 when no other CSI-2
input has been found connected.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 78ca232..6e5d84a 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -866,17 +866,28 @@ static int rvin_group_graph_init(struct rvin_dev *vin)
 	}
 
 	i = 0;
-	for_each_set_bit(bit, &bitmap, RVIN_CSI_MAX) {
-		subdevs[i++] = &vin->group->csi[bit].asd;
+	for_each_set_bit(bit, &bitmap, RVIN_INPUT_MAX) {
+		if (bit < RVIN_CSI_MAX)
+			subdevs[i++] = &vin->group->csi[bit].asd;
+		else if (bit == RVIN_PARALLEL_IN) {
+			subdevs[0] = &vin->digital.asd;
+			vin->notifier.num_subdevs = 1;
+		}
 	}
 
 	vin_dbg(vin, "Claimed %d subdevices for group\n", count);
 
-	vin->notifier.num_subdevs = count;
 	vin->notifier.subdevs = subdevs;
-	vin->notifier.bound = rvin_group_notify_bound;
-	vin->notifier.unbind = rvin_group_notify_unbind;
-	vin->notifier.complete = rvin_group_notify_complete;
+	if (!vin->notifier.num_subdevs) {
+		vin->notifier.num_subdevs = count;
+		vin->notifier.bound = rvin_group_notify_bound;
+		vin->notifier.unbind = rvin_group_notify_unbind;
+		vin->notifier.complete = rvin_group_notify_complete;
+	} else {
+		vin->notifier.bound = rvin_digital_notify_bound;
+		vin->notifier.unbind = rvin_digital_notify_unbind;
+		vin->notifier.complete = rvin_digital_notify_complete;
+	}
 
 	mutex_unlock(&vin->group->lock);
 
-- 
2.7.4
