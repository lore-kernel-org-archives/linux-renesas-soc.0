Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311185;
	b=b9dWsykFhrdtcn4JwKmiaT/dM9ESPOIGvtJME4S63WokrNV5YR03imw0Kw53LKxPJ3xc
	 /JjfhLu6GfSRvooeixntr+ypBuFvaQFmuJlGi6f81NGsjAawkXtkYIsRTCRs9lAY6hU4F
	 Nr2k2tna2EbH8exPi7iuXLL/fcd5wWTqG/pYzo94JDKSpqH3YNF26n3xAY9bWaeUbrixp
	 RKJuMGuyVEYecu1OyJyd6OyPVXyc+BWlbeJuaBFUG1GKysdmgKJPSCSbG5RupFwLaqvzj
	 dl6IdDveuKP/jCbDkBzTi9CaQAjoZvi6YF4GfDN6/wpG6wC7N6TRF5aREyAhz1j1n8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=650xNz5E2WQUY3KnP5K1WhKYhZweVEKGeHri1CxDolk=;
	b=HHgGEIYlzGmw4Qm2OodWLgA53lYLFPwQtfASKCwMhGQhHR68YTFISzdq2CDknXZKSJIQ
	 RtpbBIvveECaPj9u09xoxtjS6QyZbApnRUSaqSKiXQtOVnUwImQ40M9yZ3yf3Y6yd52fH
	 k6LtuKcFTnPndMmywf/OQYOsY+6kNpvFy+D3zk4TqlaLaPrtSlUXc5Pdikmq+9eOSpKXH
	 pJ1rChh/u4TMMQefPMnjyEKvCL9Z02tfq8wWzZ8+L9dVWyVeMSwhd9bnQrZfcHdMTJtuw
	 yv/9pHe4dZwg2I+w93Z66beIprw26kw1iab3zGZyE9yKHrC/mkvfzmfJZAjHoUMz7zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMdukxGq;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984C606A32E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 11:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7984C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMdukxGq
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12972035e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 03:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311184; x=1794915984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=650xNz5E2WQUY3KnP5K1WhKYhZweVEKGeHri1CxDolk=;
        b=cMdukxGqQnrH9dDFcIPgXAIsRHF2a8OVK1qWD5fensk3s/F4SGBEuCb4YTo9bIiCaN
         WzqRS/Icm24TWSBcX4t9S5673j40ZZXVmSSPqf2+ztWwXe2biSK40xgktNVfoJplYcQ9
         dUNBL9p39Ij/wuzJR2/4Xu1X06oEUUcka9A3gby4XJhqQr23dNhc/z3G04VLNkxND7b4
         fesUor9CPnEbYebKht7IE4mmh4BFO7/EZSTj1KsdQZoBFtM38CZIJmNFxcnRDttk/Npk
         8oc+P50OxIRhjcsx9coE/eDU6Ll+pt7McfMi+jVqZH1yXUfK8THlZ2K13970ZEj6yHm1
         KpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311184; x=1794915984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=650xNz5E2WQUY3KnP5K1WhKYhZweVEKGeHri1CxDolk=;
        b=LCYr5KL8rp2cO0pRCW5yR1qgHuuzVejX6r0cdE7nMYJKLq2lwyCqi4mYS2bUhMXNGo
         2YSj84PEX2nw4iH9+aAFTNUHPtxF6pwWiONJFjgPF52ilBVgPc6wb1vZcsmJ4KBSzVN1
         XCxIBoatAbyDDEnBo/82cXSe/TBjIsawglYMT9G7wzLnIB3MA/Yf+DxgzeWhofIB++Oq
         2KdjBKyxun1uE6cKjJIvG2RWEuUKX5ADjXSB/0yLVHvTqcJmYAVLnAhALCoXvOc/A0Ex
         tSi/8i8nwCLF22isuNtDtXvWJ/Qhp6hH3z3gSWolS3I1179G5ro1o7ulcq8BFngUszSw
         CesQ==
X-Forwarded-Encrypted: i=1; AL+hErErLg9e5TBPMm+nUhA0DW4pPhURCJ0qHoc1gSc4R1PhRzDUbJJro9o10HIGH40q9DqW5lCorKJ+THNhDQHDikmPig==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RiZcYNZOPXIaDh2RRfbUQ8qwPNxj6EUUvDD8hQedu3Jq2mSXY
	FhWx5RGrFs2cZJBQBsp+J4/yxAD8Pi/RhglHdzpEuy5YEb8gLMh0rcTG
X-Gm-Gg: AYBFou3KBt9vAZxsaHx9WSJlTUTX0S2fqr/mkc0Nt23q/nnzpiy91uBgxQFygluBC0J
	VZJ84Zzhh1FCkS2E/jIhb9X87MI1hqxCS7pruNNiub9Op1suy/LOItmM66MQONqGAAthEqa5iuK
	jL92Y0ofSV39Z1StnViSPi/z8XJzXCWT9luishaSN5EfJE24N+15xlHAzga3kXPt7m3Yd+oc6TT
	ZmzsQ799OUSY7LwKeseJtmAUlenzwC2zWCcVLY3QbC+PpgTUGKUDah6mJyeJzim76z6VLd0OcLY
	WNIJIcUfGAL5JxrY3YNUh7d4mcrMlsmp4MnlfkzOxLdnEMkztk03YIonuHPnDj2QuyLHTz5oBKT
	ttzrmYVsSdVC5nqaANE5yJsaJ2zQrm4Mb6af1jtr13nEfiYj0483zaY3UyxVKlHCGX4F8zWSJuv
	L2NNJAON1sYCqHp/GDnRTKUO8ceNtjTlOMi+Xt+1WIj0nwUCgEaPaCb48urotQ6DXAGXW47K+M2
	NE9NP9nst+Oj2JfSZ+8CZ3d6urRe1SIoGlVTcaagmQ4JHQTFJzuazuWsvZV8CAHhToj0Deda8z6
	rR3lC1g9wKLWq0UAA9EpHx5nRHk3Uc1MWPp18r/Sgancf3b/kpooZljXxSqFOiYjf5HNEleOioS
	NCfWwZj6wBylSwVCuvSEAnx3jmzoX+yf4mrrRUCtQ5aOGfngGBffSn/4Yw+9je3WvAdMkK+aY6F
	4NrI2KZCODmg==
X-Received: by 2002:a05:600c:4f86:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ba0234575cmr38552685e9.14.1794311183540;
        Tue, 10 Nov 2026 03:46:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:a442:471f:496d:2047])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a763sm59915765e9.4.2026.11.10.03.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:46:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate platform_set_drvdata() call
Date: Tue, 10 Nov 2026 11:46:22 +0000
Message-ID: <20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: John Madieu <john.madieu.xa@bp.renesas.com>

The platform driver data is already set earlier in
rzg2l_mipi_dsi_probe(). The subsequent platform_set_drvdata() call
uses the same arguments and is therefore redundant.

Remove the duplicate call.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5b257f5adf06..985d6e02203c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1576,8 +1576,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (!dsi->dcs_buf_virt)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, dsi);
-
 	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
 	if (ret)
 		return ret;
-- 
2.56.0

