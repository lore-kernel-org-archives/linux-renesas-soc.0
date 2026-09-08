Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7A556B97
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878988; cv=none; b=FqAmQyNc2SQOjsY7rKaTlG3rwnFKuYenRd4i2vUlbycS4pOQvRxGUNVAFobEJttGJzTci77ObcpOckCB2QgOSota8xeZEjfSMadnkydtXsNUISHFtI2//uSt1/6EQV7W0TwRURvb+Hi7vFGf7rINQYdoWJ3r6KqbH/qwPpYUmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878988; c=relaxed/simple;
	bh=mvMTHgfyXezhnRuZ0JBWT3lUXUS/6f6Q9E/i9QXaog0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpjjKCD20twOgEM1GtzIg6r9fmkOi+Qp0Zw1gCGSOWGnqRBiO+D7hsdG645Y6A/2zehJQNLQ/L5Sd02seRUebvfnHcYKAXpbOilTZhFwZHazBPZZyoE1OCA6H7JeegQwXb5sj/xcms9EdKV64yh5YWTAigZD3Ra6NRnRFULak68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPbP+puf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPbP+puf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64781F00A3A;
	Tue,  8 Sep 2026 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878979;
	bh=xH+I8W3l1BcSG6v0j5dNncyhlytPY2xhSJ4P2J83n48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hPbP+pufiF+YRdB37Y60kNUBzTKElNDl4VzgJ83IqXx+q2gN8txzWFUqUZtTOwOcV
	 +nZdxHYy0SAK8SS9aMqTTBAzPdkbfK76gHd9icyGiV7PI7waX2MwNgIILQNr1JLM/d
	 XTn8GAACAjiFQkXcprn3lCmInkJ2YI80ZGh9kxuwKg22EQO6kR+6JwYzL3vo0pFi1L
	 OvKNautnisAzG/Ie43BZgRBPXEsqEsa8qn8qmLg9x4XqhBfEwDi/qJl3wq0uw+Nxfn
	 ChLGevRuM8mLq8NHJno2VY4PkWEtIFtmB3IbwVkppd0wbeoYxEMdkRfz0aoSd2rJHe
	 /jXfnNnYxKy/w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Sep 2026 16:47:07 +0200
Subject: [PATCH v4 36/41] drm/rz-du: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-no-more-plane-reset-v4-36-a31b3fcfc989@kernel.org>
References: <20260908-drm-no-more-plane-reset-v4-0-a31b3fcfc989@kernel.org>
In-Reply-To: <20260908-drm-no-more-plane-reset-v4-0-a31b3fcfc989@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, biju.das.jz@bp.renesas.com, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6785; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mvMTHgfyXezhnRuZ0JBWT3lUXUS/6f6Q9E/i9QXaog0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkL5O++NVq7oaU0Ieq/9kSxLwd2WNVxr9q1tHKPYc1yz
 XQ9D6u7HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAii9kZG74cjXCZcq9U7tfj
 uHoL23bZidlFN0oW74rZtFRq60IP9jsqKru3pwtv3STr0/h7xiqFR4yVjD5P/Od3NdVcYpt02zh
 CfvXnvvfRxWtXzON7fvp2ieV9loOJZj+85MXu7T7G2Pz49s59AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 1efa0f0451fe..944bc9ac9589 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -264,30 +264,27 @@ static void rzg2l_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
 {
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(to_rzg2l_vsp_plane_state(state));
 }
 
-static void rzg2l_du_vsp_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *rzg2l_du_vsp_plane_create_state(struct drm_plane *plane)
 {
 	struct rzg2l_du_vsp_plane_state *state;
 
-	if (plane->state) {
-		rzg2l_du_vsp_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (!state)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_plane_reset(plane, &state->state);
+	__drm_atomic_helper_plane_state_init(&state->state, plane);
+
+	return &state->state;
 }
 
 static const struct drm_plane_funcs rzg2l_du_vsp_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = rzg2l_du_vsp_plane_reset,
+	.atomic_create_state = rzg2l_du_vsp_plane_create_state,
 	.atomic_duplicate_state = rzg2l_du_vsp_plane_atomic_duplicate_state,
 	.atomic_destroy_state = rzg2l_du_vsp_plane_atomic_destroy_state,
 };
 
 static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)

-- 
2.55.0

