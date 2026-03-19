Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359D3EB7F4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938922; cv=none; b=dtsqM6zwIy9FohXKdyAYgMJwRLZMSLS+y3Hl2iIMU5N/6eKRinJMtBE4QNXyhhyrWVAJk02CJ5N5L5ueSRbdRygE0sqMOhXcLm4B6JvZrHMWOpRxtlaLGjjkzIV8KnJPhDkoNvJP+gHaJ9An8eRJEWjnDID/6WQOLUhIlda/y+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938922; c=relaxed/simple;
	bh=wSrtoof78gY7cl0/kTqen6G7IMto9m9YkmvWmlpqlNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT54PIcqXtZkeS2tMcTW4pI+lYDCqP9BwW+GVuBb0UiKO3ypqP/7qBPZgBhCb3vXUp19kff+KNQ2XuWv7FowpyuRzlhzvqSUePWE2qdT7WYQesfsDmtY1LB+jbbfZ1N7U56YuP0BC4RkBD4mAeNpXEIcupDYZZ/UOUF8GCvfroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3mA3qet; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3mA3qet"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48538c5956bso10451235e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773938916; x=1774543716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIvSNKXz4qc5DB7Emu7Dw1mSZJPjUbF0QIFG+kNxKiA=;
        b=L3mA3qetVfn3JvgWmB2Cf1QnBoHJH46AeHIxw9WCw/VouIA6MAywnMjF95EjkMdEH9
         d3sx9mf9hKqE118PPJvZjzmupAMDiq7zxmFRJxqjKbCcJJBhEeQ/+3eLR7su+n6gTeS2
         qj7n71ibNBeETQAL+OpEaY8CGo7Ct22Rak0T1M/Zc6woYyroBIzaNoMzy4R1x9zdfVZc
         53C8qZSs91tT4RWXH2er5sK9lfxpjtpwTqXzGMcIt6mhhf+NOUHDdAeEJui9UXS+/cVH
         oeesdEuwv7xR9Fv2EY2f4tcBP42rrWu1Er4uGR748vH+/sYfYHmHTWzACpJMZeeuxioc
         2sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938916; x=1774543716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIvSNKXz4qc5DB7Emu7Dw1mSZJPjUbF0QIFG+kNxKiA=;
        b=kgDSX+t8Vk7c67AA53yFYLmWwO8cn5PdQVFif1NsCExOiMtyyW4YdKRi1N768h/xLd
         MMciyQJx80Ooll8gu+W337qh2d6cEmZNbsebqVvjgp+LVA4ve9yK7Ho6BAeXMgTQVwIn
         4oSQVovd1/pknSTdBLxqVPQ4XcmNWI0Llj601dIpbgX/A8zf0UfKaTsWj4BoIynS6ycI
         MeGB7SAlAYTjBbwfXdoxWED8ZPnjlUzH4GMePbQhjHzrFqLZdegboNO+zcnIpEYPomxg
         XZQPwYCKwwSj9SDVZO2cXYM14RqF+erBqO8vXyOLoULoAUo6rZ8J7gLA+3pgNITxnBGv
         2XMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgvhjXu7qnwyWL/01xTr1r9AJRYxsWbHaD2b9+2eRtsSCph5HbU89sj4GjUjj66cseRb1UJ6aoafPchJCB4mpEXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyqk+D0LIxNDYo0jpsJ26tIMxO8J7BQ9AQ8/cSLmaZ8xmsfqrG
	wq0RF6mt3lfzCUj/fdnpAfsFTOfn9R6KTLCgB8tmSmXtqlsedb21N7mi
X-Gm-Gg: ATEYQzx9Q1NyiO+8bUlv0nNlPoCCeRsDvGDrhup7xu9vN1QQHHDxs56wEKz3zw2nTCF
	OsiFZXroaCIcEBcMFdt3LE5rhQ5vO9tEP+N8wtmmr6cHU0W7Yo2/Cq3Dv2FF2pqGeYjMAhFRFTf
	kPm1o8FfHMg1kJjp2KGA+d9/7YwueX2QS57cvpLPqSPniH0Y1/s/fXf9Ctw9PmPg4Rho3wIES5o
	ATJH3+46Pyn9g2eo+hy4Xd3KJktzpc3B37IjcEbepT+Bfcr59ax4QZ75bpXNdaDQKh+uW06Luks
	2mwZunuD9KHZWj9UF1Y6MMq8I1Z/M6pN0rwZfv8WZGPJz5L/aTho2PR3gGgc/hDsOJexu44O9c7
	R+4t2LPavUFCpUh6DpLy1UTxqPAB2/+yIv8VvO8+c4kwyJDt0tkFoVsrKHwh5wXJwzbjeLvYsEn
	s/d/PyBndlLcTKnXhjyYzb5brEfT3IJiBF0DNxAH7raA==
X-Received: by 2002:a05:600c:3e10:b0:485:3428:774c with SMTP id 5b1f17b1804b1-486fe8b0073mr521675e9.4.1773938916334;
        Thu, 19 Mar 2026 09:48:36 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm5238505e9.0.2026.03.19.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:48:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] drm: renesas: rzg2l_mipi_dsi: Move rzg2l_mipi_dsi_set_display_timing()
Date: Thu, 19 Mar 2026 16:48:25 +0000
Message-ID: <20260319164833.409126-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.4
Video-Input Operation, requires display timings to be set after the
HS clock is started. Move rzg2l_mipi_dsi_set_display_timing() from
rzg2l_mipi_dsi_atomic_pre_enable() to rzg2l_mipi_dsi_atomic_enable(),
placing it after rzg2l_mipi_dsi_start_hs_clock(). Drop the unused ret
variable from rzg2l_mipi_dsi_atomic_pre_enable().

Fixes: 5ce16c169a4c ("drm: renesas: rz-du: Add atomic_pre_enable")
Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a87a301326c7..ff95cb9a7de5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1025,29 +1025,33 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
-	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
 	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
 
-	ret = rzg2l_mipi_dsi_startup(dsi, mode);
-	if (ret < 0)
-		return;
-
-	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+	rzg2l_mipi_dsi_startup(dsi, mode);
 }
 
 static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 	int ret;
 
 	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		goto err_stop;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
+
+	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+
 	ret = rzg2l_mipi_dsi_start_video(dsi);
 	if (ret < 0)
 		goto err_stop_clock;
-- 
2.43.0

