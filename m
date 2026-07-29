Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A971843712B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329732; cv=none; b=D08+TKxXvEkzlZn7jXbk+K9a0hWD+FUd2CgOfCglyFR+HwZAfQbE8X7FZmcr5KnSfCTUwVmrVg+I7xHx7Q46f1uPWCGT5eSsZ6wT7GwBu6Js9e/BlbErssoZNhm62guzAwbXL9cEsUvY6Qi4z8YsiigtbOjDGPI9LYtnxaFghdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329732; c=relaxed/simple;
	bh=5z419nIGXTaUcsnwp7BypsY1EVEP5PdrRKjkvgpAkbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9g4jjcr2e8zGDcyUyR4hdpk1tT/k5UCam+WwhExPF87GwI71JmVoCTr/pSex5AC0UkQt1aoHyLMhHq2o0tKKAs5jT+PpOtPqtkjnxVSLPcV/yk0FzNDwsGsku/gBvmZAjtKq0cQCqUxwp6FmDKcs2eMkjqbUuS/wlGxq/M6mNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTe0nQaU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTe0nQaU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de008b020so588069f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329725; x=1785934525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKm6yCQNcksyxuIgpcHIoi9E5tjt4D2YVHPUd/lYDCg=;
        b=FTe0nQaU11ebCri6cKPKbD585VBngVfc3bzCgyVNtpJ0WebgeydnYW2qLUW05dcVmx
         7DWjs8govJ2AylgnDdAhpdw4n5dUvbVCoGAd8eEN8RcuNZw00gFo8JH9blLQn5D17kDb
         iT2j7rbIsowbXDMAGLM+XPKaGeDEo9MYOrKojIMfZqQSdCV7IEXVlDR1V3jMWrZrFpNU
         lpJMxE1tZZkw2uqc5WEgKjwvC05KJYZAREwPahCEVIIb1Efw8CoS8phhE/eszZy5JbyK
         2keW9Oo+mPcvhQAWej4j1qLt8JIJ99mE6+IB0a5fyUKpFRplgQV62f8pwrKPdBux9lTp
         p5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329725; x=1785934525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKm6yCQNcksyxuIgpcHIoi9E5tjt4D2YVHPUd/lYDCg=;
        b=RN+1UM06KNY9EslyOv2sZGXLAurKNvO+3awHDeO3kX8YLGUUmSrAkKim6+ohQeXG92
         uKiBTJ54Q4Zreljkf5/e2tr3AOHnVbkRtjWkF8btEhyRXZzFRQXhVkUokQSir1ebEY1e
         AWlueiuG59+2T/xYSu9b+NN65TxdcmYwA2laaWuXx7B8qooGmDMFP9mMJMUNImqvK6a/
         4PLjQTVXb6ELO2AG/JzFRTEwBni1ijOFH0UPoEx8ploLq/4slYTWYdHq/4Fm6qdbzTOS
         9wxIvoWnlWOmYzjkDFhKLljx5+cX7XRiIV9shlFcihKejUHsifh3yeJI2aUSJqxK3lda
         8gKw==
X-Forwarded-Encrypted: i=1; AHgh+RqQyaGB/sGcjt+iK1d4ceac7w3kLCYeEEIXHjQJSkmEu4YNBDEXgdJmUuwwdhZwKvCLijQO8elofRCFhGyVtQlt1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGK3aLWqOIKZdgNRAbXGELj4XWaZ34FRJe4bt2SqO89NkU11zk
	IbOWyJ0NIdbRMn3gB5a4BwGD6e9nSBGTSuo+iDbh7H8IHpnF/KWsdrGS
X-Gm-Gg: AR+sD12ub0oyDC3icT3TWxvLuALX7tXQXTSiRhkcR/2vToXif7jNGJZok6PvVZ4OyWt
	gXlWtAJx4EvoBoWREvpEMdnkDI06GupI28SlWDzdZnOXy7LvxFZXuziYEqf8GdwwV5embfkGEbd
	VU/TQTMBWoITI2wC1PFYn4MPaD1W+Av1agSIbwyCeWft7DP8/s7KnE4za3EuB2XIl88007156g3
	u3sRm4XAZItE0Sdyw95gQwL2x7+1szKHwDNw485eW9qz1yTaoewig0a1CtgYlVxAvhFYlVa5fAy
	apkk7T4dFaREq7wu9Z+Gk7Ont/6NYsA1KB7F/LWRVSRSdrzrLZQVNBumdU2rcyqLnipah+KmA8x
	xAVKc2OhZrsyW/as9j3SrLlf0vk6WdY+7SblTRGIDsYf1X8xBkHda72A7alGN8pTRm9u3o7u/cy
	qfA+D7LvkXZZWB2IrxZKDEbvuKDlB2O4cDDUEb033zpLUaREs+mwlw4I2gpnL7OnoFe5p46AmC6
	COtQhntx2BI+A==
X-Received: by 2002:a05:6000:41fe:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47fbac058e0mr2854007f8f.29.1785329724602;
        Wed, 29 Jul 2026 05:55:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:23 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 01/16] dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
Date: Wed, 29 Jul 2026 13:54:53 +0100
Message-ID: <20260729125516.230757-2-biju.das.jz@bp.renesas.com>
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

The RZ/G3L DSI IP is similar to the RZ/G2L but has different global PHY
timings and also the PLLCLK is ungateble clock. Add the compatible
string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
Document renesas,sysc-pwrrdy property to handle the power control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped renesas,sysc-pwrrdy property as it is modelled as power
   sequence.
---
 .../devicetree/bindings/display/bridge/renesas,dsi.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..3832a553871b 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a08g046-mipi-dsi # RZ/G3L
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
-- 
2.43.0

