Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDFE33D51A;
	Sat, 31 Jan 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875146; cv=none; b=q98ndGw5LJ3EOFdVVgRcyHGdr2/Mp2xELPu3TtBISfOn1Jrgvo1u91N4kmbErUMQ+OLHlBWzgcpasrIvmKE+Z2ty9JZfcP88W8rBM2fsWVLxXKyVNNGxJOAFgBdQfLcwnsSU61zunAGduUPZa4nS+5hwCCcwSO4PVcSAT4Lbh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875146; c=relaxed/simple;
	bh=ShRFWf1YL24jawc7E6qTAvPINLwJqZZgNut/y12/vXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe7lRQLMwMXWBTUttUH0CBz+pjGNnJGufVhnsZMpC1tUYIW4u8xqRv7BpLMnRAK6zxVvpPvuANuZvuXDwRD/sbmywX1JusLOwWaPqn/14RG0FYR7bHLC6PpB0FUvmcLN/oOjKNYPaf6K5l5Mmel+EWMB7GqQ9dRSFwjyxEaFdFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ezC+x05o; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ezC+x05o"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 524174E4237A;
	Sat, 31 Jan 2026 15:59:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2926C606B6;
	Sat, 31 Jan 2026 15:59:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D78D119A88F2;
	Sat, 31 Jan 2026 16:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769875141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IPtDTV3UxlBAHCLMExW04W6Gb1rrw7CzH5qBCtmWqiA=;
	b=ezC+x05orD8fpXliwA4jH50fNovOJC9+b8LTTnPBDhpw1x0a7jt7xfN85uup724fECWQi6
	oYrc4T1g9gALnT+pwXIhaiU9EjroYOf1pWbKdlmxlzVD+YjyiF3c8nY19nd6s0Enfj0foH
	ClmlNf4Gl7P0wqqEr2eGWTCTsEJS2q4nduRKqB5IyejU7jNWWRDhX69kTT2vOjhBbpTF13
	DX/e8sGZQmO/iu4epeAl0l9rKWnLTUHAHA5BBZ/JkbxYNpPDHZtnv66tZm3GDM5D2EWTpH
	eKriegr5zf4T/EZhvxD//aANRDIAY8tLsykze7OkFfOx1w1jr7MBsf2se2y6lQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat, 31 Jan 2026 16:58:37 +0100
Subject: [PATCH v2 5/6] drm: rcar-du: encoder: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-5-e081bcdc1467@bootlin.com>
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
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
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 28 ++++++++++++++++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 7ecec7b04a8d..5789fc75092f 100644
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
@@ -69,20 +69,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
+		if (IS_ERR(bridge)) {
+			// Inhibit the cleanup action on an ERR_PTR
+			ret = PTR_ERR(bridge);
+			bridge = NULL;
+			return ret;
+		}
+
+		drm_bridge_get(bridge);
 	} else {
-		bridge = of_drm_find_bridge(enc_node);
+		bridge = of_drm_find_and_get_bridge(enc_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 
 		if (output == RCAR_DU_OUTPUT_LVDS0 ||
 		    output == RCAR_DU_OUTPUT_LVDS1)
-			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
+			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = drm_bridge_get(bridge);
 
 		if (output == RCAR_DU_OUTPUT_DSI0 ||
 		    output == RCAR_DU_OUTPUT_DSI1)
-			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
+			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = drm_bridge_get(bridge);
 	}
 
 	/*
@@ -135,3 +141,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 	return drm_connector_attach_encoder(connector, &renc->base);
 }
+
+void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu)
+{
+	int i;
+
+	for (i = 0; i < RCAR_DU_MAX_LVDS; i++)
+		drm_bridge_put(rcdu->lvds[i]);
+	for (i = 0; i < RCAR_DU_MAX_DSI; i++)
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
index 6294443f6068..15d301ab5eef 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -836,6 +836,8 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
 
 	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
 		platform_device_put(rcdu->cmms[i]);
+
+	rcar_du_encoder_cleanup(rcdu);
 }
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)

-- 
2.52.0

