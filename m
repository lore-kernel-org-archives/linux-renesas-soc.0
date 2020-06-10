Return-Path: <SRS0=k+uM=7X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BC0C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C9B92072E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Jun 2020 12:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgFJMqg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 08:46:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50566 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFJMqg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:36 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22782FDA;
        Wed, 10 Jun 2020 14:46:29 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 4/9] fixes! [max9286]: Remove redundant DPHY check
Date:   Wed, 10 Jun 2020 13:46:18 +0100
Message-Id: <20200610124623.51085-5-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The vep.bus_type is set as a parameter to v4l2_fwnode_endpoint_parse.
It will not be changed by the framework, so checking it is redundant.

Remove the extra check.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 807024a9a149..e170540a5d72 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1174,15 +1174,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 				return ret;
 			}
 
-			if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-				dev_err(dev,
-					"Media bus %u type not supported\n",
-					vep.bus_type);
-				v4l2_fwnode_endpoint_free(&vep);
-				of_node_put(node);
-				return -EINVAL;
-			}
-
 			priv->csi2_data_lanes =
 				vep.bus.mipi_csi2.num_data_lanes;
 			v4l2_fwnode_endpoint_free(&vep);
-- 
2.25.1

