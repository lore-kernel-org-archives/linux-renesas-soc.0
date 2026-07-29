Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4D486BA2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329740; cv=none; b=gLpuV4KsiK7Hhkw6w7uPdGYc2Cd0HvEQ39uYyFd9GyhTpnJ/PTN75NIU5kyz8JO32eVzTUH28d9yBFT42GEEAoMop1gUAJzMf4DiQ2rp3DKtTvx4foZ5q71WsLXVIrlW3wd6YK42RikjKUe+VHaEkuGb61XPoP5lXudq8ip+kBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329740; c=relaxed/simple;
	bh=/ML+cVssWUYPC4D/1JQz5EaDgS7FPAwXMH20yMY8x44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8+HxcJRtnLqgRX1tDL+gHoZPgEYir2h0YMwV7pyJRnmbp1xfnr1XOa8Iz8OEOHyl6VWUOxH9nIsXI0JhVIVsyafzELrlkqoSwRvdNmvSolZmwwLMEOrZVY4J31AJCUbu96Fx4NCIOvvBfyelcwbAYGQa9TAdpT3g1jy2rmy+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGHtrCFG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGHtrCFG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so738750f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329732; x=1785934532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhzzyg0xbZvJC/hGyaob+lgTLTfoRj2Ty2Bq5ZjXfF0=;
        b=rGHtrCFGIhc1wDljWUoScRKxsQU50B/JSs0pb4IaVjKrmDJUfDM20g/ifheMQnRzRs
         KSiew8GcWGUwizerdI44E0eiYei0Bmva70oXkKght/NrBifCJQhTM2rcwjopO/OrueDt
         RJW6hpg2qioUxngaYZs4Lfsk2X/7CxJiF9YNuIWZn120vg/gNpp3FnphWIPkibhkO9xp
         UUGLMm0s55d0v/PKEDAU9G9O7n99/uRCo8UheiUnjHWSfq9eRYZ9Be5PdfnQ09pErIMh
         puWOIMcI4oKcQivyyazxl7q1H5kNqEfKSL/YdrRplkP3UiBM7mKbqrukowPTO5L979QB
         8K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329732; x=1785934532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hhzzyg0xbZvJC/hGyaob+lgTLTfoRj2Ty2Bq5ZjXfF0=;
        b=q6aGsnriL1dsakJOGMPtP0w8410Poote96+8aaauVqQ4otTL0ZEEhmOVCvxHS+HoGO
         exhBGMIUArsx7iiT0KE/FfVHunphVABk7+LvFBCLF3/6Up61foJGIvjWRV4hyeR53EcF
         Y2kkoo/Fsu0AWBN2KvDSCQbbJLovZKQgwJdvM4yl1VhIxNhGMMOtAWUucGiM5ki2Sd8P
         p3KsbK7GYVVRuFpw2c/PmuU0+L7sUZCeRXYf8sWSMwipcjwfYA6W0Jpm2R4MfPoAGmz2
         GZAA6sgljDWN4t1uYSUazXTlVmmmGbcNlpBeEh0TIz7605yuzuQCK4J4noImPVD35Mo4
         dMsw==
X-Forwarded-Encrypted: i=1; AHgh+RpNxc/HvLaGXsBT/CAVOVP7vlxneax9lYoSehK5i7AEaC9zVJv4qMn4NE4VW4U8fg9g1TIobfpPgLnzkeRZ/9FECw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXJIuUlKxXm5Ihlyu9LyW9EQDJszOQ/g7jz53HMreAd3jlEAJ
	pMIirNZ4j8zUMQdE1NwSzgL/S+9dHOaFSmhMxWZZkG1jK/Sd2PdmQLn2
X-Gm-Gg: AR+sD11vO8dQSGBUYSYgocej3TvVM80Ac3dcyIt40tDkYUPXd9UrmhQ2bjDeKHmiQ6x
	mawUl/bx588iCdbKDbZlI00gLPhGy1Ehg32RMHEUvIcte99/lvPz2Z+at7uIQD1Fc8Yzq8fIQlc
	5yPio+jhXxikmTFJYGMiU8b4Zc0DHTqbMsyxluKG5U8sQeaixmX+UKQob2m0CsWhzFdgXQWdxCh
	2dmNIa3a48VTp9fHM6CLxYwq9ARLdWw5/0nweD/jNP/YWzaq4s/ubhy1SQC8nuzysQQMKeGqdSC
	Q3XhDiYaPVUsCFxkbhxJnsJ3QXJw+glt6CqLzk3NCzVKaoE43Oi0n9Yf0utSxNzN7eO1EFx4sV8
	x3ubXF8uCLGp3QykH/dadM+3+jYgl8Vhd7uLUm/c9sDnYES5770SMqXJRGwVErK1xxns8dvbfRA
	eTgPDGKUM39pI9vDvn9F5ihL2MiVl8I+BCAbg+1JDGuqqMutGX+4x/ioARr1eTKO+IavRbzKOg1
	WfxW8VMMS30dI1cHGKFdcObig==
X-Received: by 2002:a05:6000:4025:b0:47f:9108:59d5 with SMTP id ffacd0b85a97d-47fb1eab2e6mr8075833f8f.42.1785329732474;
        Wed, 29 Jul 2026 05:55:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 06/16] drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
Date: Wed, 29 Jul 2026 13:54:58 +0100
Message-ID: <20260729125516.230757-7-biju.das.jz@bp.renesas.com>
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

Add support for the MIPI DSI controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The D-PHY global timing table of RZ/G3L SoC different
compared to the other SoCs. Introduce a dedicated D-PHY global timing
table rzg3l_mipi_dsi_global_timings and wire it up via a new
rzg3l_mipi_dsi_info hw_info variant for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced syscon_field->pwrrdy in struct rzg3l_mipi_dsi_info.
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 123 +++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 7fdcee98450b..4759842a4d78 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -226,6 +226,107 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+static const struct rzg2l_mipi_dsi_timings rzg3l_mipi_dsi_global_timings[] = {
+	{
+		.hsfreq_max = 100000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 18,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 22,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 150000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 16,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 15,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 250000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 13,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 58,
+		.tclk_trail = 8,
+		.ths_zero = 16,
+		.ths_trail = 10,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 400000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 12,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 58,
+		.tclk_trail = 7,
+		.ths_zero = 16,
+		.ths_trail = 9,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 600000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1000000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1500000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 4,
+		.ths_zero = 16,
+		.ths_trail = 5,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+};
+
 /**
  * struct rzv2h_mipi_dsi_timings - Timing parameter table structure
  *
@@ -1131,6 +1232,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				      struct mipi_dsi_device *device)
 {
 	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
+	struct clk *clk_parent;
 	int bpp;
 	int ret;
 
@@ -1185,7 +1287,10 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	 */
 	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);
 
-	return 0;
+	/* DSI has symmetric 50% duty cycle */
+	clk_parent = clk_get_parent(dsi->vclk);
+
+	return clk_set_duty_cycle(clk_parent, 1, 2);
 }
 
 static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
@@ -1582,7 +1687,23 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.activation_dly = 1000,
 };
 
+static const struct rzg2l_mipi_dsi_hw_info rzg3l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg3l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg3l_mipi_dsi_global_timings),
+	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CMN_MASTER_EN | DSIDPHYCTRL0_EN_BGR,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.activation_dly = 100,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP,
+	.pwrrdy = true,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-mipi-dsi", .data = &rzg3l_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0

