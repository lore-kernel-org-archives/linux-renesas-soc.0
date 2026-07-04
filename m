Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E643A3826
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157680; cv=none; b=osgI80/xwyF/prIYbqrS4yYXBiwGQyL+9//vMu8Q5JSDjVw5eEJunLzPovWZRN3SmEuun3Ce7DJ3LXHfR3Qd81IJN5co27tpx97LfxgQ4+VdHbTKaX81Jevrdrlrm9X/yohb6lbi6v13wQXhEeBiO4bFd3BUJyT9oKlA+3PuFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157680; c=relaxed/simple;
	bh=fNRgaO6CuqvHvFMhxD/5diUwVXvn0PjSNMmCqWZCkr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC+rQo6KdG4y39mZrLs/mTF9eaMKkvjBC98DyUbKg+bumHnDsyh3rIXZOSRgWkivAZmE7Yy+ZmXKcJzBcxpW7oc8ZB06O6UIGnI2vj9JkPVMhYuyv24G7Vo1HGJ8OeWvuxchw7HqMsIxqMNX39kSv5E7Yq2bucaFt2TbRLLKkpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTkMmazc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTkMmazc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c19bad03so11901215e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157677; x=1783762477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vdr0BjFhIBzM2JOvPePh0SjNKUa4w0ykoB19Blh2f9o=;
        b=OTkMmazcZKqUAQwGi2HwBD7rmuE1qfURnOr7XftRT7LGQsexxTpxt50eL5Ole3NVgO
         tJboKKrP/xAGks6EJZmJbm4d2ZjO0lfEw3rhjKFl4vwZpvDLf6oCwc+64sfX2oArzbvg
         De9tFbNwrZ9VfuxeUfHH7dFu2lYU2LG9dcATFguM15+vsY/c+mFtR0ZJJninYeH6bxTd
         Y1gWe3HLz8ihQfuUb+2Op6CcbrLVFzYEOJGqb0YEjuU/I6n/N7dGci6My6qbZCgud5MV
         aq81J8WWkA1tkYRRnM+sLt2RT+yFoUbgFh3oE7PUzL/nc3sjs/QjfjUx4O45i5WA7LO9
         nr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157677; x=1783762477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vdr0BjFhIBzM2JOvPePh0SjNKUa4w0ykoB19Blh2f9o=;
        b=VjRVED8yIEuKObdMvLhp8ErPXsc0+iXTd4zXul576WoTNy4rdXUNd8NzMdg3ekj52l
         c4NMQWyl9ByS5fqcegWL+xbaUJfkUxaq1CbH4dVwB0dR1uOYj9xjOa3rYLeoi8DzCTKR
         b1MjCpdpk1k8HiyN+SO/zxEMoxzL1BlnfG2BZ66vJm8e0EgZE5F0orfdSys+C/ExpO6F
         h/lTOm8UcZMA8uvoNHzcwIXRXCJ9fZyq8AD+dm2URN1PAoz55SbX5lv445yoQwO4WRy3
         1KT1QjGhVGTf4pOFY+xy10997nZsGI7Y26KGhw8v/HvXElek/QYOL2PzMKnUnZhQ6jHl
         O3wA==
X-Forwarded-Encrypted: i=1; AFNElJ8AKQ/DOHfj0eG4xcmhhmV2tDe2EQISTK1rejbq9sN1UgTBc6ubztI1ey3HBfnyjEqGdABeXk8qf2RfNjhVFdWsuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDi66xCXT9vvYDHNi6WJoOv7MiHdeulRXzLTJW8p+/QRYZabym
	q83LG18+2DXbL9WjpwH2j2nSg2bRJ/v28JmSlt/wE2LcSGo+XWo31o8Z
X-Gm-Gg: AfdE7cl3wJGLpEg5EBzEGVlF9ZWJszYHSy76aSX4vi5P2GMHwJc7Li6xmBX5xvo8PHQ
	A2ANeXLR1S7IQnz9Nm4sOpwb9ZYKwSHofbaYC+Ydav7ZvHyrB2qg8YS8mL0vJTa1HfupzlhRxQR
	Wi2dk0tfVA37OSTwa616GTPqBYlj6Ccz76EPAf/D8lQdrT5+d8XYAvr3Re4ExGcsZdTH8pRM/uI
	9FqZgWjsvx+MT8BtM7akGumzjPOfeWiMvNwld/c9ArFjRzhgHh6YJP+cJdYqiiGLfXXEbo0C6ul
	CdavHbAlnU8+r+qtX1DPC2cFm6yg9yZqI73r0qFcUy71vi8D0vmIrSNc4mRhPm/5ubP4gHxXP61
	3c2lJGzmLwkVqwAJEsaxboyQBBI49NYHKMAqGiwCU4zwdNh4sjB/IC12CXV2hjpRPUwskdHDwEm
	Td/J+eb/G26ydNdQZlkfPm
X-Received: by 2002:a05:600c:34cb:b0:493:b150:c607 with SMTP id 5b1f17b1804b1-493d11d936amr26353015e9.12.1783157676877;
        Sat, 04 Jul 2026 02:34:36 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:36 -0700 (PDT)
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
Subject: [PATCH 03/16] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Sat,  4 Jul 2026 10:34:13 +0100
Message-ID: <20260704093433.273672-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

