Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4282486630
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329736; cv=none; b=oHXHpuz9DbHEVvvIBkyfYSE43Qjkog0uR97BA7Yo+Y5pV3/XtfDETQ1KCb30CqOEc/4GctYBePOq5gczd/10W6riVTkBbrHWgvtvcnRzonm1rIZVzPeysEQA3Z0/p85gWdm0TqApfmlkU0a7HBl/lHQh+FsCUEpzDC62L29I27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329736; c=relaxed/simple;
	bh=CQuQNPRuqXMzxA7knRQstTE1kxOl/6sNoPPCjz8qCpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtDx30ENLze+rbXvpJCMEuLFXiL/o1KrR6ubT8IYJXbj4BPO49erWp3EK7ktudeMr+L+D7llXDQ6cm9CGw6Xr8wsYRSsdGTe3c+lAWMouUZz8zsRZrbc1vjf2qXGV1fI/QyMr6qMWzM7bnEwc9Iis25R5nP0ePvx/M2KuBX2dVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwL1eP58; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwL1eP58"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f7872abb6so588057f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329728; x=1785934528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nws/vK/FIfDSac0GAtMHBRQdRs8Fl0UkisvSO1h3SQs=;
        b=QwL1eP581sKOKkd8OyZ5Gee62GZdpIop4r7pe6F5apUlnbIQ4qKwnXYNSh5v59WlpS
         IFATZvgwKwceSXfaO7EOXhuC0qqQd2ZgSrBit1aeKvqy28kyg9NsbsM3dk3pgX2662OV
         3CJ8uwB3DBmUlAUFFB8fFgKn6Zv3qlRp3yD2ENPBhdpQxXY6FXsgnBKduBg11GEE8slh
         X3H6z9LWlUPG+F2vxRUUhDJyQ+Qfs7uXDGzIboHeMCfMh24og+3cteHnkj7XqtoitWCX
         mUarV5AcWY7FsoB1F9LoZCoUfYO3Gy6VC8v3HfNE3HhKQkUrphxsmkU/5kQsAHDr2az0
         oNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329728; x=1785934528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nws/vK/FIfDSac0GAtMHBRQdRs8Fl0UkisvSO1h3SQs=;
        b=kuQ04Zgqofnl1yxN24a7WWad1S5UOz3LxN4OSBSeYaVTcRMJ+7hej+rmnj5G58DZPL
         6KuhnTgcFkMDFt3YCAe6nTY/MsevNP3FYkjelTPxT0a31mkdqGJgkD3qW7ViyTMKHzUt
         jicvkRc8dWxySGPJBLU8nqvv0w2KmLOcMGVPCcbUh4u/lGUs6QNb+agaemw4wYALUHQP
         E912OkPQWwNUkM57wskB9WOM3wLtM+IM9/C9gRhjBNNSpjzzXukXB/uA7bU87sYHbt2C
         9ZpnwDCvVbeW1MHQxQbpa+74i/iGx61xFDZIH8PlPrjzxyg2Q48nLKmLK0ZGKrLoSPuw
         xUrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+J2wfe4vsJwZo94b9iCNJTy6wI+ns7YQZS2pNDV8eA/MuIHJu+o042g2Qemsu/O7kNzTiIhWxK8BQIXLUyn4teA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBEM/wULyvN9r+Y73/HcM8lSkq9rIYZuL2ij9dRzCXgF4rHpB
	K9LC6wGcU7pFDpCprcsw70iT03e4Ri7oN/TZR4mkIIiAKOVEVcHONTfl
X-Gm-Gg: AR+sD11HlFpNxZ9Q6um3bRzsZ1ZO523Ajd+Le8p6zjeekVDOwb/DahKpEABcr1hbuFl
	A7hOol9hgDnf+X3wDo3ihi7AqJlXVFzElYvbQMZivAF9gViHDQIzQu/2UW2gdvRYa2bTq0SK8WJ
	oXqw9QUZkVOqLy1hiJBbLkfZQQBQaFPADMN5LuH9qu3KYI0SdYEUWCDZZONf8ui1yqLpYTCGtHI
	xlQpcgjpD5GrCvW8IubBdidOCy60BSbgKmkDgLej6c3z1wYt+Af3As3NjwR0Fo7loIkkekvPlAR
	N+rpmRNcMdKHrSHhlyqLNgHwyZKMm4zm7ZuGaO9E1FXPSr2Uku6iePBHtd5GTj61OjMtg+184J5
	+O2X/iFMwO9inl2V3GydluREXK80HUZU0sBucsY7P+2Oa3Ibi3H5UgEUk96KS6K0wuwHWEVR2Ct
	7CWQUTdRZLmOCxemClt9LTqIGmk9nGWKPWB1Beb+6jTMxNAZObC1PDzggYF7TuUJVtFpCmAdaFm
	/DVNsA5VG5DPA==
X-Received: by 2002:a05:6000:2f81:b0:47f:8f54:125f with SMTP id ffacd0b85a97d-47fb1e82754mr8565001f8f.7.1785329727610;
        Wed, 29 Jul 2026 05:55:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:26 -0700 (PDT)
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
Subject: [PATCH v2 03/16] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Wed, 29 Jul 2026 13:54:55 +0100
Message-ID: <20260729125516.230757-4-biju.das.jz@bp.renesas.com>
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

Move the post-reset activation delay into the hw_info structure as
activation_dly, allowing SoC-specific values to be defined per
compatible. This prepares the driver for supporting SoCs that require a
different delay after reset deassertion.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

