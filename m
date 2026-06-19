Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A8383325
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872052; cv=none; b=PwWb56/lt3Bx7PfDypaGtQ4ldZba/7mkHDc8v84pH7EL0becKakty6WtpVtLSqkkDnquWPWZjUkABcpMHRciw27Xb42ErSVpJW8gob2N1jqtaInB2rFy2CnuWR/eLaDjv+6W7kgyttoiIWXdFbTbbz6RCLIenZpBnvKpJ1+hvjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872052; c=relaxed/simple;
	bh=dGURqbE4HepT4WvbzLd9xdUA1rIAFCGuCcyl1XW5eiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAgVgPY9piQlZYggID7gpFvrADXgDHYJsov0DzmHJ5YvBgZtkqqq6jes9v+z7LAXlwxX6ffaRCQqBPKrgVFhRcJ0nQqAtw7fvgV014hSvmV1TeU2s1BIjE+3G+o7FSPPganUpKGWBPU/oM3dhvxqcm1imrKdXbbJ90U/0F2bgME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A28+aRg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A28+aRg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBCC1F000E9;
	Fri, 19 Jun 2026 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872051;
	bh=gYZf1ZSLKidaGLTUJJikyt/NFIKxJqatogmOTfb8lJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A28+aRg3eS8srjNmLXPH5NYXJ4QiQjH7SoBoGlaWGa5Q6S8p1MBR1z4cd0YUMdGgX
	 D9zUfALoXPYDF2+QhaHK9RAm3OvEmFZ5lTcljtFPRlCMMNfQL8Incg+yq7lMoPlR9g
	 VmeyM3pRbKjRGX4U87TR7IfkV2o0g9SG/1GaWscF1/f6Fe9Ji1cIM21WO+MevsK1/V
	 +nd+xk8ZkCoHVpMEErqJQH1fpjrCsxUYu/BfWtSvLngqdkeBB9FjxRfSPs7rSH7vUS
	 9DMmAs8wlFhQyJkBLocBOoLuWbfdPFSMEdGLYYGQRjAQzPdALuEB4OwTj0OzDdeV2m
	 htf7WNXsJuL8w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:06 +0200
Subject: [PATCH v3 61/78] drm/renesas: rcar-du: lvds: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-61-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dGURqbE4HepT4WvbzLd9xdUA1rIAFCGuCcyl1XW5eiY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpiwpr5knXBTNqXp3MFDteVsKe+/6stgNls2qO7sCm
 BfdkeftmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABN5fJexYQXzn9SdbQvmr1YQ
 V37HIB+p809e/tCVWqnIY5JLG7w1rke/XZmu12UgkfN+1Z6KpVf/MjZclH9uLeQifcbQOU/reWx
 +JZvCArPgmZZHRD+G8ZuUhW5aNGGaacedzxWv3iQ3yrqrMQMA
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
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 154410745a74..e433ce61d431 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -656,11 +656,11 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
 	.destroy = rcar_lvds_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_enable = rcar_lvds_atomic_enable,
 	.atomic_disable = rcar_lvds_atomic_disable,
 	.mode_fixup = rcar_lvds_mode_fixup,
 };
 

-- 
2.54.0

