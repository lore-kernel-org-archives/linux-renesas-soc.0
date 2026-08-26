Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620B3624B7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766551; cv=none; b=lPZewLjhPbnN527xtiEE3baP/Jy07t2XNwACgZHCNAN4oOqbrzNL1UfHJCU69aTyUM9QIchxr54ARHawGNrxRKMfoYHgDzFmKaQ0Pxv+B65v31o82nx7jzLDnbO0EGTHjSTWsnRc8TH/Zulcf48CUeFGDAHFgRwVyNtha9v9/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766551; c=relaxed/simple;
	bh=tSeXZbu+IyDdA55Dzj10eGeaT2xWJZxw+5BeKoS2Hnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnaJvSpceTAraCqzpdKh/judf/XG6apVbrncUDEedoebNcq/oibwYTizUihIdTTnTGp+k7jY+dwNROtI3FOyoXu5y2Ddr9lFxJJCQEaD1C+BEp/iKU/MPfeC9k1QK5iY/vQMeTzg3OxjTJBAh6zUO59rrhuFdHhV8d4h3Tx33d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLdHJvm4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLdHJvm4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c253358b121so50431866b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766539; x=1788371339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGCUJbrGi7S4/RW/jQIrHeNXdMRfy5zYhPa2LNyhWxc=;
        b=pLdHJvm4TgOet4R8UaJVPvCRy+ivuN/pINxKmDKOfTqtMqjB4MU38YgwSFjwA7tEQB
         kpnQTS9pCHk7cUDtKNB6O6fvfLKyJwxRmw9XdnkJJpy+zNefOKU5aqRouwjptFUkMiQp
         DDHtDu1df9G7HSRk3M5F0d8D5CGTmG3+ElAP7vdpCXVzFcSkfuE1OJujjYon3fINtF0a
         tRnvZw5xAyMqS4JlAC/GmgMD0NcyE+GeCniXkgE0TK9zWur15PDMPdHedSwsel3ttclm
         /E9onjE6qyEcnt0xd/EYfoTAARlVxhLHbdhecVv5lJZ9F/SdfaBkmI+nvPShX/HFpbQ+
         IThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766539; x=1788371339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGCUJbrGi7S4/RW/jQIrHeNXdMRfy5zYhPa2LNyhWxc=;
        b=VEVWmjTnmlJGIeCL6kwmpWI5zy9eapD1dp6b/56efZRLxAWUYQfG5RXw3jrNfebB7a
         fWAs716RL3sPkr9JcMR42Aod4lNgHHUvDcenJCb/HgbTyPYaANcQzJZ1jlMNbLfNPO+N
         icY4N5PAzt4smhPe1XJpLSmRvvyDkpCK1vPQTG6G1nhwu/ab5Wz8zA4WG9Qeu5PGZj8r
         ngvOOHMVIUJJKgonjSFDnWNcAa2ApYGnv13z0UjYlmk3Bb+5lvmWxaNA14af4yt7ueAv
         FGWpWozEhRNs7CXqx4LZ5jexFUBEtCddjzgCDhem25HOqbUMp0r6fb9mOVzMlwrwaL5Z
         eahg==
X-Forwarded-Encrypted: i=1; AHgh+RqxAsBTji3yTazySqEduWr8j7cjj7mjJ4/AM8wxxEFsD6d0Iu05vHMbZWuawOHY4nhOhpkcSSo2nG6W+RBnmyCtoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lwPsgx5mhkswdSYtWvBRaCy0jtp0e4byQptbp0t0Xl2FI4iOAK
	9jfnBiEDYt+Nf8IZKu5px0Zk7cAEF8X/0RUE1M4vCtHA6tAfFTJolrKyuQtotQ==
X-Gm-Gg: AR+sD10B2sBk78xQ1FD197w92FtOZAKuN9l01naXEU1ecyEWGe7p/TJfe6tMXI/3vhK
	+t/NhY2FldJ/qU4CrPgRv5CUhT+w93IdRK/obBZSQK4z94Vr4CutzmAQNNsrDMmqkEGOYFD6u7b
	yvyTiV/YksolnIjEiZexRBxcow0xtIl1m73nMnYSjY/4sNhcdiSGmDqPAZcA0YegLvBu97ndMM2
	08pVzNwK/JSZlQ+MSt+BApj6GkaXYN3W8vgLHGIy0nNtHk2NqfAlATmLsvvDuKPhAJt9/jNXNLb
	TFeugZjQpHoCooRfaRFiS1pHat5ZgF5g5utt2n7GMwFKdWQUEkptRcYaXlW3oODAZHkRaLW7iRJ
	NARQ8NH2hOeqiKxq9rJPcUh7K/EtaRVaoE0i/ElaCCUMSGzqcy+XieY4fe0ImbBfPpa0nBdW6Zy
	OnlRu8pheQ9nXZkEvKNfFZrqaTSYodcTP9T6hAok4Z+DFFVlKKut53SXqHCNqAKDYytMFHQagLZ
	8ocX42kBrN4VA==
X-Received: by 2002:a17:907:8b91:b0:c25:3001:4699 with SMTP id a640c23a62f3a-c2530014f82mr425766266b.12.1787766538844;
        Wed, 26 Aug 2026 10:48:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:48:58 -0700 (PDT)
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
Subject: [PATCH v3 01/13] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Wed, 26 Aug 2026 18:48:35 +0100
Message-ID: <20260826174854.199139-2-biju.das.jz@bp.renesas.com>
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

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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

