Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0E3C9EFB
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929554; cv=none; b=SNJSk2jvs7iM/PVnF+5SUk4cuxIJFTmrf+sPyPKpDxB2CJlB4SKsSxU57iKxMOQ+doEZl8Nbfom+Zyg/7KVbSsIyBUSKzVRYWyqACNPhz5zSGVi5iVLQfoOfZLIzG14JEudufDCX/v1w+NNCNm4K4XXqws1zuN2wpRSMDWgqGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929554; c=relaxed/simple;
	bh=bacVvb6kDoR91wSeLjd3x7j+m9ph7MurfY3FVR33UKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfKOy1peQjyFGr0+dmI6uZmeiZvG2LmdZPWuZguwiqpMwYUxIDivsgIbffFaXO/Y3e4ib1O/OFb5AAZyLWCOY40AVLTrD5vupACKKhDuuuhmy71rPN8vo96aVRTyNBnuDbCVNZ/ReEZ+Cs8WFzisMka1kYQKPNOmWjoRl7V6lMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTS7/Oc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTS7/Oc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772501F00893;
	Mon,  8 Jun 2026 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929553;
	bh=Lf535QyZCex7JQ2a7o9ANcaV5PHkieAcb90gA4YNnns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OTS7/Oc0ZYGPWyeDSnb1PR540GpgXLhvVT4BjctVKGzY2XVQVShJ4f6BEVovvDalU
	 ZmZf6k7gbbyN+HahF8DQgHAEWXlepjy+xVljOxEiqlE+/GJC7hfTHRzVqInPDwK46z
	 axZR9R8LMrWY92/84gcveNBrYSV55hEwNXMQ0ePCecoc7CYaGT8T5etpeOw4kmhYIb
	 BrbZb6HiSZ/7SPZVlTBSMS1QCwyUz3SkSS4fM2vLJtNyv0OgH0S0S7qdft5qc5eyAZ
	 3LgvVzi0qhX69i1zwMWPPkWaopcSjoBG9XYTQm7vYkn9V3AuU1qu1IznmUhkVwskv1
	 TQ2Zu7cwEIT0g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:44 +0200
Subject: [PATCH v2 62/78] drm/renesas: rcar-du: mipi_dsi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-62-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bacVvb6kDoR91wSeLjd3x7j+m9ph7MurfY3FVR33UKk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlqlxM8LCJPrBMWy2oXueitJnNP/n74GrvFUb6G2iknC
 p6JbanrmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABPx7Gds2MMceCD+m8nPx2pL
 xPfJ2Wuv+9Qd93LShM2Hl9tcWj6j0/vmyihuzQUyvf3fyvpdPzmKMDY8ff/JPVdigfeR5nfGx99
 Gm0scX+5j+7J49nOP5L6L519t2v97x69PYXt6Uo4YyhwKNCwHAA==
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

