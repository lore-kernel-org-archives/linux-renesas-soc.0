Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26240382292
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872055; cv=none; b=RDgUvMX6zBhBo5m7IbdA686DcqjFCTU3v9jOSnw2sUnKi4rA4gHszLRkW5S68EDpelVazFgCrcWsOyAh3GT6JJh8t05/FP99iCV4XMmRE0dRZl6sTI72YgAtZ8kmMxZ/7Z3DZ+yUQFnWepsHBxiCiMqS9kXM6WQaVOgYKJCxVT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872055; c=relaxed/simple;
	bh=bacVvb6kDoR91wSeLjd3x7j+m9ph7MurfY3FVR33UKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ii+AW4oaQ5TghfHFf+t7ssAFHWgFeSguk2BGWqmVDMbNpyMTuOF1J4a4gPD0SpHco1yGHJoYKCkGfjkeT2hKlWZgfpT1vH8+doaGojmIK//BQ9lrtiVjNrRWfehAO2JqBJxAL1xtHm6fjU9xMEzRm/R/mgJuZyQ6TCZVolMG7O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQzVlels; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQzVlels"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562601F000E9;
	Fri, 19 Jun 2026 12:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872053;
	bh=Lf535QyZCex7JQ2a7o9ANcaV5PHkieAcb90gA4YNnns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IQzVlelsdmDgHRopqcPvD4iPPOJZor+5H/o9B7+wzAydz+B1gs9gvVAWimFotJ9Vk
	 pfTJ1lSlfUc0R3uOXs8+60PpnjHBCnKFkAk/nnUDkSYM2bPqGx5UUbVHWypyIwW0ZJ
	 e3Y/tBq+mUK7PafFuiIr+MS+C9IvbpNrknQ8lAf6T+HpaIzLTF2P1G5k7cTAhap2X2
	 Tuwu8tM7JEb4Af85okWptu7U5+4HoeThrxoOaLO3ohK6D2eqSh30Tjk1W2i0wpQluz
	 HaVEpRF5luOtoV/PV3W/OWLg0L+ok2zXXmlGx1FsXEnBzmFSivdVTOANdPrnOMvaa+
	 pWoeV964tSxpA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:07 +0200
Subject: [PATCH v3 62/78] drm/renesas: rcar-du: mipi_dsi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-62-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bacVvb6kDoR91wSeLjd3x7j+m9ph7MurfY3FVR33UKk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpqwXX+lp5kxSPnQ7U+vqlAcPVec9LZqw8Mfj5I3so
 gk6mj2POqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEmOsYG3rusK9Vd13HIfTw
 zNlv+5UcQ8+vNXS5aejd4/LoecznjS8tY4sFDLfM0S6cPMt6/pnFDYx1Om1Ba9S+vlgct8hd+Fx
 QxyuZRRJL3tU0dun1NDGobJl16uQEqxNqYjvl7y5K4jSNCCoEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index aaafee1c060b..6e46d6d99f3c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -922,11 +922,11 @@ rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
 	.attach = rcar_mipi_dsi_attach,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_enable = rcar_mipi_dsi_atomic_enable,
 	.atomic_disable = rcar_mipi_dsi_atomic_disable,
 	.mode_valid = rcar_mipi_dsi_bridge_mode_valid,
 };
 

-- 
2.54.0

