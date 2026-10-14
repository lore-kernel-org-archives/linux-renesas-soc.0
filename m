Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F7566C5F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999094; cv=none; b=AkZ8w1+g08eYcgdgIrrze4r6Xb3PViSF10AFnaghmj5XbFAzUZzYJ5rvotlRLJAco72q8fX/g3v8IJa5mb6y4IDgNlSuOOe6hCXf8mr3Liq2/UX46gWglmQovFukmMHmUpvroJQL+ylY1pYst4L84OnnNnn9L7AMf8CcgTFWuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999094; c=relaxed/simple;
	bh=MYIkx828+iYqOlN8q9Zu3es4zKKa/JAzzTsNY78kaBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXHbLPHfgURAHIMv9y3vm/CY0EciXUiFHotPeTZS5/GVROjRpyst5ns6t6oxSOvGqcL3Xg2vKV6A5KKJ1Xzd1IasYTTwDfdTAhOdkn9tIKjvJGlugLDdYMg7AH5rZHfcydOIiIVpaLnRIwc9qYua1a3Y3gQPmNQGrSUxI0J6/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6V4AieB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6V4AieB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D83B1F000C4;
	Wed, 14 Oct 2026 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791999091;
	bh=bbwJqYHGuLtdb28r5tBtvD8W5XMb4I5UaVBT0rr1g48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J6V4AieBqydVsDpPDh06jPLR6v/c/Sw9Gehy7q8rIwzAiL+raI1TXf4CPu/RR1Ipc
	 yAliBNT//ItxaCcfUgvvTxaLUttcFREDCMOaEcwgFOFe4Tq8zupdvhlWpElp7qUh3S
	 0t37JCPwJ7NzmaUu1oJ4Ey0TAThPqcaydkTEMSMVnN5pZ8y16dGThWKXJqTf2QgK9v
	 753fKE+WHcrmskY6LXK2CypIHp1SPmmWV/Z1yMZlwu7RCmfDuOK/8h2rjMBKCJAEUM
	 3HjPiublC/ALDIEAvkRlKUF4H5ixmZOX3uxU2EN5wxF8PXTZfEX7Ss7+wrSUA8Xu0L
	 7HuaCfDeJUJtw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:27:34 +0200
Subject: [PATCH 71/75] drm/rcar-du: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-71-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MYIkx828+iYqOlN8q9Zu3es4zKKa/JAzzTsNY78kaBc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnnd2ceLXqntLHIqrORX/lF8Hm11Ot/+x531/l82uOt6
 Vnenbq/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkIYKxPt011ky3+GZpSfSh
 x6+O7Dw4YxGTrZnBNJ9HMv++PZl6ot2twsLrwepv/0IOVrz5ZPmHh7G+bHr96/lOjhFePSa7Sr0
 yFx9w1l7h2X+Oh23+RX0WhcKfO1QV5i8S+em77kFw6qJjJkcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The rcar-du writeback connector reset implementation creates a custom
state subclass, but only initializes a pristine state without resetting
any hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index e5e6e6a156aa..9cb1af182fa0 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -113,28 +113,25 @@ static void rcar_du_wb_conn_destroy_state(struct drm_connector *connector,
 {
 	__drm_atomic_helper_connector_destroy_state(state);
 	kfree(to_rcar_wb_conn_state(state));
 }
 
-static void rcar_du_wb_conn_reset(struct drm_connector *connector)
+static struct drm_connector_state *rcar_du_wb_conn_create_state(struct drm_connector *connector)
 {
 	struct rcar_du_wb_conn_state *state;
 
-	if (connector->state) {
-		rcar_du_wb_conn_destroy_state(connector, connector->state);
-		connector->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (state == NULL)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_connector_reset(connector, &state->state);
+	__drm_atomic_helper_connector_state_init(&state->state, connector);
+
+	return &state->state;
 }
 
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
-	.reset = rcar_du_wb_conn_reset,
+	.atomic_create_state = rcar_du_wb_conn_create_state,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };

-- 
2.55.0

