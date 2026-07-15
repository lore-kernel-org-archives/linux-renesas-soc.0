Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098EF2F1FEA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122774; cv=none; b=GY+EvpC3EsaSQpgqhSVQDCle/wpJfy2wad8Ju3rFvdFSTNS6O0eLOcX4nyNG6SmimWmj/OTeosTDNbuq6vdAxdHo9DDVn1qP6Ak5UW0nq4Wgu/TWKtF7yQQxovY93P3BfvE41EX+F8cTAvgGzm4kL7wYMQ/KM0ThsAFXePLEwrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122774; c=relaxed/simple;
	bh=nRqbKbaWfRz8hfPCtBqKC/mvR+cJJL/qoNAprASWliM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJmpNi6YEGSKrOQpS2YAU+w0PFXkzKqmqio6TnzHbzwW+n6XTJCS7IoL+nena9b408blBt/mQj+24zfH70qiMUnFtOiR6zZhEXVk15Q0tnr7HousaBiw+G4eL0ciG7W+zvfV1Isk23G2DoxCVHt56ievCLozJJP4P7ZiPKPGf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puyML/nd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puyML/nd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953ddae026so4345025e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122771; x=1784727571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSfN1MRxYCHj9lB6dAV7fGSSShXP8EN6Hzd+6qGouO8=;
        b=puyML/ndvkzf9qrRbpjveiZtaq9j+AItRRTyD6nm2g7Ypwq+ZOQVpsAAlnU/JjMo+i
         P7FgMrStaVuRwZJIGetlJxhT2l+ug7Wvex2ynGgkK2CaFy5rAvZ+ahpW+jPzfZjUkjzU
         Oky1rYLlFYtL54aW0eR/tr8IGv16FLWT15ryxRYyoX3SCr2LkJcccyxrdSM4TGkfIpe/
         BiLzw10RIXO0mlbbfICtUuMY7nCO28uPMQwsbCf3pKDblKXFcdX2wOy4vIpVx2FND8Dw
         AO6lXZkWx1gE2HiqJRQN87mvdC+EGWSUOiRHVxj9/aGfUqwzM1IghrEv5R2BstLSvw2A
         ULKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122771; x=1784727571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSfN1MRxYCHj9lB6dAV7fGSSShXP8EN6Hzd+6qGouO8=;
        b=tUTdiPIjZp2eEztc+iR/SHIxyPtutwc2iSzTPUl8udZtzQvWQNZtwGgvWs8AFnZtAq
         x61POlQFZOvatq3+ZXSqEJi7tU8tJBYRRgL2zFX05GRXNx5jH2zq3U7577jDReqvl9aU
         n8SQecLC632zKA98/RVAb1ib0WIW53vysc5oylwFVvt7TpTaF3imfQVaenJB86sVf5a/
         nlX6l7E88EbQ8+8B3h8y3tEoWBWy1mhPMEA866dxSjdVKoTqjXN7Z1UWg2BubfbCqWy5
         BiP5uW68wANTR3L4VX2JMKPPcXBBQcBKv3iKN7Cn0mxVK6u40eDWLLLp4+PFLBNj71jm
         lxLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr00NIudbOHB46bHNRK2SxFaOoO+EFt+BkuTF+mdMw/CRBawphqgnu9slu2LPVuyNAk7Xyyw6BkYimUQ9aXKP4npg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxCrAEPGPTUrWqFfnoLgV1pxpz3Kj2QFRKBFUqdmDC5yev5O4
	rDn1ONAM2lL9JGCQA9hY4626f+mmTtor6GwXZHwxDDP+d81HkMTQq5m6
X-Gm-Gg: AfdE7cn39DMyldZVV6YuHc9jMzqMF53RrZHPK/c7ztZdnRVLj1G+0GZo5GsoBrIgPGl
	/3V3AJakd/D71R3KmkIYlhfY3DuT0dg8VoZMzd6TP6yxmEG4sdE3EVucqRWwm/BGcavtG5ztZLR
	zO2jIM4BEnkvXqOpSF6er19RVBn4ukkLefy1vYCHx0FVOOgLdy07RPx4wWN3OtRAWn2kXxdvSwv
	WCOW3EAcZ/Cs5smBk/F5ytTkKBzaQqlIJmOogEH3zfdHhxiCm8VUbJpAoYcO2kgBkX//p4i/ZqX
	/h6LYNWLnz/4m49+duvJuWEQiw8tHR9T6qtrN+uv+obpD7A4NoAvXYPpRpAXalGmhhvgQuqFQD3
	+l/SO45hjDd38AShttnGGV+pp2JjNF5ItnZcfCi10/OtHufxOOkF497KF8Xyn6S5fsw1vqvedKA
	e1HbGrM+d7zg9HKvo+AoeilDS9l7bzYdzZrO3ZIsLu6bw7ORSyR2orJ5wMt2dzCdzIcc9wdPKYY
	/qeBQ1VPWTM17f+zAV5j+yOSNo=
X-Received: by 2002:a05:600c:c4b7:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493f89523d2mr178874425e9.6.1784122771209;
        Wed, 15 Jul 2026 06:39:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953b35105esm79420195e9.9.2026.07.15.06.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:39:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] watchdog: rzv2h: Drop WDTRCR_RSTIRQS macro
Date: Wed, 15 Jul 2026 14:39:22 +0100
Message-ID: <20260715133922.2129340-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS macro is unused so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 0f951219caf8..3c8739902ec4 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.54.0

