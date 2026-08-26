Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9213AB27F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766559; cv=none; b=iyVDKvsJkBqBzex6FQ+oWk8Y2kaTYRr08CHwD3vSUyJskttmCsHqeFDnTYzl4wSdddTqCLEKXuencMav4lokHbFF9XDKkuhX9FMv3lsyp5Is1rQdhQPTamKIUXROFgJRLUS821+7/f2T5pW2R9IEb/TlXy33k5qN8tkQti2JgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766559; c=relaxed/simple;
	bh=bQ7fThdWeOoWGuWfsVMmTYFDay4551B6DGlUY7vTHrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHZn6gsQiZQqP8rqZsFhIli71aPOWmAzVvaRchQsJYnCy1FK3cgMNSUghA1ibIv7U+PaoDw51SDNPC/lzjba37HLOtQT7c3L815H32uoZ+RJlidFMIu988IYQnB4gI2wGERhhmNpbyN2LluiEvq/iNQ2eQhu4NCkcFEbX7OLwFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RloIwekt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RloIwekt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1712a04ddaso191936066b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766543; x=1788371343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tYJ5KaLpfQx62wkTVDpvEmEjM+VL8f8SScga+Yd39Y=;
        b=RloIwektBJL2qiBJikMRlcB/ebYpZpYMjr/L7nNmkMQN7ZmvKKH5yUFyzidJsWUjLY
         uYjgGFYYhX2eYAasVRUejRsf38LyIv2DuChfVe4QyNZOF8VA++NwQ+rnebjWdXaUiPca
         SfqfdW1Ce9qTHKODARDczwNO9tnkeQubeUZGTddTcTGJ+Ui3jYQLpw1fS7LNR55OBLR5
         NAB8O/875uqiqTMDocPVgVJc/RcJ5bAPWabUrba1P79VgA0utDyyKkLJ717Wu5eTxqRZ
         BmhGrR682b8+A7Cr6Vq6VbDrwxiATjwSUqoPZIryXM069o4Oh+dDnqYvRbMKZm96+srs
         R+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766543; x=1788371343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tYJ5KaLpfQx62wkTVDpvEmEjM+VL8f8SScga+Yd39Y=;
        b=Prk5rygHTkSKb8+PPnzCflHXGWbotWfw6+PnqxradiEYyQzksQcXl4pvWn9aJVb/fa
         rsO7whewxYOhwZlv4NrfXUVrKc35ZqSrsd9XP3xeo+G7VS9dal3UCWmTHluT2MoHvTCu
         NBdudlDpuMTo/2vOT6RQrBN1BB+zZtEFzUE/AQfvR3WtLBX4g5HzHsLOH6km8izsyjTA
         C1O5aGxw+aPNgdF8lJ1ShweS8M4+3HCniUnfqstwUlATMNxvQoRM9CTQZI0hiamaSfGH
         Q3JMtlVBphRkA0E/r+wSQhbA1vSVlAf4CirwFTF4vvW0fmsutaIOXi1kdRLvL+JQYMJJ
         sKxA==
X-Forwarded-Encrypted: i=1; AHgh+RoiOeJS7vXoyGNi1e6i8WZUiMLop29jy+/k/FNWJhUf7O4Zlxtzk0G4uo3bLVGMmwM/+K7SKKq2n4McFkBwCGwOUw==@vger.kernel.org
X-Gm-Message-State: AFuF++lSpITEPvaIJaSFVwxrThrL+cl20GvpjJz2hB5IRpN7eauWwA7E
	qJ33zjAWpv5levvSMyOV0e9h7pssQlEAGywB8hhMuW23QNh/dAukJQeR
X-Gm-Gg: AR+sD13NREdy+8/3JEtO7pDNT4PCrIOqBIwF3L1IH6PA5Hfk4cURCtXJF4zSWzA6TW2
	Gx36dt7VE2aDzTJayHYatzTwg15i99jPSHK+QSRCttCZ98iij4SPjWQJfvwN3gHA09Y1m7A4DEm
	mQk/w16UBKGxtfbM+Ifk6IM5IeFCwrBdI+sg+gAWzDlRMso1WMW1ANNtnHJ7t3E1nPwaKR6Oleg
	//UepTstVGyhD3wvhroy7MznNPvggJ1QKtsaBku57zGe0Z8zjRCLu5HGKoAriFIrNvEDG9E03bn
	bBx2S4KE7uSqQB7ltEWRTN0pQHVn1e2ezYZ5z2IBOtXE7Gt+u95KQyyirDEGdpWDywYKWh/hjkV
	ETXCPHKMuveCBEFFH30Ywk76JGziRbNHafGSrsdghu9UffB6+KOOUnU64b6sAPe2qPW22LkSV/0
	i1mTuydkYbWlOs6L0CSATDR9ukVJAkRMsdR96XcK7u+wmrTvg9qI0rz9wcZ1nr2TVQ0jDvkY88O
	+uM4BQOrlmfcw==
X-Received: by 2002:a17:906:9f86:b0:c24:e0dc:8b66 with SMTP id a640c23a62f3a-c250c485f66mr1016315266b.6.1787766542674;
        Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
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
Subject: [PATCH v3 05/13] drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
Date: Wed, 26 Aug 2026 18:48:39 +0100
Message-ID: <20260826174854.199139-6-biju.das.jz@bp.renesas.com>
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

Add support for the MIPI DSI controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The D-PHY global timing table of RZ/G3L SoC different
compared to the other SoCs. Introduce a dedicated D-PHY global timing
table rzg3l_mipi_dsi_global_timings and wire it up via a new
rzg3l_mipi_dsi_info hw_info variant for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved set duty cycle to DU encoder.
v1->v2:
 * Replaced syscon_field->pwrrdy in struct rzg3l_mipi_dsi_info.
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 7df5f4a4161b..88ec0612d529 100644
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
@@ -1580,7 +1681,23 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
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

