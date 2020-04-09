Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA96AC2BA19
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 17:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B578D20678
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 17:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgDIRFJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:05:09 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:39601 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgDIRFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 13:05:09 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 77D88E0008;
        Thu,  9 Apr 2020 17:05:07 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] squash! i2c: max9286: Put of node on error
Date:   Thu,  9 Apr 2020 19:08:06 +0200
Message-Id: <20200409170806.1842811-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Put the device of node in case of dt parsing error.

Fixes: 9eed4185c7a0 ("media: i2c: Add MAX9286 driver")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 241deed0f270..bac9696f83b4 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1121,6 +1121,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
+		of_node_put(dev->of_node);
 		return -EINVAL;
 	}

@@ -1168,6 +1169,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 					of_fwnode_handle(node), &vep);
 			if (ret) {
 				of_node_put(node);
+				of_node_put(dev->of_node);
 				return ret;
 			}

@@ -1177,6 +1179,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 					vep.bus_type);
 				v4l2_fwnode_endpoint_free(&vep);
 				of_node_put(node);
+				of_node_put(dev->of_node);
 				return -EINVAL;
 			}

@@ -1214,6 +1217,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 		priv->nsources++;
 	}
 	of_node_put(node);
+	of_node_put(dev->of_node);

 	priv->route_mask = priv->source_mask;

--
2.26.0

