Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F63C2793
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750979; cv=none; b=rBvlMwGMhPHHpLnt9g2k4jU2JWH0oRKUKQswnT42He3X+qRbLnkIdR1QOUhn8XNSW0JrFk/4YrlrrQBPKb4OUw+V5FaAzC7zu9/aOttN0uAZMcS2QMbpMPzRE5lvbnfdQrKIsMUfVyv/Tr/yBO2GvwqWfYzWiRiCAt7H4y95o+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750979; c=relaxed/simple;
	bh=GQ6eY6wPvwBwewlk230X6y3WnNNRxpcCdXxiKmJicDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LD0e17K3VLCq5eVPID95pyN+y7P4x3hEnyym/YUEFjEt++Bi1mWjYl3tIIww2oKms36pjMsT6buP9FJ2BnYMESRox+om0HSlaunLShhwjbtQlMUGH/3ZVSjgF+K7jiiEeALrOwYmwkj2ht2EIkPT53ec7lvJ1vNe+oG/UthPAZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRsobxkU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRsobxkU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so6396836f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773750977; x=1774355777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQxsks4qQJSghSnSeuplqVJSA1aqWlVuszgwUX8HH+g=;
        b=PRsobxkUU0rVuLUH6PgQmPkxEcSFl+O4ufEkV4fnndD3N4Ar3law/zbRqqS9knbtQa
         7cARkfPB3SlpdOChO57mgziZWYzujCfraC4pk8AigUocGiWLdT6yMKf2PvgRorxczkTN
         9515GhbM4dlLkxYl5oqcl5IeCOyrYqZArvWz261vzZMWPTuSO1rzTFLajI08JIqxPtGV
         ztd2I+b9MiX1K5PqRiYSO+pwz08WCs9yr7MqffsWAQXeUzzkL/ixxxw+xMjms215ggCe
         UZSvTtKkkkh3arM3PpyP2KEvIZgqSCcHtnqlhPEdJPYtQNCONofJHJgh90+ZMlXf37O9
         VrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750977; x=1774355777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQxsks4qQJSghSnSeuplqVJSA1aqWlVuszgwUX8HH+g=;
        b=Fxyu4CPcgOZHoYDK9wEpyjfz9nRCdc170T81OZ459aSSQQZNDhHjqZA8yF3n1WK2K0
         EOtwMV4bCpJvytiCSGaFgdEdJyCzDauQjTMhhGzLAJCmLSJhRThVaVRmiennrjcglPmB
         q4Tq66HnLwQst31iDiY4XojMu5CzBjKKnkVD6XT4zPKXUkBAupwXQqBI4y03yMUek+AO
         P582Mh9U2XpkfE4tvFy+OEst9gNANH8B6SXRWuULGPrlPevOfpkjHGNwZSgsJhOpceZT
         enSg5tbjKbaCST4raeIRKiBQiVpZGcGWV+D/RSY/lbVIK8jgxo8bTTcWshmDsCC2CMFF
         y76w==
X-Forwarded-Encrypted: i=1; AJvYcCXfseLePa7iYS5Uxau/L/NHZtK2abUorsdyUM98+EKbdN5dl1QCpRXKaLGL8mw+7V5QzJkM2mT5UMeuUlYQd2TjHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJeb4EIaMAu+08kuzGdVk4vsiF5pFQBUeenGrwdEcllhEjvTv
	lTuA+33r8fign1M/vjRbLbuXJYTi3XXpKOjNLNLrbkzXn4OKrx+AMtmt
X-Gm-Gg: ATEYQzzEjHYcmqV+TBIIDZSFX/Qw5OPnd6CkDz7x5utPXekDQogJ0laggaWPCYGULz9
	zOq9OO4o4h+Drw8H4OBo0sshuSwsdn6PgOVeGqFH9LkjxxShkfEfZ+NOIzp95Xe8eApBNm+V/Tz
	ECzOrmecY4ADxi1/AoBatZqHIS/PoDSHXXbjtE6NLP/y9P1I9cFCBY3xIHTQdRs5IV5cg+8g6gu
	QKR1WE/ySkzPa3tgolVuWlVEXIICX9aXtrO4r81JdLTQ5VtzwbNC4s0gl8SgYrdK58zIsbrQ51h
	MUbGaxqwv1WSN/QAF5wljZerNvF2L7dDo5BynS3h8aFt5fBi5Jb7bD4vlBruNQHedUA/MhmX8dC
	ZNbnLqe9TtDM2htjebgDZxzp2IKPE9lvwpCu5/fdW+21+UTxH/SoELqQFMME0rfSnMP/dPULeXq
	Ft7NkbuIiEkpo6IRsJyv9h3sesCGtZUOadHyGTYJPq+GViqICB
X-Received: by 2002:a05:6000:1843:b0:43b:4352:1bda with SMTP id ffacd0b85a97d-43b43521df5mr14593796f8f.3.1773750976385;
        Tue, 17 Mar 2026 05:36:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4f845841sm3247444f8f.11.2026.03.17.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:36:16 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on sequence
Date: Tue, 17 Mar 2026 12:36:01 +0000
Message-ID: <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move reset_control_deassert() and reset_control_assert() from
rzg2l_mipi_dsi_dphy_init()/rzg2l_mipi_dsi_dphy_exit() to
atomic_pre_enable() and atomic_post_disable() respectively, and move
rzg2l_mipi_dsi_set_display_timing() from atomic_pre_enable() to
atomic_enable(), to align with the power-on sequence described in
Figure 34.5 of section "34.4.2.1 Reset" of the RZ/G2L hardware manual
Rev.1.50 May 2025.

According to the hardware manual, LINK registers must be written before
deasserting CMN_RSTB, and the 1ms delay is retained in atomic_pre_enable()
after the deassert.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index e53b48e4de56..9053ce037b75 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim1;
 	u32 dphytim2;
 	u32 dphytim3;
-	int ret;
 
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
@@ -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
 
-	ret = reset_control_deassert(dsi->rstc);
-	if (ret < 0)
-		return ret;
-
-	fsleep(1000);
-
 	return 0;
 }
 
@@ -541,8 +534,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 
 	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
-
-	reset_control_assert(dsi->rstc);
 }
 
 static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
@@ -1030,24 +1021,37 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
 	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
-
 	ret = rzg2l_mipi_dsi_startup(dsi, mode);
 	if (ret < 0)
 		return;
 
-	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+	ret = reset_control_deassert(dsi->rstc);
+	if (ret < 0)
+		return;
+
+	if (dsi->rstc)
+		fsleep(1000);
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
@@ -1074,6 +1078,7 @@ static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
 
+	reset_control_assert(dsi->rstc);
 	rzg2l_mipi_dsi_stop(dsi);
 }
 
-- 
2.43.0

