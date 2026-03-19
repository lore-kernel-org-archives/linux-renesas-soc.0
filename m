Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516313EE1EA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938923; cv=none; b=q10svcNZIa+l1GGj9/tWspZ9XrnNrsdZIjJB6GshfeNvBTYMIRFM7DZZAatbeRw68KhLiEE9lPPdRG7UxIx1ZjaEWOXl0/9WXcmEEe3CzENxApgpIQMtLMjSJQGHtcfxdw8W5ZA1qXaZdAcQofq5Kpz6WJFS2yZuhErs/RvskLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938923; c=relaxed/simple;
	bh=lG7q/6k0q0qW2KK6r9Mb23Fu+RroCNbNZ7rN3IIIBjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dyn5kIl9OzvgcQzeHDcljncaYYlLhUjijgwMsU34pCqLx4XX8ydGh39SOZTkqrTq/dl7iuPcDcQTEQK3MgVAfXq6Tz76AIJ6oPWezUOD88vBkcSFyhK2F1GybnoJCaKlnksBDASSa7G/g+xQU0fH+jHkVrRzUKq12NV3469EaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cys1qTs3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cys1qTs3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fb14227cso10164785e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773938917; x=1774543717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bng5/yZC9lrbuKxC9dU3uqE7D/V7iSIEJ7NDOj06TGk=;
        b=Cys1qTs3o5xUjdEgBxYpXHx1X+CLAXAkA3iVPOf3haNJCKVgT4nLzRwLFLSG690SFd
         R2k5PpXNe92Ki02g3IsJHOmCqRmrju0tj02NbTIJMYzIWLuMT64xJ8AOTiCtdUlTXDNH
         NQxEvKJ10OIMUuwFqgyD3pJ5aLFD+WcjXLwUVzaVxXEjz8hoQFUCo7WnYTQq32UpA+Pa
         d75GCmMOBkKlqvIJvFPu1njhUVH304ah0391HeM+BB3n8waC+a/oS6rNeNzJwYczfGWi
         5eMVT4R7bCLC9Jl1VY7jkExOcSPqXUtGC/7WJxYVN8iE1wXJvyHwl33SYc+nTA5B3Bu3
         Raog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938917; x=1774543717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bng5/yZC9lrbuKxC9dU3uqE7D/V7iSIEJ7NDOj06TGk=;
        b=FagmaocPFQzoUaOFn75mnCFiMYBF6ikQSMlZkcCzLuR+HQvw5bFH7NQG6JCqSArExo
         yCmVb+6Sg5KOjdvUQ4gU3wzFhFW1HxOdqzpQlSoXHdD6Czjyl1NxBnepkEJTofI++/z+
         FqxAlvJJULpGLbGvb0gQLO4Qj8XxcHzu40KmK9a9yN83m5rEWVzm5zIm0WqlAEnYv2Xq
         VahqmRysMRCEXIC31CzgU8E03MCQzlNta4zRg4+X14cMQTSmtgptVQBf4PBTju2uOFZe
         GbXaQkgTApHF33GOLbk3b7V3nnCPFLoQwoF2E+O+SVaTeBhP1E43Q0qNhoCQ3Z9bt1mO
         ns7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcHA7GbmuVrrgM+MeCuODeU+O2IUeegVS2Oq2ECy1eHynw8+gTP3Q56oqAWj1fXAQJL1zkhq1QCWAuaiEaPLkUUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYT+cOUk/xlu31CAGoJlilujGvtxE/gLT9U8oJAdrO5uGoepR
	YPO6ACl6biTQUioE8xuq0itLsssP6gAyixVxDzqQaOQ4M1srhy7BjSBk
X-Gm-Gg: ATEYQzzAkMuYw6Rcm1shoXL8dqZTG7J1wQUS20qUPKn++YFHadtvK2UJzUu3l80Frtm
	rgSCPdnqGvt7PI5vgZni6IFtl3iKUoM4WIkcOTgQ19RiP7ZLFjIzrXOmM7OWRBbWxG86ikWNpiI
	0oSZLh1nOevIJ+Sx0P0VWlqiy8P9rS0c8D2MFgY3ktmBcb1OWw14p5Vs6bTrOUINeNaQ1qW4FeI
	8x4HdFLFFvOr/mrckJVLXvagfs0tTfB3ex7P1sVFKnfImmomrAsbDRw3Op6XUZl+3X6voq0vViJ
	SjGn4TKEYoEsPlqhsuvxxhC2Eup5fIAdY9rkaa4c+Q+iufs3JcESQQeXyhKbxyHFlYNkQfIP8EE
	dlVTpufY3VVgPZ0tXv6r0/310zhqdP2g0qGxprKYFydl11LSWDoDL1ckZEqsT4oKeBu3Gl0pq1X
	NlqojbvYa66euIxTTBAGCKQc+e4wtcZJw=
X-Received: by 2002:a05:600c:c490:b0:485:379b:57bb with SMTP id 5b1f17b1804b1-486f441bc19mr132327915e9.3.1773938916947;
        Thu, 19 Mar 2026 09:48:36 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm5238505e9.0.2026.03.19.09.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:48:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm: renesas: rzg2l_mipi_dsi: Fix assert of CMN_RSTB signal
Date: Thu, 19 Mar 2026 16:48:26 +0000
Message-ID: <20260319164833.409126-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The CMN_RSTB reset signal is not required for reading PHY registers in the
probe. Move reset_control_assert() from rzg2l_mipi_dsi_dphy_exit() to
rzg2l_mipi_dsi_stop(), placing it before the dphy_exit() call. Since this
reset signal is optional for RZ/V2H, the call is a no-op on that SoC.

Fixes: 2991c3f0ca86 ("drm: renesas: rz-du: mipi_dsi: Add OF data support")
Fixes: 418bb3a69e13 ("drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ff95cb9a7de5..d2da247abf05 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -541,8 +541,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 
 	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
-
-	reset_control_assert(dsi->rstc);
 }
 
 static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
@@ -822,6 +820,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
+	reset_control_assert(dsi->rstc);
 	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
-- 
2.43.0

