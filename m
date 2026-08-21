Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8E7476CE5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320637; cv=none; b=EOd8qAK2YkncKDZE3FspuIwUoTto381zpXiseZTg/L9zSoh6sjuEt7yvjDdcI/JqftDCnRKDk9HSeDh2paMoH3g4SupNQrz/njkbd0cPq3cvRx+qVKAZY0BpIwWUCZBs+DZx2Cah30fxWZdx6W+U7KWwcbZo6BfryEf2ZUASkiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320637; c=relaxed/simple;
	bh=AH6oUfHnmcXsnjm+DxjEoBqd1Vb5FnHglP4xh9aXyJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmaVh4xsax91jT2+xaP+OovU8Ba2WV/v3v6KnoHLORR4uG9JvHUO9v4UBmKhmIrwsqugyYeXwGwfSbEj4NipoxmbKuLqNHPKeaxvwLwORCTNzeuQ1D/wiM42yqGehaoGY9UfJtbmcOLR3I2RrUuiBjrzf/JklpIBBweL9wvpIlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZeQPy5o; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZeQPy5o"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbeea240819so616549a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320635; x=1787925435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4G1vL/8vEDUkF7LKjkQY5Lqad8PP0uoAQCy9KkC2pcc=;
        b=dZeQPy5oWrPmBZoAC7p9feIB7O2ObUy6iBDR+P06GpkVb/USsyALQ/i4rLEhduOSpb
         1V9sEsFOlRVKiub+uNv7KVAW5gCKXDIW7a8L5MFoY8w+d39rOHWVUr8wQOmeH6xDkT1s
         j/1AnnbeBIqzR8nsNJ0pisGbDHmVhGU+9qJKcITbXuawUSO97YPommA//1kL/6JItfnO
         xO5SuRz4wRFgQfqiv6XAnPj4r93ugOe79ZBzkxr1VM3JT29cpmqOUBKde9XzK3buEjfL
         3Yvxks2kdiPLCuHFzxNWAfPBgkR+7FqE5brRUO9R0V83Ba95eYCexdkiVQ3BLraZfOvv
         k8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320635; x=1787925435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4G1vL/8vEDUkF7LKjkQY5Lqad8PP0uoAQCy9KkC2pcc=;
        b=G5uNqx1rDjvxbtxWM48eOYrJb11PGiCelwcINaQeV9UpwTwmoMx1YLCx+Bsgy4B4D5
         eQk2+sBRHkmvmX/jiDoW/N/5tSxlfYpw1gWwxssR9f6CZ6ZZ5af3uhALIm1+O0BfBv/1
         TOIAVNYFVgSEmkdPYWj+qIIsgOzfBa06G2Y5pqvN671F5V+1alQ8xq2gx+s4FKI1NTpd
         OS2zLotHh5MRMijU6c1Rwh67gWYdTGbIz4/h+pAqsSMIpYnIju2QGWsYDzN7nxffK9H0
         vVD3iA6BVfRovGcuf+2pJY654CJ0Hwx0GkVs4tDYr61Bo//mcGUTigr6h1+Al21bNX3c
         MEwQ==
X-Forwarded-Encrypted: i=1; AHgh+RraOXe0HabI3fbq+n3rqAB5BoPf/ScNTAkIpJJ6vxD/K6LDkvt/1I2jHVE3indYPwg2/fkmwy36EupvddZrtFRmGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJC0wbVqRKCm0kCTkNv9Tu+V0c0gm6I4tFX8VZgLBKuHZhg7Ul
	jbqO9tpgq98R99Lz0RAplPm413offS/tJV4WoScSfi7TjtWUPeMYoc8P
X-Gm-Gg: AR+sD11BrheMMwkPE+R34WYhKQUDa33sUW9agzSLNge47tvKNmw/fo7sCY0h1JHC54/
	vhtSszZnkNNKePi9HIJp8Tsxyl+3fhdLIRtK2RV1vj7RaYkX64Rc5Yi49KmuGEY6ALr4xJQLj2E
	lcSgorz6zbmne7SIdWQqNNXlcus9tbm/zGKqzaxityMQqT+2DZ4oVh4Ctc84gx+M4IDdaaEgu4/
	w5fGFUMZsX9b93jWUyAUBSPTpC2HlPZ7oZBJ4GVvR2Yvad352iR8CdcM30O7MsX9cJHo4fLXnTZ
	Ah3Dda65/VJUld0Abc8zMQlNTFFnUCIHG/UwSDxqAWT5p7C3nJG29w/kFIYeru/uh8MrLfwOKg0
	pOWHtfG69yG5wR67+4EdfWPE8HqCFrIwhb5JK32gWsfGrf30KAgTjXBjC1OPgdWoafztsqnbIkS
	jpneq8dliDlLNOfU+Q5EGxT2VRW8Cq5+LnufECDhIr/PteM9Xj91hDb23g6kD6ef45p8wO/E/3P
	5SV2/SZLrnRlBxoD3Tk3RclcXy7m7O+ndxKmB3RAOECZ1gvfyJocrv8FjHb0yN6XuUg84Ua1RCZ
	wLOERvcBbg==
X-Received: by 2002:a05:6a21:9d48:b0:3cc:fe21:bf6c with SMTP id adf61e73a8af0-3cd3009d046mr14054819637.11.1787320634827;
        Fri, 21 Aug 2026 06:57:14 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:13 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 07/17] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Fri, 21 Aug 2026 14:55:58 +0100
Message-ID: <20260821135608.275233-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 09631a3a5134..a7f22a491d61 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -524,6 +524,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

