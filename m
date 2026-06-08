Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410C3CE4B1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929551; cv=none; b=QvlrcqUwR9x03UAMSpy1K6AoAE4WOVdh1L1eH3w6E/MymD4GGg2LfVs7ARa017lZ30jBxYPaFC5ZN8kerFnuEBlf/SrbBDdlETEMurGZTLTJ1ln5eavVmeOXpbVOtksBmRb65dNk4P6S+lV+iLDDkfrt7vzwmVbuElmF4xjXBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929551; c=relaxed/simple;
	bh=dGURqbE4HepT4WvbzLd9xdUA1rIAFCGuCcyl1XW5eiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtxMWm9GoegC6qw2ulXsffgf+Haz0oImdrpOH4D/Q7qTWiMW0aDWCy/cdHmAY2TKzAO5EY3DBDQ72ho2c0EkRbNgAgJW2Uk1XDEgFqOqsHKhdnlub70Df4II769fQ/5pQWGQ1BWMqOX2DBbFUHEddYwNgKl+r2I3cqgDG34YUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lp4wlwQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp4wlwQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC14A1F00893;
	Mon,  8 Jun 2026 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929550;
	bh=gYZf1ZSLKidaGLTUJJikyt/NFIKxJqatogmOTfb8lJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lp4wlwQpxe0rdXTOU5lXa9pFoRBHE3W9pJ207eH0Ch6YQBrkFVxqI2jG4emdhZpjO
	 xcatyr1xwViw5WfxwaXuDrBounB3I1ZIVtPKC8ychESoyMu2vdCiW1N24QzbRBSppL
	 tdw71QYbepXrUyTn6Uy+bc0TwyTgvKSHkcDLH+qzbLO40dlQgz4IC/LAE2DbUnAMRw
	 I3UttZK416tsG6Fz27bYPNlH8/xHri8AIeTmxm7ae0XtiJwyiYv2b97U6sgSQbG222
	 G3hL0WSbT/puCrR0DjFss7iuw59r7E9s5z0HOF+ue9d2aLNXF1UNwg8f2hXk4qQhC0
	 Uj9YjZiVocKEA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:43 +0200
Subject: [PATCH v2 61/78] drm/renesas: rcar-du: lvds: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-61-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql+O1c//wNbw+n1OwWWH3x0kLDsrOfVYy796PPUuZO
 Z21z22f0zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmkrmSsWH3dtkmHrfDrLeL
 jj2qqD2cF7tA7dD+eUmb5gVM28p42zvhuMZXxUi7gzO8g4/d6FL748TYcGv1rIDjuc4HcvMDdzJ
 0ftB3Cf9narcw+jLzY21Jn748xtumx6rve9ln6VnOE7fh2GQBAA==
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

