Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C44A0901
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847650; cv=none; b=HB4/Brp6Rfal3krLFCThSUwBwaiLMiWGcrpWER01/4M9ivxp5mJeZka6prhDZElpgBq0BNcvajjceAKp68l6iBsQ4cxjVOcWYrWDUkDTLP8ms7hCYoZ7Ivs/h68wlz4AX2Xkrn5ZRRwyJSTi8bFZLuY0iFS36gChz/EitdEg3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847650; c=relaxed/simple;
	bh=HzJ0XdBe4e+3eV5s/AAOK7HQGzgLyDAyz0pIZk2tifU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to+58B62jPVRycP7R7xFLGFSnyc5EHphJhCqMBy909DRWoiD1Ivh5XmP0gY0p4wRcBKKX9b24ORP/pLVZwPkjDCr2w+NHhg4lYvSzerzzNAcgYOMgzLeFHvoEdYtOcZ+y1Wkw+iVfy6nEwfdtzOcy3xmRNYgbTwFE7fg+Yt+Xgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKbFLiyR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKbFLiyR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso2617175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847647; x=1791452447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2InO87pmSFWFpzCtL0kBSIEBqZO5yulpRnkLLV7Amw=;
        b=mKbFLiyRsUTzjq098xriHo/xYaEhGbLO+4sxsc6e1cYkD56sUzw4Q8g5uRJD6aVywf
         PjUtVIzWxLoYKpv8i3yr43qr4yItE26JJlfTM5qgy5SF4/Ij3T3y0dAYd8twgRUrRXwa
         xKHwYjyEWESp6sWa8EKP5wlJ8N4WmdSCsMkoaLxR+6dmInGZ3MJ+O8ksKiHEtIlrfYo1
         MVVvAKLhF3RTkUSedk/QlTer4ZNqG9HuesChUzcK/XPBS+Z3PinkH8/hM/Zc8By0msx5
         8+gYS8wekUh1B6KDYTrxPVGVsQUXtlY9/JOQbdOsp8Xz0DXu53oDppZK1SI2atTv5enM
         Qm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847647; x=1791452447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2InO87pmSFWFpzCtL0kBSIEBqZO5yulpRnkLLV7Amw=;
        b=SQ/0dk2K57rkqn3Xv+QbCfcDRRgraK+bH5ZTruSb4HCfLCT4vAMKfMGmyC1cFDLD4Q
         NMPgA+guakg4AdMkxK6Id4DazlxGhyLCnVNWeLkUtOcwhV1AUvCGJvNDSpBUE4IdKCHM
         uZz+3AdPtNnBLgnVoXO1ZdAxelAJ3PUhCeIl5KAiGaYktN+zqn3yVlpt2HGY7xahEkKx
         NF5M1Rw+B6tLBwMcS5BkjjyDWBgdxWNSawYWSzLcayEf/mavGFxtKxKigzXYoYIPER3G
         xQsbswqxsjrVPNXBL5+ghQ77zJooy8rBAkFl8GKYNgI2IPIkV4QwdL5Jy610WfHan3Ll
         Naqw==
X-Forwarded-Encrypted: i=1; AKwUvBxdGd1hB/0j87q+EaCK+/IbdS2Wqf3aWVljZPesfYRwGcUqR1tvNqIAEOYSkBe7toJb2rgYdyqEpKa+/qX9HYXezA==@vger.kernel.org
X-Gm-Message-State: AFuF++m+xYAFadkmGCAHbuIGRMvWwNmtqzz9DZp+A5P4wc4sFO5zE/zO
	NBguBjopLJO/P9ujkVHSeMK7mz2/dYHQHBoS4VIC1pwg3reZmDvOI1GX
X-Gm-Gg: AYBFou0fXVONdmhdg/NA1OssOoAUpmLebLLPKLkYvL5eckKFVJXqXv77Ask+fPluhDG
	DrgZc4E6jyQWL1JmI4yyDD9Mtte++PTEiBlmTmrRkTY4fdwpvzH+4y2qiaFoefoq/RNSmBRhGQu
	5fkJ5/ruCvOtkhn9wfrk5hCHqhz9jc5cZRBa0MZZcel0cUkrvMr/szS3QL3Q0X3IUJhkF8BnD3e
	Ky33wnI5jdL+v0yPBbhNTjBnO8g884ZyWXqbH3UsDcvbrtuk7YHQVjhiBmeBwGzFkzhjI7wBKlh
	hIJBAHpBp/lk2LcoN/eAQOZbYjDnESF+8yJfZt0lvfGPhX1teAsCKuMiABixhXqq8qejz+9VLF/
	9HhXGnDi86Y+9ruCMJI+KkWY1gTR+QhRTYNdTbd0K/bcSmX0Pq66Ji1Jo0AhKKtypOUzQk/G2JZ
	G49a3U1qyVesS/dxAe9DpOgj2y0PiGw7orMcmTy5Roq4sDvoNExfnqCeIcOkLVdsv6PdleCR1nE
	Lia
X-Received: by 2002:a05:600c:c490:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-4a01b12d914mr68051805e9.34.1790847646421;
        Thu, 01 Oct 2026 02:40:46 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:46 -0700 (PDT)
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
Subject: [PATCH v5 2/9] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Thu,  1 Oct 2026 10:40:17 +0100
Message-ID: <20261001094041.135697-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the post-reset activation delay into the hw_info structure as
activation_dly, allowing SoC-specific values to be defined per
compatible. This prepares the driver for supporting SoCs that require a
different delay after reset deassertion.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2128fd16ebc9..1538eeece2b5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -59,6 +59,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u16 activation_dly;
 	u8 features;
 };
 
@@ -806,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 		if (ret < 0)
 			goto err_phy;
 
-		fsleep(1000);
+		fsleep(dsi->info->activation_dly);
 	}
 
 	return 0;
@@ -1534,6 +1535,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.activation_dly = 1000,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0

