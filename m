Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BAE51DAE8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679055; cv=none; b=op2kMS/Ttk1ZMZvqshZv9B+OfPQtLsvzlO5iiSAE3+UFbRfkBVgg1u7i336QwWKMQVLhfbV6dJGdwXuvJuCFU0m9hM0qSPFKqM9GUi8+cA3aU4RYpRl7sLaw9CwlwFa81Zcp2Mk9kBQBj7+YdWnPdIJ92A6yY/YXvE3uzIhhHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679055; c=relaxed/simple;
	bh=OVUnuKw1VfCIL/x+Su3R5aFMSSrygI/xzkVcJpV45Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puIOH76nWAveE8hQ/3bxDAJwx20pcmX3t7HyKaex2K5SIOnIff1RxNULLUasy1COCXU2TjySKNEvE2ZI3nyEB8/vxFk9/k572+TKFapPAayKJYuPL55czDPGeLoN+aOz8LiQdN5xjejfxR6u2sHM2uPWBULyUcWOETeXGQdJDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQDlseh/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQDlseh/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so2385036f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679038; x=1791283838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs/A5b9nR+JVsXJC9eeh3ISdiCZQozid18OwQ5Bg02U=;
        b=KQDlseh/uVbz8y5rI7OG4y7TbD0mCqR8rBXZ1KfsBM9HOEmdN8ZZHrZG6WAVV9CdBS
         dwYcWr5Ds7zUHpQ9J9+ySkM3r8T+FVB9qYgNW0VVS/s7DqfW8eU3rxX1KPOibOU3B2F8
         EYHgOrF8d+s1ShKoR/jTIQaJ4ysaBSlJ9caFMfHoALHz7Lb5oo8tUxaG2MU/yn0JxCD1
         xjv8xjE+KVHCzPMh5+heE3u2WiiR+ibKMXZNd9LTG0C195JizkoU54545fhwLTFLu24D
         O96DdzonON2mYEkpXdj5UMSlj1CagaE5ZJgslGJ8x29gfhGNx5i93Bv/PQo1CMfuz76r
         IJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679038; x=1791283838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs/A5b9nR+JVsXJC9eeh3ISdiCZQozid18OwQ5Bg02U=;
        b=1Y0Uxm8MCuo2FGVNOU2kOhIlSHeshKxVehxjS/Lw9+e6wsnhx2snjC6CdIaYvNw49I
         j/FJwRdqeRTMAZDxiaNsJJzlJZGmw+lOkmrcEPLji7ITjzLFE1JtGvfga3ecsuvkvL+R
         RxNEzKCCDuMWG1WWYYQIw/7px3ocRqq0W4gma0mIiQ5rqrJOJ+w7RCMOc3B5gvdpf8xE
         8TnCvXrTuVsPuW9wq3v1bSNCGfukdcXWiBcondJYKcEryX8BGoA9yju85b/rHSAC+5jC
         XXU4WavrzfF7SfxqGcYv9IBSHKthApx8ECOOK6egvNeey6asc+u0l0Iss9a8wR13fU8e
         IG7Q==
X-Gm-Message-State: AFq9FYLwOmlp0e0FP8rVi3AmhQF/gRm0+RHwlfffW2ZPOdJu03USTwf7
	ZGb9eI+4Xi3oCRVzocDvMRDyOlnxtrvVvAWgELBLE9Rz77euoKngCeru
X-Gm-Gg: AYBFou1p+Z8wqKBT+O6wP4HwLgodClachojh1cNoKJUdGNMqq+hn2+k8FmKXvescI2K
	eOc3bbveDK/TieGOvFfRFHyYsnSlgoex9DljcMUXW0UTJHMYa4VrQLBuz3o+h1mKC+NrZKtplP3
	SBMGwEYgbJ1YzA55LDnmU+6H62AY/Zp5H2KjQAoLg0IsbgH6ppWcSMHb7zTmElH3lhBJtojPB7z
	+W5FtlcTH+vy8VTU4p0/OdRNDeMAeEXBHoR3V4Eee+yRnabFQCqLOzkPfHaPTM+sWIFka9HYQos
	1t/WTzhOAIzkyIpDePMUV2XyfgbRiY2rHdZoTSe6TZ2EIwUF7+dnulsd1jGB+7ZbyuUyBPhyywI
	bzFnOnSjVO1YgE+guA5zFingMO/F5L+hhyBvkaqMjBdx4cECxJP1jpQc/EAst4pLybC2BysOxWY
	4NlSUAGx/P8BCziEdbqQBtGlD9MAnW9zzPgbgWyDcLXniPFv2p47eDZD68mgxQX/LZSX9HUUxxw
	io5EMFIUGEXE4POL+B6k2uwLiLXqlUrzHsRycJ9G83DIb0Ymu7x2VwFprzU91Fdd5zKPsObDFJl
	qrX7kaLn5CNqtT6hdg==
X-Received: by 2002:a05:6000:402a:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48889ed459dmr17158130f8f.33.1790679037535;
        Tue, 29 Sep 2026 03:50:37 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 2/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Tue, 29 Sep 2026 11:50:15 +0100
Message-ID: <20260929105021.542730-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a8db85e85c73..f247e42d54f5 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -175,7 +175,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (priv->of_data->wdtdcr)
 		rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(wdev->parent);
+	pm_runtime_put_sync(wdev->parent);
 
 	return 0;
 }
@@ -269,7 +269,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
-- 
2.55.0

