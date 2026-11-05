Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887811;
	b=Okn/7vnEKkrqkhaU8NsLb1U4oZE/h6WPPVCDcAizcLzJDNQrBUEhauYDeu1GlqrTR6AE
	 hf8if+JOi6TT4LVbmuwaAC18jUqxlLiBaeWXABpnWrTd54CKch17kAaDHDn+33dm5B8Bs
	 pihAyfCfsAmuR1VaKn6qfet72iLSsz8otjYDfac04QnH9ddoDcYk+cCBG/b8Up6aDL793
	 NFDHe2bW/1pQA46w2Gc0j3cQ7A6aiwPCb6seZHx2YdNi/p2VY9VuZv4sAZSjS+WOdD/rd
	 QdjJPq353cdwaAMFCGOU7OogtRQKMMuXVOJJuoi4Aw8PfXdQQx0n2jauBhLWQiLCZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887811;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=h7kXjIvaD9I4Ytlo9V6WrbW5s+lf9mwR20Esdy6Qa9c=;
	b=SJojGcrpTggwqIswzjRvfyeEnsBDqEMRBnKzToB7GStPeJMQpsJ/SI3jcUrpRdDCP9PS
	 PS98Ci0fgTQF722jadsXF06f4Mfd8icvUrxEb+lHgzSTn0CrtDqeOWsOlaRGVR8QD98xM
	 NDeAd7XEl2ZJw1HDsdRDFhYbRobkl1jlL4dsOx/k0Ft84zH8qrX8TiPThp6YgMjxtzPSb
	 O3QeghjWDfbRuPoP5ShaCUCpZm7ZVAWLmj6IF24XZ5jvfFrKfD2q+QqdZnaOokno4542m
	 P8+FImOGdktDKw0IDGLbUnXIjXRaVeYNsbx0+F3MrBDzpLN8vTGJwKHztP9puhdEwCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5voDAtf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD5606A33F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5voDAtf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02061F0093A;
	Thu,  5 Nov 2026 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887811;
	bh=h7kXjIvaD9I4Ytlo9V6WrbW5s+lf9mwR20Esdy6Qa9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L5voDAtfw8MAlzsA9uBQcMpOV0XkZQVkshO94WSGXZuvT24GSU5IVFybpCiIhLC9t
	 q+mg8zdeabEh8/XuMuGWhrowTlsMArnmgcoFuIaGnVe3J34a3TDLHCttSVO2pFHCKe
	 b8Y4akcOK8S2sDrhBY0MU0YTn4keCPIm0Wu3g7kcjMA+Owt/0Jtjwf+2q8EgQvCGdP
	 gGeKRPv/n3pkWKxfDSIuYBbfKQOwa6C2OM5g5rqh2yVTSPM1R/LcVYzPV30Xs3l2CR
	 T2diIupTkwbH0Ml+zcyialCJFpWlXiiuq5U7lp3cX0HhQF798ovK+Tz2Z57bpjmoif
	 g4BMh2kBZ1qQQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:52 +0100
Subject: [PATCH 35/83] drm/rcar-du: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-35-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hPGIK5YZmvGETlt8Fu9SkSwdVK9ySZ5w82wooG5le/g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvelc7ONyY8ktVweFc5skZkzd3ME/yu3y5j7H1x+OGf
 RV1Nu9COqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEXksz1nveahY7mCk9i6Po
 Xa3btBuqFnteHdjFHl8a2/tqyp13+m//HjY8lMBvvkix2t9768bLexgbXjO8eVSzgqF/izubysK
 ThQ9bnZ7YFSnYf9vDdu/Jg3NiT8rYD06VXvY0PrT/vQXnvRX/AQ==
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
@@ -1003,5 +1003,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	rcdu->dpad0_source = ffs(dpad0_sources) - 1;
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(dev);

-- 
2.55.0

