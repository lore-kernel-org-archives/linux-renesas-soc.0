Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CF43F8B8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193203; cv=none; b=TsCIoKclVp8okoTiqmOb/E4nMqCa8k6ZmCvo6Judsa32vI0cPrpn1oOYHSw+8ggQVp8rPAl446EYTywJwluMA9MMx4PeeBvChY03yJWiJUc3tcG5K3xD5qk+PwN6tYVkJ7ZbOnxbe/laSrNsw57pSUMNgDK9GVqFEUD4GQlVHK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193203; c=relaxed/simple;
	bh=lFb0/r5T37LtcZ/fZlU32akwUACaoc0XZlKURDhjlM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jz/e1Du1vAz+eUfkasnWCxyDWN16bjnDitOPs7eF815H2W7SdWPTgsAaXbNHvMbSNkTWv/8AVnonKf99PKdQZOf0lrUC4mPfkVy8iVEmpiG8uwvfVbGts5iLPxx1F9IjYPNDq3TLPi7mI0vtniJ1WaBHiRlWCsxPqpvY+D+e0Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msPrdzDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msPrdzDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB6A1F000E9;
	Mon, 31 Aug 2026 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193201;
	bh=7Ls+NvHNklb+Bsu/U28EvAEbavqoLs1ZOqSz3mrEaN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=msPrdzDjJU5vse2SHZ5/tVF9w9gB2h9BDIB73Tu6eqOd2f4uNwAoNpxGS/nZ75XT1
	 KeebY8Ig0GEURgfpOGdDeCs3vcbchzBrN3HRgtMyNBtFKpSHfKSgniZxuPyH7UHQV6
	 S5gwRg7IXkBoRovRuFv9TjqR8gkOjsekdl/0zAwybkhamPjyZCumpRlpGzkXvoEx+E
	 d1qxMHgMvWq8l533elLDJmBW+MwApX2J5EhPFEjRM2E+IWB3n6ina05PL2kyl4q5sL
	 TIEfaDaWl5CuZj/o04AGL4du3ySPqcRs0/8TBlVRTI5ts7Ls4SkvWp6v7jshQVNwon
	 bsByxAvu7y7oA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 31 Aug 2026 18:17:52 +0200
Subject: [PATCH v3 36/40] drm/shmobile: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-no-more-plane-reset-v3-36-1877c7aa57b3@kernel.org>
References: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
In-Reply-To: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6989; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lFb0/r5T37LtcZ/fZlU32akwUACaoc0XZlKURDhjlM8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlTVyrwthmmirzYeC8+KfqO+PLLJwWneVxf/fLPDlFj7
 axN7xPyOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEmLYwNly+/PPjxg8rJ8c1
 7Fj9YnGL5IrJqbzSnGySbV69E/f1Ne3g/mHSY+XT1xI+xSPamelmEWOt+GONy79cj70LMqnLOzn
 1+tMQfbu7q9+eE0s69Eu8clJE+MOpdXeWM7x/quTkl3R6C3M2AA==
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 148de34af785..4dec4d2c941e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -249,24 +249,21 @@ static void shmob_drm_plane_atomic_destroy_state(struct drm_plane *plane,
 {
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(to_shmob_plane_state(state));
 }
 
-static void shmob_drm_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *shmob_drm_plane_create_state(struct drm_plane *plane)
 {
 	struct shmob_drm_plane_state *state;
 
-	if (plane->state) {
-		shmob_drm_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (state == NULL)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_plane_reset(plane, &state->base);
+	__drm_atomic_helper_plane_state_init(&state->base, plane);
+
+	return &state->base;
 }
 
 static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
 	.atomic_check = shmob_drm_plane_atomic_check,
 	.atomic_update = shmob_drm_plane_atomic_update,
@@ -281,11 +278,11 @@ static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs
 };
 
 static const struct drm_plane_funcs shmob_drm_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = shmob_drm_plane_reset,
+	.atomic_create_state = shmob_drm_plane_create_state,
 	.atomic_duplicate_state = shmob_drm_plane_atomic_duplicate_state,
 	.atomic_destroy_state = shmob_drm_plane_atomic_destroy_state,
 };
 
 static const uint32_t formats[] = {

-- 
2.55.0

