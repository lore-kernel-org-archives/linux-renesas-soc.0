Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37466 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752088AbdFSRFc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:32 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 05/12] media: rcar: vin: Prepare to parse Gen3 digital input
Date: Mon, 19 Jun 2017 19:04:42 +0200
Message-Id: <1497891889-8038-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Support parsing digital input on configurable port id and reg
properties. Also make the function return -ENOENT when no subdevice is
found.
This change is needed to support parsing digital input on Gen3.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 175f138..ef61bcc 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -511,7 +511,9 @@ static int rvin_digital_notify_bound(struct v4l2_async_notifier *notifier,
 	return 0;
 }
 
-static int rvin_digital_graph_parse(struct rvin_dev *vin)
+static int rvin_digital_graph_parse(struct rvin_dev *vin,
+				    unsigned int port,
+				    unsigned int reg)
 {
 	struct device_node *ep, *np;
 	int ret;
@@ -519,13 +521,9 @@ static int rvin_digital_graph_parse(struct rvin_dev *vin)
 	vin->digital.asd.match.fwnode.fwnode = NULL;
 	vin->digital.subdev = NULL;
 
-	/*
-	 * Port 0 id 0 is local digital input, try to get it.
-	 * Not all instances can or will have this, that is OK
-	 */
-	ep = of_graph_get_endpoint_by_regs(vin->dev->of_node, 0, 0);
+	ep = of_graph_get_endpoint_by_regs(vin->dev->of_node, port, reg);
 	if (!ep)
-		return 0;
+		return -ENOENT;
 
 	np = of_graph_get_remote_port_parent(ep);
 	if (!np) {
@@ -555,11 +553,15 @@ static int rvin_digital_graph_init(struct rvin_dev *vin)
 	if (ret)
 		return ret;
 
-	ret = rvin_digital_graph_parse(vin);
-	if (ret)
+	/*
+	 * Port 0 id 0 is local digital input, try to get it.
+	 * Not all instances can or will have this, that is OK
+	 */
+	ret = rvin_digital_graph_parse(vin, 0, 0);
+	if (ret && ret != -ENOENT)
 		return ret;
 
-	if (!vin->digital.asd.match.fwnode.fwnode) {
+	if (ret == -ENOENT) {
 		vin_dbg(vin, "No digital subdevice found\n");
 		return -ENODEV;
 	}
-- 
2.7.4
