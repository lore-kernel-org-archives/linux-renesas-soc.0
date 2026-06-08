Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55213BE647
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929556; cv=none; b=mIyaUwwzp75wu1AXOZrkDNxfMwJsR3FU2BNExJmCR79oL+Ho8bHI4OvA2ZgNFScyipShcZA+Uv0eDPIk8LoReMqlYnGarSh8txOPVUZT1voaHS3iwvshkaaksFWtWzkxpkx4I2MRIltxF+t6nfI1dqzVUyq6AfAX9CZ/NN19Thw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929556; c=relaxed/simple;
	bh=N9yT3eaanfcxDK/32pwzJdj8G2/y2JvVCMh79697FIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcTph4BU1D5XKcpFCuPIy45pl94TVDzN3fujaXDUe/DtKecxCf189gcsGwHnaZug9hJ6/HPsvVMhRqb5PA1GWguIqwdIEksCQn067229JigDIh3IqZ7UuZrr8/+pQPkKus73NkspZ/gGdoI0dt3eTTS+Pv4iJQ01yssfzc1jP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtKGxsgU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtKGxsgU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F131F00893;
	Mon,  8 Jun 2026 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929555;
	bh=vKyxJHu4SsVp5IuEu+y6My5r3LEZYQdkx/cd9sremcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MtKGxsgUpVNudQ3BQk1KLQ3tm7OrlaJ9hr+tSHHREEQ5Lf8C9E4RJLSJ3ZdgTACAX
	 otnC1l7QTj0R1kfY0pZ5QO7uP6GaKR5HBt7OXzxkUyxCBoy8xSmwRanOJM9xbvqqJy
	 WfZGTJYSChXEhlgd0tjB2RmcQ4ce9QWnJ00Ijn+hwZSwvjn6pHv9p6duEUxQoqwJSt
	 v0r092Ao8bKEWbclNu0Mr1xSM/asTmqkFVyCVSITaIAxMFb3hY/VmWRzeaH1727IUz
	 pP9bWGiBia1ammpxlD3NfBxO91Qtna296pgfesnYKzZchU4drJJLmuKjdqw4SwVDaB
	 hLAGmbT0SwCUA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:45 +0200
Subject: [PATCH v2 63/78] drm/renesas: rz-du: mipi_dsi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-63-0a91018bf886@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N9yT3eaanfcxDK/32pwzJdj8G2/y2JvVCMh79697FIU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlqlxMOSZdWPztXc9v1Y9hTj0MHpmXsdStetzoq2Uok5
 OERe6u2jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRS/cY6+zifx0Uuh7IkFe6
 cD/38/dV9jf9XcrFvPn1r4on3j65Ydf1reryZ30a/04NnxM7570hP2PDjBeJV0yuNeUXfN/WtdG
 oKbH+5LGfv7tm218zln8e6nL9LIdoJE/iEqNMhZn9N/kmGnMAAA==
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

