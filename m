Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C647042E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766561; cv=none; b=LZKWiXky96L8caaBffqtZ85dRmrv5gUK9DqeDfcWtJY1hQ5tuth4/Mg5lXAtlCdTeC/oUu8lrXD5Pva0r8n2hJPPhLTCSXU8J2t6+8iP+Q9eWodDfGYVpze3Ey0THsT8zWJmzjtu00PSydnLR5kR3TVPTUv1+dL/Wb07TdZVTGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766561; c=relaxed/simple;
	bh=uhz+aETG8muM+OaL+7Y3gQD7N+nO0gC4WFUbQR4TZ2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niOwHm4gPfj4VegR1gQrSXBytmIdn80bvwWrC8aW+dTbePFe/kwGVWGZdmQz+O5fcixgOXZuqogBZVswMSHzgKGBVgrtDWSJsHmc5Yao6N1YYPi28duxamOEh+qsHebdGWWtJIXw0ydaV4cHNmonWM0nlFLvsFtq94xCwPLqhLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWCw/Urp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWCw/Urp"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso199586866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766541; x=1788371341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdCoo9ded4E53Moqvr4ZcBU+4FPafYbozkQJvalYbuE=;
        b=rWCw/Urpiv6WhZtlffK0Wdz4TjXQz9E7iDsnkZyFtFmCpfwULR4tEEveE1FVWYY3eo
         AQfQ2BMnLFiZkhagbftVSDojZAh9ovCA29B7SZoUMhWTOAfv29GWO619QBVx8Kl/usGa
         /NlukMD7LTWpHJFlMP4a3qPLoCGAUOZiEh2h95jwO85f/++CV+z+Q3Kgwfr/vsPuYDme
         I7Kn3FE4Ai67BVVXeWas0JZ3JO8ePR2Et8YI1vMrz94Xs0xfIouxXDfrrDpbT4+rJVe8
         bZ/eq1UDW/jUHowHeQTKlfd9vD2GtbsaWpCIWRgESp6yDOP3QmKBwich1l4QneIwXPYn
         nOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766541; x=1788371341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdCoo9ded4E53Moqvr4ZcBU+4FPafYbozkQJvalYbuE=;
        b=gM6zDWu7MnDm4IXXLv54qk2nXoJf+4GOpwML7aoAYxCNMwsgaFuOSfSrzA8tHY1U9a
         3M9MrGSHOfEowejtfuXY1njaIhzYzvcgJvu8AxTlKdEyNlkEm5/6nrm3vkpCAWgfNkSZ
         DWc3ZbLvzkRYyRx1z+je/Z2FkWFqnDHeKwlsaZZ5tpXIglrpIihkVGTWRca+GTEcLRUv
         Tme59dDTCydZvmWxr9Ejo6Kk+VRICdhHeTXLwzrst1/psS4ySfwGuqx41RtQ8M3theSP
         y/9YAJxcJkkgdtrpJ0gId8pXHW4//LFIbxUzV8DTlKX5tcAPzO9XkTrtQQFKLm4rJsDB
         4XNw==
X-Forwarded-Encrypted: i=1; AHgh+RrOdTG0FR1Gphh03g7XvEOgtidCGgoQakMD0MabB1uq73KOhrJbB4PadzUJj4tD37w66MR3TfLlo3vL6BCVy2eUeg==@vger.kernel.org
X-Gm-Message-State: AFuF++k8QHCM8lyyh0CyxE/x8GAS9e0y6yqdgDhg2wqNpF8BSEXz7QDi
	0wn5MnslnA1spBcAqziLFvp2scSQMtlDyc05Ldie+IZbwfEAJ19zqWOaauHntw==
X-Gm-Gg: AR+sD12XDmDViIm5mVGNGHAVdPvNU5feOjPN+huiKdAbfmi2HFee9ZOB0BbZXmnUhPs
	JOFccwZd4WiLSdsxG4KguH+veP9LnxgZUOs0QJ/XAkmOdXyhfZ+K5w/GuPX0ywRI/UHD81OQ1d4
	Jj7l5XfOnsIlaVIutIYNMmBCFoMs3LqIpOR2jGCKcbBC8QSABhMZ4suGFMYHuwBGV283r3m1+G1
	leSlvzgAS06rNSS5+Nd/IAF+H0Yd/E+JHuC8GJl2qmtf3HyjvrCrxAcI/jenS64bqAkDffaoyMA
	tBV53jTfboRvg7NeBHjfl64G8Xywm8NwVeSsLYG5sRaWwH6GjUDT+eqnmsnrG83XXn2IXZCrzkV
	lyJoTckr/HSnln4nYBUVF+P9T4S06Gl+PHk1oEISmsX14VDokM4eSzvHuegRd1WB41fR8Qf1j/R
	Bl65EpP985URKfAqhMH2ErUiXown7/JO1CvWkDxfJG/VjwQaK47eWACB0w8H308zQVd36ljQUJ1
	AxeZHtKyPF9Xg==
X-Received: by 2002:a17:907:9616:b0:c24:457b:86fc with SMTP id a640c23a62f3a-c250c329bf3mr831430866b.21.1787766540789;
        Wed, 26 Aug 2026 10:49:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:00 -0700 (PDT)
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
Subject: [PATCH v3 03/13] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Wed, 26 Aug 2026 18:48:37 +0100
Message-ID: <20260826174854.199139-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Dropped .dsi_global_timings from rzv2h_mipi_dsi_info as it uses
   different path.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1538eeece2b5..d67e1230b70c 100644
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
@@ -1530,6 +1532,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
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

