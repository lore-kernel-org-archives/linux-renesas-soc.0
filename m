Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEEF48664D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329736; cv=none; b=nP8JefgnsN/IdEnI4JFsdQWh99sjjp6Y82HkQo7s2GEMrtEDHUCuOPnZRGNxUol91x9YzeCjl7gXKW5C9VEj3Xf86o6RmPmTlkT8dFCW7vNdZbxVgy1FSob+wZFAsG68M3/x2w73wC9sWI4Fx1DggdBdL+wMIBLZeU614wAvEvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329736; c=relaxed/simple;
	bh=nFDTokdTzSnk3dYxC8vXcYNmgr6mL9ha1YNjZgIPwa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyJx4maq9SGvPVDdlzO9O7jaclRkvAKwlNqKDmjmWt3AVCNdqAUA6dlXu1LzOOO2YmaeR/MwvllP9V5OpiyNYTAs44lJRwLY5M+onF5g4arUtW7JyxDiTr9GiGXawG40qVaTaABt4x691MhZoXqAZu9JYaODLE+adnCh6gmkTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnfSAxp9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnfSAxp9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so8750765e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329729; x=1785934529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYVvwq9bkcr7dWFtqsKXO/Zg4w8BPgRwuOwPLtEELtU=;
        b=AnfSAxp9cSsC4HnceE36V6+5pXKoFC8dWDEqaQH1ozKQqQRf2q5Wf5d8hQ1s2OK6aX
         UgcA3jmwW891jnynrxJPqq8akfBCFFqEi6RHdvMB3uDQM2ofZ66BQkvi3unz4nQLELKT
         GO8PfsLNDbIaboiVMr7+K7kfOCaTxwPR0i4iPJ2oZzkOAgzeGG25SRf5iadFDVNVKN1U
         xyRBe9ZU+/wEj90rVmxON/4+PD2oKVCMpUSDSDBD1nJiuregRShle1/83DChAHcaikcm
         2JLQ+Nd83TVYAknMCgpYxWwNrl5y8ATfE4JaELV1rSgtFNl/x2qtR62AooKhPkGUNSVt
         w7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329729; x=1785934529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYVvwq9bkcr7dWFtqsKXO/Zg4w8BPgRwuOwPLtEELtU=;
        b=U6ipXhK1Yr1K3ZbSwk2dI7Q/vLpYSnHCA+T2L5oc88Pt3Di53xebrSHp2iGlfzGOU8
         pEOhh+1uRHXrMMPelDkH3m/VsFHfkjY0aMZe0jJNN5xOWXFe55hV91bsYj993GwL3WVg
         le+7Vbc8bq9VJQ5/18Imj1E3dlJ8U543WJncBXDlbZ43kV1fEETDKEXkgTNVxrNgsgKn
         0A0dBYY2aaNKNICM+yQNO5NNgHFxXTT+X2CIusIYVq3PVW6DEDq6PhXn5KnI9xx/8dF5
         mIJCVXdjAWPXpxvhbc/bN++hzFT1oxKInwjrv0gGKi4jornCcpu6dYO/12eQu/HdXv8E
         7jXA==
X-Forwarded-Encrypted: i=1; AHgh+RqBbV/d6z9yxB41yVakPkgitONp7Vs4jCO/EgG4s6RG6v7j//cwcGec9k6TmjY8qpZ0tjOfnSsLGBoO3rcAbLF6AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCmKERWUyc4CSeEvOnjijS71Rg/LQVRNtBuA0SQ3Tio0TUVpfH
	arOfCVrpIJUHXfvWoAUoMIvr91DwXdLPfdyFOub0uZfgL/L/HQFjLLKO
X-Gm-Gg: AR+sD12Klfgjr3biCzv74iYB22c8XVHBcOGKI3wHnSQG4RdOdcXMgRzKpipiHRvBEEy
	Pd9ZcYpdK/vhAuS3x+RIUdy9iN6OW2wy7ZQGupewyY9YKvucF0ANnI5cWSnpTbiqBbWTmlYhRte
	VL7umE5jRAaZ77C4MrA9+XtE/12N6c9ufvepX1OGgHtOGcH9kxdXfu/EeT8KIXh4EumSDTbXH3n
	hmEGjSVhqEUP9aBpXutocKzt+P/uIsQQWZHnX4UxR4cKad33n8Veb9KYcnyrI9sLQsw66yP4Snj
	ch1bVU6BDcz5lvUMZp2w0bv2ztBCClDFSKBjB5HbJYKE1qBr+PDZ5pS8//sTpNbQro6Qjg7jIOP
	0g4c7sPxcpvTo/v6IPzWfc9Kt21veY3skzP9Q2ngt44eHNGYiftjSZARsWoM4O3pWn14sVhxCyH
	g05WWOi/h93rqmuCt0AZFp7751lo+Lk78voqOfRNqJttMMMcXfX3sxKbNeLa5zgJgUp4/EtN9D9
	Xsey+eI4qivnw==
X-Received: by 2002:a05:600c:6992:b0:495:5022:71b9 with SMTP id 5b1f17b1804b1-496c658efc7mr69801845e9.33.1785329729219;
        Wed, 29 Jul 2026 05:55:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 04/16] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Wed, 29 Jul 2026 13:54:56 +0100
Message-ID: <20260729125516.230757-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move rzg2l_mipi_dsi_global_timings and its array size out of the hardcoded
ARRAY_SIZE reference in rzg2l_mipi_dsi_dphy_init() and into the struct
rzg2l_mipi_dsi_hw_info. This allows future hardware variants to supply
their own timing tables rather than sharing a single global array, making
the driver more extensible without code duplication.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1538eeece2b5..180384c10264 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -54,6 +54,8 @@ struct rzg2l_mipi_dsi_hw_info {
 		const u8 *table;
 		const u8 table_size;
 	} cpg_plldsi;
+	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
+	unsigned int num_dsi_global_timings;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	u32 dphyctrl0_init_val;
@@ -488,8 +490,8 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim3;
 
 	/* All DSI global operation timings are set with recommended setting */
-	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
-		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
+	for (i = 0; i < dsi->info->num_dsi_global_timings; ++i) {
+		dphy_timings = &dsi->info->dsi_global_timings[i];
 		if (hsfreq <= dphy_timings->hsfreq_max)
 			break;
 	}
@@ -1519,6 +1521,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.cpg_plldsi.limits = rzv2h_plldsi_limits,
 	.cpg_plldsi.table = rzv2h_cpg_div_table,
 	.cpg_plldsi.table_size = ARRAY_SIZE(rzv2h_cpg_div_table),
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.phy_reg_offset = 0x10000,
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
@@ -1530,6 +1534,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.link_reg_offset = 0x10000,
 	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
-- 
2.43.0

