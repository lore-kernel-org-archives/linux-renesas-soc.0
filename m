Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726471;
	b=rzMPH9gkmoduCEy66lK94zKGYHKwadEQUDhYBadQ9B2S30K1xk4zgrwJf2dASflfR4RI
	 3uPM3Kwf3AIBMkPKyVpZfH0R1Aw61AkO2aJFyesLJ9d4JVcCspAAGiVfsMzCgFM6V80FP
	 xWsrEGFpuZnHGx8+X9ji5xzOPOYyhSRMg6EYx7ukYL8LPpTtVmNLNwEo6o/CLq1NlIzHB
	 1dPipb6Dnv2wEKE+ekl16gdl3+ukBLAzo8tyU/YR4qYomVc8VCfm3h4r8hN8a+DiDihlV
	 arXv93hdIKomDfje5BulTA1ICYWT9XU0tw0Zd+P9cSTLbiGML5EL31N3F0cKT4cu5yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=y82kaLlVdTMG/Dxoi+XgELgK4jbU4ivpOZ2fmcDfzkY=;
	b=t7Ry8qAqwKB8liMt2XSO4b/dcEjokH9sWz1blc0UXfSxX4I3UpU+Ts3EZFlnJQQ4X4qH
	 Hi8TOByfcn9jXXxqae0oRf7QAIb4+9oG2gobU4TF5Oew/rjKVyh6hq6aUXWFWhXfVALUO
	 5+7LkMZmc3Fbg808oz7gvAOWVZovxAf4hJXsdASLbHb0AEEBzYOM1fpncZzhzqBLkaew0
	 TcYoZvU6Cwws4wpo8OcsjkA7GT3ifw+vVhzoE0iVFX5LX3peWOFV3wrGJxwqC8vbx/Sz9
	 DKfntZoheOAj6SbVaJslThfD+mAtv+ZeG8z9rREKHAN9Ecg8VJq+il7G6HAMOgVIEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldQsDtoh;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F9606D81A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 17:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7F9606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldQsDtoh
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so49275635e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726469; x=1794331269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y82kaLlVdTMG/Dxoi+XgELgK4jbU4ivpOZ2fmcDfzkY=;
        b=ldQsDtohDharnYy2z11zHwwe7rswcAqPfTfDw7574RAaaw8KeHx16iImp5eiMDf2pE
         upkLRmjleABpNwD91UV4XrPtrNf+nmTYgaPJkmAW2Q8vw3J++DQm+24OuVlGAAMWaaiP
         QQdC2+3YIJ17Zqwn9drO/Z+xvHgbuXPw4dPhXdnO4ot5K155EKEie7ysO9gHSV+TtJEP
         pX6g5lTX0j0O/P6V0IYGPIgjzdNbkiSmKuxyx+QUzo7HLM01KuSU2POBVFovBHu9qaM4
         fa8OT1SxUKvsK+cnxlU2FEUBT25RbO0e/FbReyIyinzPYyBNZqBezvrwBL5kTwUuEEz+
         LUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726469; x=1794331269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y82kaLlVdTMG/Dxoi+XgELgK4jbU4ivpOZ2fmcDfzkY=;
        b=ziKMnTGLLV+KR3RD/OUHBbmKJ/IlxEzc+Zeit0p5HWV7PPmJvRV1QssULga4XboYTs
         1A8KvOK46fuHLuDi3GsNUS8e/F4SLzCbvHQAKul3/uZffIPWREi1jjOyb0Ak9U4HsGCP
         ZXC38mzS0sFkMO/OIckDG+Se0tzxI52Kjei+HgIOI4fV38TT+pnmUa/QAB7CHX5cm9Dq
         z8m6R0vBM2yNV+qJ4sf+zHOEvtNr1mIZ7KV6+2BduWihXH5R7dSRsn3tve3p5BBQKBwg
         ZPzCaK4xvBM5G/7XnzqtYuh4orf9xhgTdBSzmyhi8sJF8Mx9/0dhQY+noL2n4vgw7iBO
         V6DA==
X-Gm-Message-State: APuU4Z+CQmk6SLGNnpFKRBwuny4qOIkmKbOVEEzqlTi9LZbSa8/sPtrt
	W1hg5oYta3hriPCeA5M5/S9YYAsAXBhrj5MWHupS+bqEZuPA4VWL22J5
X-Gm-Gg: AYBFou0rzJ8i4IIthTMTgmp6kwLsSaCauOoqLxm4UeklFwRcziAfza68wWVbkyUb2/c
	2Xp74smP+kNCeLEz69wzVm0lJH431BldJPI8u9nxwxjN5y3cXB0Y0urhTJKzrrY5uSCX1Gl+5lm
	az5uCUMoPH6tNB4jbr9+rss2PukzDH/mlj4MB3d5kZXq02v+74glCENZZmDSLTsAGQ6JxaXz8mv
	eebyPdK8x0rANq0zGbRBK0E5iMIHLOVxfGWSQugWMMPIolzznl3O8Ay5Noas/xnCt+2+v+j2SRP
	iVtDZfK0UGjQXTSiquZOQP+Wm12woTmjRxAc56wZthELc4Ysrr3RPtT2s5++tWpBRrQ9QZYz5Bf
	pXqRDikqlZ2glr1raZ7js3MLqLNyxB8/ehZxU7R4qp7v2vtHm08ADV5VF5kpIlyx0ZDArHDKAQR
	5g1epIU2egYoJ2xIF/uD+kfz9xUclHMWrPvAXFqWK0nFCjrCbpzjT51j+ENb2n9Ko4QpqyqMU43
	UbQScODwWPwXHfX6Q2K7qkOXmg92Sz4GZrdFBMljo4bEbkChfUjqZW4HOLNhLLtDhFP/aF64m3y
	3LZ+96egLecFyLIAxiAXEMrJvSXAXV/h5Wd6aW2H0L1d7mxnspa4DdG5sJkhyR7Q22rWN3FI1rI
	5KJWy2+kwfRq1pX6c+aPvYXz3E77MgxSDlCk6CpI=
X-Received: by 2002:a05:600c:674f:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ac1228a434mr330482525e9.0.1793726469286;
        Tue, 03 Nov 2026 09:21:09 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:08 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 4/4] drm: renesas: rz-du: mipi_dsi: Add fallback CPG PLLDSI parameter search
Date: Tue,  3 Nov 2026 17:20:57 +0000
Message-ID: <20261103172057.617203-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For each PLLDSI divider, rzv2h_dphy_check_instance() only considers the
CPG PLLDSI parameters with the smallest frequency error. If they do not
lead to a DSI PLL setting less than 0.5 Hz off the required HS clock,
the divider is skipped, even though a CPG setting with a slightly larger
error could work. Modes such as <mode, lanes, format> are therefore
rejected on RZ/V2H(P), RZ/V2N and RZ/G3E.

If no divider gives a usable pair, search again with
rzv2h_cpg_get_pll_pars_validate(), accepting CPG candidates up to 50 Hz
off the target whose DSI PLL setting is less than 0.5 Hz off the HS clock.
The first accepted pair is used, so the pixel clock may be slightly less
accurate, but the mode can be driven.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 85 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 682bbb339bef..c23c7f43a560 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -42,6 +42,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_PWRRDY	BIT(1)
 
+#define RZV2H_DSI_PLL_MAX_ERR_MILLIHZ		500
+#define RZV2H_CPG_PLLDSI_MAX_ERR_MILLIHZ	(50 * MILLI)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -76,6 +79,13 @@ struct rzv2h_dsi_mode_calc {
 	struct rzv2h_pll_div_pars cpg_dsi_div_parameters;
 };
 
+struct rzv2h_dsi_validator_context {
+	struct rzv2h_pll_pars *dsi_pars;
+	unsigned int lanes;
+	unsigned int bpp;
+	u8 base_divider;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -675,6 +685,67 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
+static bool rzv2h_dsi_validate_pll_pars(const struct rzv2h_pll_pars *pars, void *context)
+{
+	struct rzv2h_dsi_validator_context *ctx = context;
+	u64 hsfreq_millihz;
+
+	/* Check error threshold for CPG PLL DSI */
+	if (abs(pars->error_millihz) > RZV2H_CPG_PLLDSI_MAX_ERR_MILLIHZ)
+		return false;
+
+	/* Calculate the required DSI frequency */
+	hsfreq_millihz = DIV_U64_ROUND_CLOSEST(pars->freq_millihz, ctx->base_divider);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz * ctx->bpp, ctx->lanes);
+
+	/* Find DSI PLL parameters */
+	if (!rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits, ctx->dsi_pars, hsfreq_millihz))
+		return false;
+
+	/* Check DSI error threshold */
+	if (abs(ctx->dsi_pars->error_millihz) >= RZV2H_DSI_PLL_MAX_ERR_MILLIHZ)
+		return false;
+
+	return true;
+}
+
+static bool rzv2h_dsi_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					struct rzv2h_pll_div_pars *pars,
+					const u8 *table, u8 table_size, u64 freq_millihz,
+					unsigned int bpp, unsigned int lanes,
+					struct rzv2h_pll_pars *dsi_pars)
+{
+	struct rzv2h_pll_pars temp_dsi_pars;
+	struct rzv2h_dsi_validator_context ctx = {
+		.dsi_pars = &temp_dsi_pars,
+		.lanes = lanes,
+		.bpp = bpp,
+	};
+	struct rzv2h_pll_validator validator = {
+		.validate = rzv2h_dsi_validate_pll_pars,
+		.context = &ctx,
+	};
+	struct rzv2h_pll_div_pars p;
+
+	for (unsigned int i = 0; i < table_size; i++) {
+		ctx.base_divider = table[i];
+
+		if (!rzv2h_cpg_get_pll_pars_validate(limits, &p.pll,
+						     freq_millihz * table[i], &validator))
+			continue;
+
+		p.div.divider_value = table[i];
+		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
+		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
+
+		*dsi_pars = temp_dsi_pars;
+		*pars = p;
+		return true;
+	}
+
+	return false;
+}
+
 static unsigned int rzv2h_dphy_check_instance(struct rzg2l_mipi_dsi *dsi,
 					      unsigned long mode_freq,
 					      unsigned int pll_instance)
@@ -718,8 +789,18 @@ static unsigned int rzv2h_dphy_check_instance(struct rzg2l_mipi_dsi *dsi,
 		}
 	}
 
-	if (!found_valid_parameters)
-		return MODE_CLOCK_RANGE;
+	if (!found_valid_parameters) {
+		parameters_found =
+			rzv2h_dsi_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[pll_instance],
+						    &best_cpg_dsi_parameters,
+						    dsi->info->cpg_plldsi.table,
+						    dsi->info->cpg_plldsi.table_size,
+						    mode_freq_millihz,
+						    bpp, dsi->lanes,
+						    &best_dsi_parameters);
+		if (!parameters_found)
+			return MODE_CLOCK_RANGE;
+	}
 
 	memcpy(&dsi->mode_calc.dsi_parameters, &best_dsi_parameters,
 	       sizeof(best_dsi_parameters));
-- 
2.56.0

