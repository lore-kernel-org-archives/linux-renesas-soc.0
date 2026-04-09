Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6F26A1AC;
	Thu,  9 Apr 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741031; cv=none; b=JT9BgHlzsq3XimSqIiGq9y9/3CtJRAV6I0fMHtEBrowh4Lv5/XvDJcwltWScR/2Vx8zTcVSo/Pk9+Q0YiuQkp/sDW1Zu7dMe5jKnM3FFStuBNLNkE0GL5WzXZNxZdVfUj9vKfcjkZlaTGvTf7s0572fl1n1HQi246V49GlTJnx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741031; c=relaxed/simple;
	bh=6IY4R9XjIqQmjxiONSVAiY1vtNeCPXtooa3KEqLGJqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcHUwZ4Rlo/cGhgtUTdEJmXMIpRNuTzy6it07VO6SQn2APug2UQYtw044bJ3IG/Xfz72B6tizuW3/5p4zS0tOMyihJo/HoiQWaA6k+ALVQMFRxI4tL9rAPqxVUSj4SpxblJ7zeZHcoeBTtizJLiupdWPq2RvXxNC0z+p0rAJQrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g6xMpgjp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g6xMpgjp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 601011A3110;
	Thu,  9 Apr 2026 13:23:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35DFA5FDEB;
	Thu,  9 Apr 2026 13:23:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EE4A104500CC;
	Thu,  9 Apr 2026 15:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775741027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fVytxjV17xgSK10EcsYyGCsPOjuobSuyvtNitHNtoxY=;
	b=g6xMpgjp786lwmwHMvkneopo5MudqqKPEJnnZHvtLdVMLwzvvs4PJd3chB7LZcjUBoLK5T
	8iE1/qaJjvuYrTIEsqoDTpRKpMTlawF+ao32uB9lrzeGSK55NsXajGSAd30QdMD/0oCI77
	Hc8PSjP2Ne9Aj2BEipM9ajcbOE6CumJvBC6+uNfc70p1SX2ltmSEVV0HpUkPB2mVgaCbS3
	zEPb2pJLPBNaRPmGsgvk1ThuiLFhzpsak0n6LZ4uh46c8dEVHZttB3dN01YYqS8eroRQQv
	e5P4MyjV/bMRU5a8X9QxfyGVFxvQtWnat1R8gEiUuGlhFHndq30kamosTqrSUg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 09 Apr 2026 15:23:29 +0200
Subject: [PATCH v5 2/2] drm: rcar-du: encoder: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-drm-bridge-alloc-getput-drm_of_find_bridge-4-v5-2-d7381c07788a@bootlin.com>
References: <20260409-drm-bridge-alloc-getput-drm_of_find_bridge-4-v5-0-d7381c07788a@bootlin.com>
In-Reply-To: <20260409-drm-bridge-alloc-getput-drm_of_find_bridge-4-v5-0-d7381c07788a@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

We need to handle the two cases: when a panel_bridge is added and when it
isn't. So:

 * in the 'else' case a panel_bridge is not added and bridge is found: use
   of_drm_find_and_get_bridge() to get a reference to the found bridge
 * in the 'then' case a panel_bridge is found using a devm function which
   already takes a refcount and will put it on removal, but we need to take
   another so the following code in this function always get exactly one
   reference that it needs to put

In order to put the reference, add the needed drm_bridge_put() calls in the
existing cleanup function.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v5:
- simplify error bailout using no_free_ptr

Changes in v4:
- fixed conflict after commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak
  device_link to CMM")
- Use ARRAY_SIZE() instead of define
- Unsigned variable for never-negative variable
- Added comment to clarify the additional drm_bridge_get() in the
  panel_bridge case
- Coding style (C comments, line wrap at 80)
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 29 +++++++++++++++++++----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 7ecec7b04a8d..32ea09d65d76 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -51,7 +51,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 {
 	struct rcar_du_encoder *renc;
 	struct drm_connector *connector;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 	int ret;
 
 	/*
@@ -70,19 +70,28 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
 		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
+			return PTR_ERR(no_free_ptr(bridge));
+
+		/*
+		 * The reference taken by devm_drm_panel_bridge_add_typed() is
+		 * released automatically. Take a second one for the __free()
+		 * when this function will return.
+		 */
+		drm_bridge_get(bridge);
 	} else {
-		bridge = of_drm_find_bridge(enc_node);
+		bridge = of_drm_find_and_get_bridge(enc_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 
 		if (output == RCAR_DU_OUTPUT_LVDS0 ||
 		    output == RCAR_DU_OUTPUT_LVDS1)
-			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
+			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =
+				drm_bridge_get(bridge);
 
 		if (output == RCAR_DU_OUTPUT_DSI0 ||
 		    output == RCAR_DU_OUTPUT_DSI1)
-			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
+			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =
+				drm_bridge_get(bridge);
 	}
 
 	/*
@@ -135,3 +144,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 	return drm_connector_attach_encoder(connector, &renc->base);
 }
+
+void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcdu->lvds); i++)
+		drm_bridge_put(rcdu->lvds[i]);
+	for (i = 0; i < ARRAY_SIZE(rcdu->dsi); i++)
+		drm_bridge_put(rcdu->dsi[i]);
+}
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
index e5ec8fbb3979..b2b5e93f30f8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
@@ -25,5 +25,6 @@ struct rcar_du_encoder {
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node);
+void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu);
 
 #endif /* __RCAR_DU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index b2d0e4651e35..1119c84e5fe9 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -832,6 +832,8 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
 
 		put_device(cmm->dev);
 	}
+
+	rcar_du_encoder_cleanup(rcdu);
 }
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)

-- 
2.53.0

