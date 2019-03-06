Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2408C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 18:42:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8378F2063F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 18:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cp2elqi9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfCFSmJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 13:42:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38938 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbfCFSmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 13:42:08 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65678242;
        Wed,  6 Mar 2019 19:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551897726;
        bh=OauLMf75HrVVCqGzihomVcONa6Nab3dNUpN/NhSlBY0=;
        h=From:To:Cc:Subject:Date:From;
        b=cp2elqi9u8cJ5H74jXPqLZYSMQJ+a9G7OtrkgmM3B6Bjisdh/8kHVwFFOLkrfmFZj
         4ex2PwRB5kEqIjjVmv2YVg7MtJcprLg2kym58lq1/AzCxfLlkdGKyjNv4XDDDlhYG4
         RDxQjKmnYCXEp2qaeZHI85g/nVH+RCGMbGpXBils=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kevin Key <kevin.key@gentex.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2] drm: rcar-du: Support panels connected directly to the DPAD outputs
Date:   Wed,  6 Mar 2019 20:41:56 +0200
Message-Id: <20190306184156.11764-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car DU driver assumes that a bridge is always connected to the DU
output. This is valid for the LVDS and HDMI outputs, but the DPAD
outputs can be connected directly to a panel, in which case no bridge is
available.

To support this use case, detect whether the entities connected to the
DU DPAD outputs are encoders or panels based on the number of ports of
their DT node, and retrieve the corresponding type of DRM objects. For
panels, additionally create panel bridge instances.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Kevin Key <kevin.key@gentex.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 54 ++++++++++++++++++++---
 1 file changed, 48 insertions(+), 6 deletions(-)

Changes since v1:

- Fix of_node_put() call in rcar_du_encoder_count_ports(), release the
  reference to ports, not to node

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 8ee4e762f4e5..6c91753af7bc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -28,13 +28,33 @@ static const struct drm_encoder_funcs encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
+{
+	struct device_node *ports;
+	struct device_node *port;
+	unsigned int num_ports = 0;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (!ports)
+		ports = of_node_get(node);
+
+	for_each_child_of_node(ports, port) {
+		if (of_node_name_eq(port, "port"))
+			num_ports++;
+	}
+
+	of_node_put(ports);
+
+	return num_ports;
+}
+
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	int ret;
 
 	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
@@ -48,11 +68,33 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
 		enc_node, output);
 
-	/* Locate the DRM bridge from the encoder DT node. */
-	bridge = of_drm_find_bridge(enc_node);
-	if (!bridge) {
-		ret = -EPROBE_DEFER;
-		goto done;
+	/*
+	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
+	 * DT node has a single port, assume that it describes a panel and
+	 * create a panel bridge.
+	 */
+	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
+	     output == RCAR_DU_OUTPUT_DPAD1) &&
+	    rcar_du_encoder_count_ports(enc_node) == 1) {
+		struct drm_panel *panel = of_drm_find_panel(enc_node);
+
+		if (IS_ERR(panel)) {
+			ret = PTR_ERR(panel);
+			goto done;
+		}
+
+		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel,
+						   DRM_MODE_CONNECTOR_DPI);
+		if (IS_ERR(bridge)) {
+			ret = PTR_ERR(bridge);
+			goto done;
+		}
+	} else {
+		bridge = of_drm_find_bridge(enc_node);
+		if (!bridge) {
+			ret = -EPROBE_DEFER;
+			goto done;
+		}
 	}
 
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
-- 
Regards,

Laurent Pinchart

