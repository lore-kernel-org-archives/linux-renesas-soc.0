Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB103750CF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872058; cv=none; b=MZHoalYSeGy2kBxKEC10dl993o78diTdZwhjakFw/4EKMTLgvbo4AvMp9seasj94YF15IsBpxwgUeIHvboWp9nPjfActpaDb96D6H6kfgdofVWSe1uxL3f5Y32dwNpcgQILqPrJE/mAh616y8IxBrc1l+3apQpyHKc32+TDEqt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872058; c=relaxed/simple;
	bh=N9yT3eaanfcxDK/32pwzJdj8G2/y2JvVCMh79697FIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fz654HTA3L69/laDO7igZJ0R/SfPFc49n/U+q1vbyL7bXddzYAPobkk/PczbnyqymSpNxBGb9gSaaTT3PAhbTcQGmK8zwQ2njJZvxdVpur3o0e7ebWKeDdFdm8EDIsAjc95InYzNTB6KNvwMwcy3RCJWO9MEfPGXZDu863J3WZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLf873Jj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLf873Jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345081F000E9;
	Fri, 19 Jun 2026 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872056;
	bh=vKyxJHu4SsVp5IuEu+y6My5r3LEZYQdkx/cd9sremcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bLf873JjJNZlD2HT6JnWCZVGG+389IwlsMWA0aWxII8PDwDoriIBpfKHdaEr7xjIy
	 prd+OjjEp9HYTLzr7voYaWu30uURzjGRcrkx1kI0oaYNqel8eMMg8I8kON1TLYaRfs
	 khE/JMu5cr7/vvZCYSnCTHCWLOCd06I8erlhTDw11kVV4fmGEmO/hpd3PQV5OBGxor
	 /FfAIpKlVC1z05iWqnvj57zQX8y0qTOI/dqNFYzSgiG6e9zawyF3nQRCcYYsX9dhq4
	 1yHubghwyQ4qxmVgf0L0TCndcrLEkeeR/5NPQ1eP2KCoAh5JRmGdnz7dMp/zmK4XQu
	 GOVY/NZ5yOcbQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:08 +0200
Subject: [PATCH v3 63/78] drm/renesas: rz-du: mipi_dsi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-63-ff399263111b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N9yT3eaanfcxDK/32pwzJdj8G2/y2JvVCMh79697FIU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpqyXeOZqT5bar3fg/7wjUmmrU9IXdzYp2IsURJ6fY
 945q8apYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEfhNjfdXnGZmP9W9MCZye
 xHVGYNHZe93165t2WklpyfPFXpnrfuzCyxCh7BsBhRozT7Onh7CcYKyvnMeb5fbN+dxs7fx2+Us
 mjIHp15/OzRT+Ix6ob5C5XjC4ZHqJbEeO+/czTr9u7f74uhgA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a2c864860075..0590ade96b91 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1107,11 +1107,11 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
 	.attach = rzg2l_mipi_dsi_attach,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
 	.atomic_post_disable = rzg2l_mipi_dsi_atomic_post_disable,
 	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,

-- 
2.54.0

