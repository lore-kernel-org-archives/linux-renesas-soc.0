Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88044F55B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125491; cv=none; b=SYfQH5AbHWZFON4un3aefDz2PRNH0fAg5QKZnjueE+BIwz7PwJQFGamDLZs5rqnDmVk9irjvxLDRXK3QvlE/kYZm29JKRHrs6zyiA2RZ3hczJ2zRpSxbb/ELQ/iE8uHsN27OV+axvT4CkPBRKy2Cn9HFdNk1L39td2afjwzJobI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125491; c=relaxed/simple;
	bh=poHAk1iRSPkkWec7SAiFOpPgNT8Qb8coRxeZh15oi9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvutW5Jx1ovrAmLXEhNnESbgOw0sZwY4yDvjddp0zri6iaV0cmZwhgZRPcY73WJfnz5FFWAl4MDAgIiwGPVYgB1YOnySkS43wNR00vZ9XDB8ZkJiy6HCjKm94UFeXgQGOflY3XYYsjhC2hVv8mv6k5VeOSMu3IWv/gWsi+ZQYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6HveQpq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6HveQpq"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482ea739de2so509925f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125468; x=1789730268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfnV8b6AfEbN3w+t4mx2Du5Ole8Wgoa6AgZfitPXjMg=;
        b=Q6HveQpqJH0GGeri5qaeS1Zegh/Rg8a5oqcldnM7NHkB/YE6sK/c8zO3kBdc7/HD5l
         nglevh2+glLXKTQkg7FoGg7h5dy19g/ReTCjjUlB/T65yDe/IMuctxwa3K5G2MRzEEkU
         QRVvdmZQw25ZNqpXQJkpnGTnKGAL65iwEaOe8xyrvr9p9EkNVCHaaMTVFiKhd2xNypTf
         VQRQMNkFWOgFFSTURpeRwZaO1LOb/wwaTiul5lC619PEyqkw/HDqG55ld+dRQT2J5O/o
         8sIOBQe4+G0FTdetirra9kBdeSX+fPGHrOm4ew3MY38b3XZs5hkLLfII5jqYPpjYnFUE
         Vp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125468; x=1789730268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfnV8b6AfEbN3w+t4mx2Du5Ole8Wgoa6AgZfitPXjMg=;
        b=QEqWLyr421zikwM5gQFruSzDTvR5yMeyisoFoUkzUMe5NDwihgYkrfcnSlhmWzTW/t
         S6vzsbvN6IWxq9QcmiEVFNistHN8Pipwl7kAcm0+9jMA4CVNduZdXQYjxnG2pR1x7fPh
         5pBlg6ku8kkDEv1yAI75Eux6pkTAuhAqAidsxpkedBDbc7SdI6cUzwHWdDupdbpiwcZk
         i6jBmgBiuJfsvzBTL8Mibb29eHpSoOzS2mwI9HxvcUeZg3nbu/DGvI0o2I6dJhseuCXD
         kXtIR9uD5z9lXDFz9sjxVsXnyRJeoO1QCFVhW/2ZKfGWUdkcXCopzdIofsOk90rQN5Ng
         leYQ==
X-Gm-Message-State: AFuF++lNjicPcXvuSmstdbWzGKjHpcKac2ceHtYAzMsr3yk0AYWR1Spn
	eu0f5ADUeb8GDXqiwOD9sr1q0TScrikNOO6poTZ5yw9sagSbdRIJqX180VkJmVVylqQ=
X-Gm-Gg: AYBFou2auw8HOjL3swhC285ZkumD0jYTaE1Tt7br5uKYzgG8rKADonFjdhJKDaMyZ9I
	dA//XeXgU0g7aAwcP/Jt4D9N3VwyKFVs+z6ywC7YIsx1wAT3CtUWigni9s5oJFSCKUucVOwcIYY
	3G8OGJtiUG7iZWKlD1t6C6XzwVhqPO+C9FQgmnC7znsXkzpUsV7o1DggzAWqECQ6Zf02H7lBzcS
	ic7XV3j4kiZGiZXC3rltnA4ZY9tHXgsNe1O+qG7xgCnfkZSHWVBlQCdlXmueGVoXR7PqKcETrPt
	XqQJUWfbFIGGuoUjDsM6HljhOe8CK13XHbQ4TMuVCd8kYVMwwmO2xtzQ+M9IUBjslZ5oQOu0JhV
	ZecYXW2MXBTncuRHV8GIQ4IFNqGo04rWXwaTWLyspeY/G+FzXgPq5KJKVtbMzg2b4AexLF8TvXC
	ksi0Ok0LOPCfdrc0xst0EYEtV1WuMilS8SIbJDR8RA3B6eYr1XmEdgrtYjouskofz3krhhxKZVI
	dyjrm8+hdP8KP86WpEr3MWAhRgw+Z5YksaHydRvQMUmMz7BGTCuq+6tJFg8zXtYeud31Z4Qm2/w
	ts1zvSEo1EiJAcNDjwY=
X-Received: by 2002:a05:6000:2c10:b0:486:e37d:c57d with SMTP id ffacd0b85a97d-486eb345e9dmr4546787f8f.43.1789125467738;
        Fri, 11 Sep 2026 04:17:47 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Fri, 11 Sep 2026 12:17:27 +0100
Message-ID: <20260911111731.3404308-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index cbf414e0c9a3..4a5a856060e9 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -270,7 +270,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
-- 
2.55.0

