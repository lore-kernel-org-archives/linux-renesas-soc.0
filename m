Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD63F0A85
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147261; cv=none; b=pASxoeyspIc2SdLp0EuPmyvsAMePrpYns1KSsb4piu+vCOfkhQTQBDeq/xiwAgp22mLVbdJXZnH4hr9f3UYpI48beiQ1JOvHXUC477gWw9Xn5rqKSBof3sW5hrc2LRbX7vthA1rbcEsFN8rqg09SvaPUEgaVi/LhdF/PyXeA428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147261; c=relaxed/simple;
	bh=nnmktu+i3aFT/v27nzZQ1hqCDT4h4lcVfrM54m82nsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFhHWmvRK6r0x9i9zn6YSCY7Feg+AKznFSXWFLq2HPZN7YWBzVdMU7huWIgglWn4d2EbTafrgRqTIUnwgmDp+52ui0+eTC/ab7Uy/XqEE5dz1bVsaKH8ut/NfTEgm6i4u5MViOVytBjfzIc7oYEHOyrQv3ALvG8YQVUNSufnwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xLBx7un4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xLBx7un4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1002D1A3107;
	Thu,  2 Apr 2026 16:27:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA0A9602CD;
	Thu,  2 Apr 2026 16:27:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ED3710450288;
	Thu,  2 Apr 2026 18:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775147257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DNyrSsXKwCyMcPcvmApHaYBSnc2gsMPCpE91ks41RvY=;
	b=xLBx7un42jdVHDeZj4XlWypyoae4/uDPDLvC68pmajQWnxPcFdnIO/RjfCDA7trdlFE01Y
	vklxoNR6dswXvSMex171zS0Fs6t/AVMB2/sgmCOorj9YsI6QmNyD8U4Jd2hY4JyzMpWVSP
	+yDduzb36dPNMYy9Pe2sfrY+nY/B7oDyr0Y1NkgDw2SeqVmt9GBw5Azj8+l1nBbZlFSlM7
	bipJIPzTHqSQ2VKOUAZWb5KFNHp/dCG2B5ljbqdiaFSyAobJYVILZMe/02Q22ZI8Szwxnw
	wzUOPa/+MSTlCbfTnkvduZZRcdtQxQagAbMGDGSZZ7+r1ePV3HCoC+ix4O72UQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 02 Apr 2026 18:27:17 +0200
Subject: [PATCH v4 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com>
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
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
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

This is made somewhat simpler by the fact that 'bridge' is a local
variable.

However we need to handle both branches of the main if().

In the 'else' case, just switch to of_drm_find_and_get_bridge() to ensure
the bridge is not freed while in use in the function tail
(drm_bridge_attach() mainly).

In the 'then' case, devm_drm_panel_bridge_add_typed() already increments
the refcount using devres which ties the bridge allocation lifetime to the
device lifetime, so we would not need to do anything. However to have the
same behaviour in both branches take an additional reference here, so that
the bridge needs to be put whichever branch is taken without more
complicated logic. Ensure to clear the bridge pointer however, to avoid
calling drm_bridge_put() on an ERR_PTR.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v4:
- Added comment to clarify the additional drm_bridge_get() in the
  panel_bridge case (keeping the R-by and T-by tags as it's just a comment)
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 5e6dd16705e6..9edb90059830 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -67,7 +67,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 {
 	struct rzg2l_du_encoder *renc;
 	struct drm_connector *connector;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 	int ret;
 
 	/*
@@ -83,10 +83,21 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 
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
 	}

-- 
2.53.0

