Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825138;
	b=wK4ZMxc7xFQK3HoYBxcxVh1wInIhR3UxKIxbEkKKi7d/Ud2IGchqk0UPanrvS4+EMsCC
	 JdOKRv8LRmlLxlekBEPLdkWGLwAdheK16Uf2xBYSUUYHd94iXe6DW+Kxw+/aAAs548bLg
	 ZMzE+rYZu9HF4z+oEtDWHN/Tcvi09bOGUNIQke8ARQuEEJqJUZSk2XK/SZehnrS3G/ZEI
	 vzvEJSqHHMoG8XJx6nmRbpkCOTH/HeogqPNmNUiqS81FXN168sSadEre6bm+NZZNaI4Il
	 P0jipbPjZXp4AmhqDNUVZ7b4GFLfhxpNly5ZUSI4V1X7/oTudaIuYeP6//OHIm+/Ojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825138;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rG/bU2F6Yzq9+IoZRAWFbP971HL865rSzgbZYJPcgBU=;
	b=KEhQF9JYglADDEm+RlTcm3mPL6ZN6gQx07mNv3N9TO22RrJEzpPLQHBaGwh4a7Bq+NPY
	 GnyPLDF0pXlJZohi855KJTA5ZXoBSOGtl/cpQiBH16Osdw0AZCjobrMsMqrhZDOdBXHtH
	 wyrWvqMbzSn2/HumnoJ1V0UNzicx3gsSXRMNahj+rV85ORXkiIadWnl0P+tzL2q2VWR9a
	 ims+ptnDFGvdU956V7hgCl2F5UJlK3bT2N+OFrdNrcGbEKN0lTBEtUCKpD++RI0Kaus+N
	 Mr5Bab9707yYEcu/CrZ3+blepTAI7juWLYXXJ7zkCOF0EADxliszm3MOGOJGzQ1aLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQLTMg4c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47103606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQLTMg4c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ED41F000C5;
	Mon, 16 Nov 2026 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825138;
	bh=rG/bU2F6Yzq9+IoZRAWFbP971HL865rSzgbZYJPcgBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eQLTMg4cLPxpXnQot+3Td6dMysmF+dpC9moH6yefAJTNrpscBZvrg18rdx0gZazgY
	 hidtoMfYKrV7Isj5iiHe18kj9wQH8Hd7yHbfhNXIBvqWjqErDY3885mwX2y1G75Q7k
	 1ByhvYmTxyqCNE6dtdqWzmVEbhQjpE96bz9dznhB9gp+zAKBcAEVNcVmGoPEJCwg6M
	 2imYIy2tQe0kFO8hLad6cTle/Nvk6l/k6C5IDBF+vCDQU67xhF/TODfF7+1CiBYVug
	 +p/STxvPYEFtXumAfP1Xm+oS9CiWoBqSp+YyVl6Ui8wk4N5jW/OyjZ0C6nXWRCOa0S
	 3mk1s/4E2H2XA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:41 +0100
Subject: [PATCH v2 25/64] drm/rcar-du: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-25-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=mripard@kernel.org;
 h=from:subject:message-id; bh=z8r/ote5eF8WbVQfXs68uTr6BhTZMLrQPmV8XM/1I08=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bnsfvmt1KDjCfXLj3x2X9i6u/6S2fdN+R7tH0zTX/
 NjxzPv17Y6pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwEY9fjPXOV/cez3arLFYO
 9drz81bawQs3+hckTvv61PbQ9FmrUv4L9vzQN4lUCzy2Zh2/26S7vh8Z6/RvLAuKW7FJqklbIoz
 3/4WEnYuflP167cGVdc6rPYVjxSpO1oYivqOaq268TXZqdnt+FwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 9228a7ad0dfa..7fddde804dc6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -1000,11 +1000,13 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	 * DPAD0.
 	 */
 	dpad0_sources = rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs;
 	rcdu->dpad0_source = ffs(dpad0_sources) - 1;
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(dev);
 
 	return 0;
 }

-- 
2.56.1

