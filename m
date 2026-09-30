Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21506547074
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775197; cv=none; b=uZUTK7XIbyYdYcvr/aiW4UdQ2ijIZ5ibNQkpyyxw0YnZRVQd2+KdsjV3aTX5fT518kMSIJ173TMAI65CvLvKiaXUoNmjwZRBq2LYmEsTQBnl9Y8Yavht8eWo0uVeAow5D44emXXEZGvC1GQCZ1gru9K80xlzp9Hu90i+rvPIrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775197; c=relaxed/simple;
	bh=g/NfNryed5nJATsZ/Sc/dWvIbxA6MU6lclvCcljG50c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhxxLs19wxJ8G+oKc9RvLFwRV66ZJXSIyHsaPBsBenJ2WaF4PK8S+wiO4/KsV33lBhXPYu7WDJ7LVZcNoIx9W32l9L/9po+FkcTIGuOZFEQazt9RGNvr2ai6cAeh3AvC8fPQ0nrQ7TWj5tAjyVJQAw7Jb6LkOoz0HRoPji45oXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdvC4O5x; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdvC4O5x"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4887d3c59ecso826646f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775182; x=1791379982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xG0P97LACQjd3EgbiKcVcaE0+HdMc9QDAIUrR6Re04=;
        b=rdvC4O5x5wICJIerGi5cDi2eD8btx7VGreGIV+g9p1ZlIqfslNXkbbpfyujbmWgi16
         O4qKts6YItvLNvrcUJEOOaoCEM2KU7nTrIdsTPPJFkJHeimPDjIm7FcwHINFonSnADMH
         Kvvyvyh05HKCPoTMjhA/3REQ2AZMTnWDk9UR4SM0xgHsGcUkG69rUOrfaa+3sdiOVUC5
         ZmdfcKN2d9s9qWx/1lYpLTzb9lgc8t6Sxom5I9wocm7zjcivtn0AVR4JcER4S+GkMwVp
         o/hADiUTqC3SBur3VN9NEApAwK+7SK5OUpW6YtKG/dfJhkjERp3Hoa64xtK8LSWyspvz
         LN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775182; x=1791379982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xG0P97LACQjd3EgbiKcVcaE0+HdMc9QDAIUrR6Re04=;
        b=lFEinbIuG2vZbx5fZlWgYKxq2fhWbsWgZMIPwWdov0DIYC2BRJKSfRGJMHDfBs3e9j
         aOhDjuFslfJA/qd7RKu1klE7Q0Fa2wtyTiI4iyzZnPZKonKTz0lcAkZe8qYeIBZcH/9v
         +EDm03iDMT547Q8+7O4F8bBF679jF+mqPDKcWBD5pw7YwXcHyir//0iaEBhErjP80MRT
         PR8r5sHobvdrbGrbq8en5u5EZRFzE7Ux8lczvMwf81OxtBWkZ8FWHDpeGq4uTjwZaLnA
         Iec405NtHkXw8/zLO2ArmI+w6DUXv1GbVzYk3NlosGygGWBkyA3zZUGqBDDK27W/F5XF
         b1mA==
X-Forwarded-Encrypted: i=1; AKwUvBxDOzWgC9vj2g1/qkCvQP+cW5N7zRX/6Z72wj9Zn/RKuWXAhefD+qZd5BBAnF9iYyvUGEDFkm4Nkp0q6ot/qoZ0Lw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJR9aDYzJLInRYm2IVflo2WEmL/dZwUx6bolhxbHuHC7I6xx4VA
	Xe1z9kOtaIhigfVg74vLDGeN/d1DSoxwU0Ez9DJJpfjCR7dhziMVbe7d
X-Gm-Gg: AYBFou0258z8g922QRdStCbmDdqw2FGe8whTAWyg1lkbTLnseWd9P6EuuWjtH2HG0MS
	Co4Q7dSrvfTUTahRbcxF3aOiIqALdzNn/n//1vzWw0UqwtYoy5zBV3m4+7NxI/e6aaxM6VJ/flC
	aaiKzgbGpbRapDpgY2s62BGRMGO4U50GR4JvVbDR+9o7ExGrFSbP+XxqQE8/omhLOLsYatRJTDR
	oNugOvnUXYT4WkrBHTv5qo9X62gvQc6OonRycRIFCsSoA4OiPpzV8uIomZ+GCld0OwOyzzjsmDR
	UMY+A6fI3U3Y+HWt+nPSQlBvmogWjUY094Qsf1rR+H7YSk6j1Ixou0yW6UiIgUsdChl37TTjUjj
	Lgig1V5ndkw1shVjjhfaw9lpo29aGGj70u/hBhPxNDB18A1DNPVkQvlTexo2aa2ioByJGAvQqbZ
	nPQ3upZL3Dq1nkQkOMtuwaqVbORYYiJpF3yDie97xcW/8uPY+PHWFmYVlszJC5V7D/V5asRwJKZ
	wOSXPznMMGgPzogNpT5bbw=
X-Received: by 2002:a05:6000:288b:b0:488:7ace:9c5c with SMTP id ffacd0b85a97d-48b0250c66cmr3650138f8f.23.1790775181803;
        Wed, 30 Sep 2026 06:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:01 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 1/9] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Wed, 30 Sep 2026 14:32:43 +0100
Message-ID: <20260930133257.23210-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0590ade96b91..2128fd16ebc9 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -56,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	} cpg_plldsi;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
+	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
 	u8 features;
@@ -493,9 +494,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	}
 
 	/* Initializing DPHY before accessing LINK */
-	dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
-		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
-
+	dphyctrl0 = dsi->info->dphyctrl0_init_val;
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
 	usleep_range(20, 30);
 
@@ -1531,6 +1530,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
+			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
 };
-- 
2.43.0

