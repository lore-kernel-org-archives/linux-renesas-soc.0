Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F037C0FB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346662; cv=none; b=VnPgPa1my6liKE7Afo1r2ot4x0Jd/7Ss+uEbRVWtWbOSZgDgjscg9e7H0KQ7WxhL8RV5UFWqlzctH5nbH/bWK2S3EFq2QY/u9PeVATQDYUqkJxWy4t6mG1Rg0XMZhhhNBYnyO5Wm5i4GMQGlZ+dI3JWHNfyG5Nup9BH/Zgy0pTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346662; c=relaxed/simple;
	bh=FcFe84J70STVXadjwGrYhB5cH2/wxennvKnATh/rQVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDPZTkpjc6OayRYNp3oUTbXOMPWadt+dtjT8lMkpiCtzMutJRZYt7+Ta3AWBarBmbCqJeX2Ph05dL97x8+bO2nzsDB+EWq58XA8Y2mX0ZTeWxMYfohPpdzCxPPiv4I/+LQBesadrZDivs2G3KdYK9Hg6n5w444EjslesDoBLCE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5NoM7Yi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5NoM7Yi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceb096e675so17960385ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346660; x=1787951460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIt6UFBBZvWrPn4NfEvT8ScoUcoqt+wSNI1OUlfCTAU=;
        b=G5NoM7YiCH9RvXAXA90hGh7k69JueHpczMVYzOO89627Bs8ENB7nOrRmJ5febnQhSc
         qGHRiYPntC/USEIqPlNr4rk13Nmq3H9zp+N4qUacRYewh6321IleR+gBsobod4rpfqcm
         sHZTAaRQX6PG/TMxQJvoRGBmvHa7wcj/88qR6HJ2DT664/jg6C2ybLc7AVFVkkXiqBOc
         EpujOyLtpW2ODgLf26Qa8tFepXuA6vRCBDmmnFhwQeQ5pbqJjD3lzC8wHV2KlOvwBjq0
         ergA6qbGUnTLNYgpLEB1ZD/Pw1+OmS4rNcMXdEbaipWQlBMJzk7Jy8X99JfoRBbjXd5s
         mWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346660; x=1787951460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIt6UFBBZvWrPn4NfEvT8ScoUcoqt+wSNI1OUlfCTAU=;
        b=TMq1GL+Rit/Ne3IM5wutfy23TVbKhKpR/BGMT7tm2mjoERTBNPVBdiWs4JnWM9WSex
         cHXIWyGxVft7ePTMi14hjtmemdboFsib3+EhsQYlMuuANzMZbye2hGEHSSyKgbRXvbOf
         +XteeGfI0bRt90QHU8RSX9RWHqhYYMgv72esVxOIiLMbbtTP6bfsXXPqg3DvkqGscDHP
         yVBlL6Vvbhyq0ujDVv9TtTBpe8hFZqDqRrVbbYxi4f5klttzXzsDXjuh3Kz47h794vKq
         eyZ9L5qJ0yVE32+gB3CWsjZ4+luUyd+BKcf0Hn/2cigfE2zfriSXXZH4kyGoVa+Wfvlc
         uCeA==
X-Forwarded-Encrypted: i=1; AHgh+Rrk+TpxQR4NCZKK/SuwXhXW31Kn++zLF+jNI3dmaNBj8x8EwXyKnoHwDGu4yaAL0/YeuvyP+TL+cJxebcySfQyuNw==@vger.kernel.org
X-Gm-Message-State: AFuF++m0XQKU9BdnMVeoKoEEkRHF7gwiR6I8Ku+8n+GG8XiGK3aDZE+k
	QqFOKC21hqkBXYzjGmuitbMZ9ZUu1z8wEBXFxUhOzbT3wiazOntkLjKC
X-Gm-Gg: AR+sD106yfKNYbvmTH+l8UTR6qjRsLTPFkv5GqZJW/sl/OrhkUKovtuBaM7aroDzAkS
	i+j3Kiyhyjk7402JR6jnMQo9mK4CCQ1dKSk3hPuOFXgkk+4/3ugvx5Efk0PiOo4tAMIAMJJoNma
	0mO9J/T+WsLZL1X5Zgc/GAHwLEpXUADGSApfHde7u0sd43/a639NW3sskI9EVcMX5ZEtdGdZYd5
	99svQGVAoc0rI5kvVGISdjs9CHHipMwm9e/9/Ib9CdT8l9wkdz7H5mtfcexUgut3Pv+1Ym6P0ZI
	dv+X10FA1M1xk/kFe7rnh15AEX16fin8BoKmZAxBmUC5Imu2v28pS1slm+BaBVMqSOSiXY7Ezj2
	4GrFAycLed1Qz8heAILZxSqSWdaae7OKC+uYLUt2rgry27zNVU46lJBINcolgdknGSlkFxrKm4i
	GeLyq1KFhtUEHkdRuTnCXQPWTA6xU0BHwjNoXCXQLU+WTLRG47UwcX4XhXHk1Najc6OQlH/1678
	k3r05zEATvofJnX4o2JlbvZkKEuh88Nn3F13QpGNIAWEemFhdo4SwRxeijMk41H7OBNbtjS
X-Received: by 2002:a17:90b:4b02:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395df2595femr2125893a91.10.1787346660098;
        Fri, 21 Aug 2026 14:11:00 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:10:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 02/17] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Fri, 21 Aug 2026 22:10:17 +0100
Message-ID: <20260821211032.13554-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- No changes.

v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index c4ed43735457..f81d691c8b9a 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -465,6 +465,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.43.0

