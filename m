Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60006 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752509AbdCFAOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:14:41 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 7/9] drm: rcar-du: Skip disabled outputs
Date: Mon,  6 Mar 2017 02:03:00 +0200
Message-Id: <20170306000302.14149-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When a DT node connected to a DU output is disabled no bridge will ever
be instantiated for it. Skip the output in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index f38fc2f3f93d..f4125c8ca902 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -302,6 +302,13 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 		return -ENODEV;
 	}
 
+	if (!of_device_is_available(entity)) {
+		dev_dbg(rcdu->dev,
+			"connected entity %s is disabled, skipping\n",
+			entity->full_name);
+		return -ENODEV;
+	}
+
 	entity_ep_node = of_parse_phandle(ep->local_node, "remote-endpoint", 0);
 
 	for_each_endpoint_of_node(entity, ep_node) {
-- 
Regards,

Laurent Pinchart
