Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396782;
	b=V+MfP1uXZCb/bf+5Mn4tBGMkVd1SsF0u06RWEo5c82pRBT5JjTSEyneO616e/XnzvjRd
	 Z/aZUD21bIJ+MZFCnhwwg15MML0KPvzafnb7gf0Gabyl5ECbPYzzvfo25Wo0M4ebeCJ03
	 RNCESQpsC6VRZU5f85J0zzWhzBzkK5Ni7bExb+ExMdYBU9OiRir9yNim5xPKew+0NbNZ8
	 4HbCRMlQq+F7bbzWSzOpM1/XPAh8nUcpVjJXohkLeswzQ3ljHnTcUXHdN2BlplVkcPBbr
	 jQH1D5z1LIP1lxpUTvVZpy1Eb92e7pEBtRCuXT0uFxC6N9F/ao9lHi2qkcdg+mZBBeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iCl816dJjsFMtzXM34P9Bj/aT+Q38xCsbIh0P58fbE4=;
	b=Sm4Yw4pyc/1n1ej46mqcYSJxZUHXZ/wIKalrA/N7KiryeqIXL5UAoivFlgOpzf5iFfMt
	 LFOzHwJ11nEo7f5YH7+Qc2qTcr1BHQ8MS4ZjQ086azmYDA6CE7IX6+DVjTllJWIPp9hWn
	 z+03Yb4H0kYPmQQRw4C8ctWmK2tostlA36wZj0vIUF9RL7pSbP8W1LnKXBtZryOTLCbRb
	 88ImaS8I3N+usDdzGRJoN8jjDTlS0CVb5zoR8QYmFk6wKcbj8JWTaxfwhUNRlMUv24rVB
	 SCwdTiBsKx3mxT9rG6LXvKZ0Pmr8AN581hyNeUO0MO5aEx+Es5Ycnx0qjJAWAZQnJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjBAa3;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860D606A31C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5860D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjBAa3
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214af2076so22686515e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396781; x=1795001581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCl816dJjsFMtzXM34P9Bj/aT+Q38xCsbIh0P58fbE4=;
        b=DSpjBAa3fHgs5xi6TYeBkieQIBksFiFWXzU1BAwPYTdAavDx7l9vzIKN4wcOfJ3got
         K+aKHIEvDj4wB++gAH/BNC9bfSADGedR8M+CaxpF1B41UEbuLyWxgyuNzBZj3q4hclf9
         mB+H3+O0yLkRQNtchJTzvRckAIhYM/PVhDIdeC3LJjtRIrsCBdkdsKvtzCfdrMMLSUSJ
         epjLGvKKbkTqO+L+iNCKZiZTOUX2veLsfeXsPYUTtk9pOb4wrZY8NlDhuYpEGIPc+1ry
         imJKI5XeHKMPBZJziUut4GWUH9OLoVvHOIKPevcZycDpIUErfm+vx8kwd3/5uPppMOoq
         /aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396781; x=1795001581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCl816dJjsFMtzXM34P9Bj/aT+Q38xCsbIh0P58fbE4=;
        b=RSMfcKMyB0sfQqmFRWWtwUEmbS2+OriZ2KsFNDZc24wfKUXxpTnr8dSqSZ4Q1SE5XR
         d0J+qUX9ZNmhsrxJfbdcx/pzsg4U7F15pQtNusEWqeeQT/4CLxFXlcwEGEd5jp4JIYHg
         4T6OnQFpsUV8jjwhLiD3twxTFEh0XFAdi9U1r0mLCM6UfT8BTL42PQ8iGB9yUCM5brYj
         oVgXFmOGdFKFMkWqwBOM5oVE3do548Frx+BqaikUg/OAyAaGZSVYVO3g7r+cUToad4M/
         6xanl8hcC+flLMQe6K3VmnOkmlKv/cdrMpVdK59NuF9BFkomDnKjPeixGOcP3EZ/Smla
         Sq2A==
X-Forwarded-Encrypted: i=1; AL+hErGD4csP9jhHeasp0qo1jmCC91EXV2sM8jV3HXkSANZtzIt8ANIx44aI2eH7dusy6I4YONWJkBgv5MwikfBs6SYPBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YaFsF0RYEXr2Hz7ccb27TrmnrzpTx5yciX1C81m8keuynBaR7
	7gtGhCv4+8ArT56wcVt2JyeX4l5L7cRpPOKQOYvUIAoJ4GSkBbyUjKwb
X-Gm-Gg: AYBFou3zkH/3sa8GY9cMDsb43h2O7GcDezcV7Y2nX2pfimfEMrECM43XmDOau6XUdkw
	lDfVy9etIMIOT+z8zWcQAND/dvN8V5Ux/jezVKfY75rlV3EbPoRKTBLl2DlE3nQZgDSYuqIY0eN
	zeOy+cQqqcHYELAGTj9pia1lvNUSxSqKdibutdmFBGXmOCuzxmnShGFMKTs3MxON4dcY+K2R823
	h/XAkIpqF2zGEOmF0/IlaKYF+ZSxhD15KDykJybRMW5RL9Rt23wTd1loeVrS9ElBqwEYejXDCsw
	zjN6yRe+NsZc90QWqzjdd/Z737Q5erP5OWiXfbO0yhHwbc5e5WgSvu8u+VgVyk6IgWnz+DBgI24
	yDV1+6uBePj6gmzd2n2hy2Oj9z/EFsj8SduAFgHUSGbD87VYgVPUEbF/38sfUcF6m7h0RNfYwPf
	FieqgF/Bgoc0ZXpOZFGuo8amux/xa+96ut+Rh21g8kMzP8U6iUmdzTSFk1IDJK8syYQ0Jyg+JEg
	8EaaAF30L0OHLQxSrLiQJBeOWNRAp6m2M++a2GqNxL0oCLhirNxndKrpKHWkGt5zYurQrdx10+Q
	t95/J1qGqW6XyJjXf9yEKOzMaFhMZGNvmdx3tG4vi6DE3KJ5fmL7bAoXvMJ8IbSKmR88BNwLK3E
	7U0FG6ysjwZB1y+48OjuJPCpfy1Alo4aeYUZtapJWtATij/UT67+/nYxtHyPlV93I4/0xf6UjCm
	X22eDfesfA
X-Received: by 2002:a05:600c:83cf:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ba0935cc7fmr37812795e9.11.1794396780617;
        Wed, 11 Nov 2026 03:33:00 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm159274795e9.9.2026.11.11.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:33:00 -0800 (PST)
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
Subject: [PATCH v4] drm: renesas: rzg2l_mipi_dsi: Remove redundant driver data assignment
Date: Wed, 11 Nov 2026 11:32:59 +0000
Message-ID: <20261111113259.3334619-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

rzg2l_mipi_dsi_probe() calls platform_set_drvdata() twice with the same
arguments: once immediately after devm_drm_bridge_alloc() succeeds and
again after the DCS buffer has been allocated.

Drop the first call and keep the second one, as it is closer to where the
platform data is actually used.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 - Updated commit message
 - Dropped the first driver data assignment in rzg2l_mipi_dsi_probe()
 v3: https://lore.kernel.org/all/20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
 v2: https://lore.kernel.org/all/20260501080818.955914-1-john.madieu.xa@bp.renesas.com/
 v1: https://lore.kernel.org/all/20260425022857.2382603-1-john.madieu.xa@bp.renesas.com/
 ---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5b257f5adf06..65f26f889a67 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1532,7 +1532,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi))
 		return PTR_ERR(dsi);
 
-	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
-- 
2.56.1

