Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EF9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8A3220651
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QeUsTxz5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfAQBt4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 20:49:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39948 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfAQBt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 20:49:56 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yyyyyyyyyyyyyby-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00::2])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15802558;
        Thu, 17 Jan 2019 02:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1547689794;
        bh=sygyVsRYhZCv2TP+fq8/NU5F2AmX+Cj9gvnD9bqV/Aw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QeUsTxz5yOa3SnaiSAWZ7pax46eFqvM5osJssGJsfOgRPTE+AzhYr4RFFV4lpAzol
         PSIJ6UOtZ4Pil6kiqT4Rm6e2NY8pd6mgyODyWqGAF467VKUm7rwGbHgQxYgnCPEtzY
         hdRi1dhSGMCCfre0mShMBfQ1yN9UysDZgHJTKCCk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/6] drm: rcar-du: Simplify encoder registration
Date:   Thu, 17 Jan 2019 03:49:41 +0200
Message-Id: <20190117014946.9669-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Before the driver fully moved to drm_bridge and drm_panel, it was
necessary to parse DT and locate encoder and connector nodes. The
connector node is now unused and can be removed as a parameter to
rcar_du_encoder_init(). As a consequence rcar_du_encoders_init_one() can
be greatly simplified, removing most of the DT parsing.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 52 ++---------------------
 3 files changed, 6 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index f16209499117..ba2b38f76b54 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -30,8 +30,7 @@ static const struct drm_encoder_funcs encoder_funcs = {
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
-			 struct device_node *enc_node,
-			 struct device_node *con_node)
+			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 552f2a02e5b5..df9be4524301 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -26,7 +26,6 @@ struct rcar_du_encoder {
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
-			 struct device_node *enc_node,
-			 struct device_node *con_node);
+			 struct device_node *enc_node);
 
 #endif /* __RCAR_DU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 015c421451dc..1bd75187d039 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -330,17 +330,10 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 				     enum rcar_du_output output,
 				     struct of_endpoint *ep)
 {
-	struct device_node *connector = NULL;
-	struct device_node *encoder = NULL;
-	struct device_node *ep_node = NULL;
-	struct device_node *entity_ep_node;
 	struct device_node *entity;
 	int ret;
 
-	/*
-	 * Locate the connected entity and infer its type from the number of
-	 * endpoints.
-	 */
+	/* Locate the connected entity and initialize the encoder. */
 	entity = of_graph_get_remote_port_parent(ep->local_node);
 	if (!entity) {
 		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
@@ -356,50 +349,13 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 		return -ENODEV;
 	}
 
-	entity_ep_node = of_graph_get_remote_endpoint(ep->local_node);
-
-	for_each_endpoint_of_node(entity, ep_node) {
-		if (ep_node == entity_ep_node)
-			continue;
-
-		/*
-		 * We've found one endpoint other than the input, this must
-		 * be an encoder. Locate the connector.
-		 */
-		encoder = entity;
-		connector = of_graph_get_remote_port_parent(ep_node);
-		of_node_put(ep_node);
-
-		if (!connector) {
-			dev_warn(rcdu->dev,
-				 "no connector for encoder %pOF, skipping\n",
-				 encoder);
-			of_node_put(entity_ep_node);
-			of_node_put(encoder);
-			return -ENODEV;
-		}
-
-		break;
-	}
-
-	of_node_put(entity_ep_node);
-
-	if (!encoder) {
-		dev_warn(rcdu->dev,
-			 "no encoder found for endpoint %pOF, skipping\n",
-			 ep->local_node);
-		of_node_put(entity);
-		return -ENODEV;
-	}
-
-	ret = rcar_du_encoder_init(rcdu, output, encoder, connector);
+	ret = rcar_du_encoder_init(rcdu, output, entity);
 	if (ret && ret != -EPROBE_DEFER)
 		dev_warn(rcdu->dev,
 			 "failed to initialize encoder %pOF on output %u (%d), skipping\n",
-			 encoder, output, ret);
+			 entity, output, ret);
 
-	of_node_put(encoder);
-	of_node_put(connector);
+	of_node_put(entity);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

