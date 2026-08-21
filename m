Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06164C9545
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323219; cv=none; b=uUVrSMUqA1yfyUG8Pq2dLtLUYUhwa/Tzt4hcBcfuWbopHPe0WtzZw7T4CStK3DmIy9iBOmFtJKsbMWpsEq5mvIZ6za4Qwm/SwAUWgTyWX+yScaG3txuFq9OcLGOgHNt21snZWEV9G78W24OtM75a9XmHAqjkGzANVI6BJcQX+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323219; c=relaxed/simple;
	bh=tgTqNRTuE/qYBhsMUVKSF4aasb30woH+3UrJXa7d+ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBBzFE/4nHrTZa0AwH1foZlHX5+N3N9XS6BKL1ogs5N+DOCNliTjhzf92igAJK1u1FWfTG2LeUpm3UNDDGDTdTIc8TCQjbeFlO5gf7AuITqndSWpXZ1j3YBiQpjC2H8WPcxpF1s/DGaTjadaNpLYhjZ6aMi6EijnneorsE4z4a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXuHIl6C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXuHIl6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7378E1F00A3E;
	Fri, 21 Aug 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323211;
	bh=EfdARYIEnWcsW3l095v7ANfPV12kbdFyoBSIREjIoFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dXuHIl6CX2p9oP3nwqufHtCktjoXrJpiATiNi1D1HRwEdHg5HTAVgjhgjJ5xRV9SP
	 el/jqap22gFpqUvhOqaHDShaMwhi/GNB9D/1XuNDrn1n/zIfDJ27C6sUHHWZyb7N8H
	 0ZyMir/Bm1wCSmvq1ABPxAJBjKX75s1+q0azGTvB+Zho1Nz5Hy6dOX4w+t4X4IFoKY
	 qmGqe2p5ZaYPScrMrUVZGoxbGQZOAicinvEoJW5wDfaSluJQ1+jLu/6yel8MHwFXBd
	 J7Bm3Eq1Kyc1d/ZND967ZTS+EwF/xu/3h8O2v0t6EJplrE7jGeJm5BNdxF4+xoL+40
	 U9Cc7u4UugNHw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:38:56 +0200
Subject: [PATCH 20/70] drm/renesas: shmobile: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-20-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tgTqNRTuE/qYBhsMUVKSF4aasb30woH+3UrJXa7d+ic=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyYze+bbOC5ex3l/Zd/Fzo/ICy0U75ylNf2d0WyT40
 0HtbqlJHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiU6sZG1YxaWXf2zQ9MD2H
 i6fCoPHjBt3YJUzVR6W/bF+z1nXVsoCd1S+T9jwWjH788eOGqiC1y4x1ynxhp9yebzD9dX1D5B1
 7TgH/4EsJ93K2MAvO3Rj0ovKylEkTi1d2x7rsiECWrm/O368BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The shmobile crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1a2b9b68af6f..2ea510cbc55c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -362,11 +362,11 @@ static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
 
 	shmob_drm_crtc_enable_vblank(sdev, false);
 }
 
 static const struct drm_crtc_funcs crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = shmob_drm_crtc_page_flip,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,

-- 
2.55.0

