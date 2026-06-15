Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF374071FC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538506; cv=none; b=gpWN8+yWu8bugF/3leARJbCbXu/RaA0UfSTnxA54MKejtEv8Ao6oddSgECnVXUvv/8g96dMZa4qgd74lolMAmaqfr6/P4XkOMF5hbe3O7v05+rGx4pyMZ6/HhiVzXeespgIdSONNAmi62xPyccUnUvJ9FRSfa4ZwlvQQ7Rd5/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538506; c=relaxed/simple;
	bh=UCb4fij7psL6yYMNSImmg7/vXhtlGjp23JJjW7oL6CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSVuN5bvGunwYtFnG8Nh43bb018qkLLfk6i3AzcwhrR5j+858YAVL/j+ZvjlI9XV45CxFWWC0roPjbH8q8dWuUZolQbSsT0NwGjFpyQs6o5cCBeamHfufk32nR8ctvwvzi1amX8BeylgnQ6fXdY2gPwt1NB+jLX6f1FYdGoXUwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmglHg0D; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmglHg0D"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49222fb062bso25542585e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538502; x=1782143302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRKg5ST4VFAZZHfw3kjoGIXnRyq9TwBzRi7iadBRYbo=;
        b=AmglHg0DtS/4zMls6dZcbtQljFWSMewG+rpDWiNiBMnMNug39eHdotM23wPPc4tRvD
         OfWiwYplB8MuOq+gBwwjZrpPADYMjRBLXvKC+MMgFdXGCeXagbVZSed4ih9XbEu8DPYx
         IrapwvDgcfhEgV+kn1aCjd3DXegknzd6f2+pYbE4+nCZsWBFWKFcaAKOsh8487F1zWo5
         ldX7c9nvP8L9gb2oy05ksSUYXj5Xx33YP/eig+2NaQd9n81dLnFhBVvPR+Ogwuwf/G/2
         0zZVe1lqa3Nnew1B4/9fAI609FOfR1F8aYz0Sv+1/9ixYeGLEW/RUu6G1VYbL8aRAhK9
         n4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538502; x=1782143302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRKg5ST4VFAZZHfw3kjoGIXnRyq9TwBzRi7iadBRYbo=;
        b=iQcAA9EhHSDUb1NOx0mNm/3LHiREZryZBIECfM/jcw2CV765YcjGaqfsdA2RTAhgaX
         J3tW2wLF3Lz12dUi+0qWoTzj0EA97rPUdMYewqjNZQyC0nuG0Q9wgmOl5trpoHGX8QFZ
         ks6nLlbbMyPf+oTjNc4qstxlVtLp0cu8XxhruMGiPhN2FIWSH834m+oGHTRDJFkkANcg
         AWwz+HvYYni+9uRa81ckrrfSjvhg3M5jVC7vFmljq8UHCiejdEVUAP5mtLU1whoUAUgB
         RoDEHrsAzK0Cd/0Jkx9s+6Zn1amjPSxqPWYut5l5WpxN2cO7Fj6j7XwjvCC3Jj2lzh5F
         etlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zj/SsX7y/38Rzmi3cfHiL/YDOLyHv9R0XcJ8nda/pKyFIBPpJDU91a+/ewHQpALIoXZe2kQUHUYzlvoa8DRyoDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyu7s1w1EjGCfKa1zgFJ7qu86v48wsxVxe1l9W4/pUY/SHaeaD
	QlXPIaF/Sd/C0Ilj5plOz2FKEcItQs3OsINTIJGRWw1uFi4KM73tY3k4
X-Gm-Gg: Acq92OHJ7sf+C6FjadjWs/nZoZyWFa645JpeuCeEmq4RrMO/Pm9crktl5TaYNdhmAoM
	Y+J1+F4B3SEIY2TkIeJWjPq7+siqG8odI1BYlP8tYH+ImzWAThSsTUZWVuB/WT+rVTqDkF8/Pn2
	1KbWEXuUvOx62fEpLwDRM4N7q9V1qi+qf1xAVIl1oE5jyv4yVG0ldJB60fHfba9zpOrzj1P60TG
	2RVvQpZLv+t5rhbrMl8ZIfXIYd+aArDADKGEw3OLdWCjS4idZsZf7OUcMGxJoLXYYshJFSCcDeB
	gaLqOUYN7Fl2cesfm6aq+UyMHo4sSVjCGSxH+GOMSnQnzlq9DJLYMk//Pw1ZE+YLPUjl5TzAWoE
	EWFuefdONrwVQ6jLAvq7a6aE3TnmecQCT1GAStUBDLPN/FzwGDARgk9pA0jtQkhBLiTZ44QN6h2
	FyowplXLEVwRYzWziuQ+6c7bv/XvUImeU4QgD5v1ABpYofZAqPEU5yfHeYHL2xyl5VBxQzD6bzn
	Vmins7iuin4gIRhqqUFJfggbtw/zLOCuRD6
X-Received: by 2002:a05:600c:8b18:b0:490:e1a6:25d with SMTP id 5b1f17b1804b1-490ec4fb514mr177988375e9.26.1781538501749;
        Mon, 15 Jun 2026 08:48:21 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Mon, 15 Jun 2026 16:47:56 +0100
Message-ID: <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index f81d691c8b9a..866ff595188d 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.54.0

