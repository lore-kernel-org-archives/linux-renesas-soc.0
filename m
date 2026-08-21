Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B853426ED6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323308; cv=none; b=OwPjcTYIvQ6ssSJA454OmhGos6c08C7/F+Q1JjA5k4rbTPPa98YwO4C/10CTcVB6uEPFwEAPIya3pW32m/DhUMushHt+msGeMRe7kcoFdmXirIJIv+de0pJ54/6jk1UrP5igBM2wNnZjltddgxSzf5lWsu0SFn0GYDKC/hMdxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323308; c=relaxed/simple;
	bh=MoHDzQR3vZtC4B+GHVIn1M0nZcHirEDXZeypVQ/Lbkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDz5RNNw9BjOSaZOV9BTsHwbtflsRbQzV6a7wXif+0FORkxHRMIQYsNaMHuL6ZY8YiORmR4ILMspVjCRE4k2Pc37qSS0L8G185W/VW4iTdrhLKVMXDwwj39ptDrn1scZ5Guqm2QplBmvKgZDyqk/HNiyBEYS7NhFRQQBsmBZEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PowEY7Eq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PowEY7Eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE501F00A3A;
	Fri, 21 Aug 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323306;
	bh=6tWH/HcjSAvvvKfmm0EViTiUquecHx9AihGG1W6yKH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PowEY7EqjbL2gZpSIZ/1Kc1uqFHYgwZ2Cw7PmwXAWeF7tj8fe6IEmBQW1pDtR4s8j
	 7Tp1r1NUe+RRXpev6wsCXExQrJ+QzJYyEgtlRaORM4pA51tfTnjsr1XkdpKpwRfviv
	 4NafPgqQDbeUDnFvz9V0TSmml5iUan06WE21ny0pQYWbhEOqhTCrWZi8pXWsVYQWv3
	 jCXObuzHUPO3XpSUQ8SkDP7kB2cytj9JCXkQlH+doAZ6CqCJwUdHp0rpNAq+tiswUb
	 P+7g9y5qieHcPMwlx3Y2dYfj9GREGf9wt5aebau4CEt+uYa1N9ECQkzN2eq1K8/xCn
	 tXXxk8Ng/9qOQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:36 +0200
Subject: [PATCH 60/70] drm/rzg2l-du: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-60-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MoHDzQR3vZtC4B+GHVIn1M0nZcHirEDXZeypVQ/Lbkk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyULMoa25jNe89qTvYw3dypvjXScRULLpCBujd4udE
 OfxxlUdU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCLsoYx1loyFazj9ev4sj4lc
 ujnxleQTYd342crzag49+pDPIHxzZ2Bw3Fdj80yeH8pOyx/53MplbHhUn8mlUWse7b0oMIbDw2/
 79tPJL5h3dy85wajms2Xr6yKujLrNEgLhsct7c26uPBkyBwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The rzg2l-du crtc implementation provides a custom reset hook.
However, this hook only allocates the state, initializes it with
__drm_atomic_helper_crtc_reset(), and frees the previous state. It
does not perform any hardware reset.

Since this is exactly what the atomic_create_state hook is meant to
do, minus the old state cleanup which the caller handles, convert the
implementation to use atomic_create_state with
__drm_atomic_helper_crtc_state_init() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index d0f01aa642a7..ab2f24cc7683 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -330,24 +330,21 @@ static void rzg2l_du_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 {
 	__drm_atomic_helper_crtc_destroy_state(state);
 	kfree(to_rzg2l_crtc_state(state));
 }
 
-static void rzg2l_du_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *rzg2l_du_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct rzg2l_du_crtc_state *state;
 
-	if (crtc->state) {
-		rzg2l_du_crtc_atomic_destroy_state(crtc, crtc->state);
-		crtc->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (!state)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->state);
+	__drm_atomic_helper_crtc_state_init(&state->state, crtc);
+
+	return &state->state;
 }
 
 static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
@@ -363,11 +360,11 @@ static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
 
 	rcrtc->vblank_enable = false;
 }
 
 static const struct drm_crtc_funcs crtc_funcs_rz = {
-	.reset = rzg2l_du_crtc_reset,
+	.atomic_create_state = rzg2l_du_crtc_create_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = rzg2l_du_crtc_atomic_duplicate_state,
 	.atomic_destroy_state = rzg2l_du_crtc_atomic_destroy_state,
 	.enable_vblank = rzg2l_du_crtc_enable_vblank,

-- 
2.55.0

