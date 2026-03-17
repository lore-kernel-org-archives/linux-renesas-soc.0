Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A9279DB3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750978; cv=none; b=QUFhJml1hFTOiAZKCf7TQZd/7nH4OadOHX84iupOs/V3xFww5fqEST51Jozgv78b/EFw9sR27+NfYtKi1kjkHjEWCf6hqcgZEoE7OjoyRmHorrDhxAu5qaJKXBCESRbmzaoRc+xZeiwq1gsYGUs8izBDhG3pRbu798alScgEq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750978; c=relaxed/simple;
	bh=F7Th6NUZTQXGob9ixPc3PaNxR3hThgg3lGAFl1OA0nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdbN1PtA4ywKm17vM/m+iA5VdLNl/v3pi2US0aIBSBTol5lvO18s+8viMDYHWKe36R0dr50wGiq3MyZlDzZhZZxwNaVQRd7A6/IS6uvsUPe9g6RlSP73lxqZMNh1ZJu/p5jd/hqINvTLVRckPz0q0DSM3zZcVP9kxX4OM3C3tUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIhaEpRT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIhaEpRT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so529579f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773750975; x=1774355775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxJ5pMJ4op4YCbXsnXfCwBV/YmtiAWSGD2H1bAEJVn4=;
        b=eIhaEpRTIYiKVfkWTc1/6yKwf1XDTW173VcOXJyal/Ky0d0MIi+qh8FDLqLXML9ziX
         9F4GEj8po0Tb7j5P9f8UysLXIAFaTVQrKhqJx35LyrOPom8nwZ/SUhR6JVeAz2zPIz3T
         fForGEAvWt4k/E7x/OCr8cbXmqS4bGqHqYfQSfehfOndNCrjWLLdJqHEHKXW2IEvlr81
         JzZuLj8TGpaKKHKOp6cTa5E1s154AQ7uekmalMhLi5JEGDEJ2/v1drTRh3t05MUD+hTi
         NQ9WW1A1pSKyxPSxthrolChIIEBbYRqMVSfC+FKAOPT6pQ0gkHWqoXZLUIOOeIZkGi1W
         QH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750975; x=1774355775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxJ5pMJ4op4YCbXsnXfCwBV/YmtiAWSGD2H1bAEJVn4=;
        b=ntC9Vx6zu3hpISgHtTb+ry+69V8Ux3LFHSR/jV8BDqDbMvRBlxn3xHp3UO2+KTyCiK
         xxPi/GAGztoFSkZZT9o8/xzxQ3EFesIFKq3stPaxgPBCAUyiIkhPyMIdXkisDt37aRA1
         a1s+U/p9Rz16v4NlN5moVxobQo1E8wCkoAphs8zwTmjl59KpLiyFBYyeCbHuuR+HV7vV
         5EaxKat2yRpAslLZEydgbiZLxg/QzLGaTPyHxzOvmZv4tpXsuAmyufq1+dlfznYsBdnn
         7uhEbu89oy4V7PiQh2WO13VAJWhzLjM4CrK1zpDRaBmg9gl6K0mI7lR/dDGV3hTBVpLj
         E9mA==
X-Forwarded-Encrypted: i=1; AJvYcCVCxxXVj5Xey+x46xAkEVJRC4HtAFmccTteCceNu/lucxQb6HZxMtajRjQSMiMUGTyP/JWhfbKKLffkozElZiiIHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWk8aTg+n0/OKY+nCOKfbLR8B5oDHeoOcjYkLYFnn4A4TpmCzU
	bllYarDlrqmMhI4HCJBiN+f+TMQQVWKX5mOQYSPxkKZUfhX4BZAQEt5PA/tNjg==
X-Gm-Gg: ATEYQzyY/HLyG2UfkRclPKUECwkrNOT46rYygeWpZx3+rQS7OadttkhlHSFiJQ2sCLv
	vNzFLff3Fw6/0TE0J8SgDERN4h41N8j/gQCa0dBZk33SWnIoNYNbyFA1DJ7rU75xfOWD5kOicrf
	QGo9McDIw1ByWggLiyme7ZNAh+EhCAEEOVnBFtZIwir2JFdtnZHTBYkXwwNIbmm2VPxnKZapkTQ
	TbIPfzSr9A2zZNkgM8p8mz6qTUQwm9DckUy/8OtDrOwRxPOOdhb9lOcfuPapTqzRy3FNvY0uoBF
	rnzgp4duf9HoE4TGuli1e+cstSey7kfj8DXEGnadl/PG313x4Dj7idyBQb+mCux3juimzVHQWy4
	DV/KnlqeVpk9v2BJDPu3BVpPdKv/wybch9H3i6NrFnvXNwu75liVx63S56+abNrDwKxKYdhP4El
	899QRIBaLGHuCJ33dI7o0mSakrOQBlOWhB67Msu4pk4ez0AyyldQtgSsxmqfQ=
X-Received: by 2002:a05:6000:24c5:b0:439:c078:9a57 with SMTP id ffacd0b85a97d-43b498330d9mr6248986f8f.25.1773750975272;
        Tue, 17 Mar 2026 05:36:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4f845841sm3247444f8f.11.2026.03.17.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:36:14 -0700 (PDT)
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
	Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] drm: renesas: rzg2l_mipi_dsi: Use fsleep() for 1ms delay in D-PHY init
Date: Tue, 17 Mar 2026 12:36:00 +0000
Message-ID: <20260317123610.329630-2-biju.das.jz@bp.renesas.com>
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

Replace udelay(1) with fsleep(1000) in rzg2l_mipi_dsi_dphy_init() to
follow the power-on sequence described in Figure 34.5 of section
"34.4.2.1 Reset" of the RZ/G2L hardware manual Rev.1.50 May 2025.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a87a301326c7..e53b48e4de56 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -528,7 +528,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	udelay(1);
+	fsleep(1000);
 
 	return 0;
 }
-- 
2.43.0

