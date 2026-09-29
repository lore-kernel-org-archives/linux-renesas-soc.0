Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330FD4F3EC2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679059; cv=none; b=pfEaCTqxnZ7+AdwRi6jUnDg5H0y7Lss1pL0xiCGwVPjh1ALZ9rpGogNxNCdOg3N90Ocr6BG5aFuUCRJ+WECesijZI+bCp4W33iF+FeHdw9smRSjGTdbsCJW1+dSjO2VOROPNyTVy4y/aY/ejEsMybkuipg5N8MUP8Htk3CNFIBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679059; c=relaxed/simple;
	bh=yEBiC89OR3qXvDQDCPsvt3vnd76aREcYsfSAe/oYJqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dS9eItpWB4Oh5YsTkcoAyWpmKtRQ5Fe1pjwipsq4u9D8YoVCi53E81onJxcTLUjD13ldVFAtZTDvfM6qhdXZFoZZvaGFi/ebCsuDcehb49JSSOut7kvvm75cKDB6IOq01h7EqH5NrNIcEP1NCfvcaBlCJz9N/ZlhE820EVoi0jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmBgauqP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmBgauqP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so24960075e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679039; x=1791283839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9o2g8NAo8BLROcpDMeEoV80HGh5uA5p5XCke07A0uI=;
        b=MmBgauqPf5DoL3EuA5ugwMqKxCx9+fnMEX/8c11Dv8Q4OTrqhN7gn2Q5S0jVVn1KX1
         vYIJk8yTXv3WnHSprzu44vY4OgxL2d/aknXRa7wMXDGk3xCF022CYNGFW+C5OiIT3pmL
         VqHMLsUiwrcmkU6RvzYiyN3o36m6JLmDdbRKsfG3ewbZpve6+lTt22yhMbmVk1DIA0fw
         HJFs4UahZUbrzWkdZEyKW3jilheo13RfuD5dfC0eqIDTnLbLTU6eWRqFNf7LdeMMV9Cf
         qLxHzaL3aISxb8zhb8xDfESA90U0hQ/gYrXY9IaUXMN2xSWy9vpc9kj7Rill/IwTWxNZ
         hYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679039; x=1791283839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9o2g8NAo8BLROcpDMeEoV80HGh5uA5p5XCke07A0uI=;
        b=GHXVHMcTXk6RMP9lgIXf+p+yphD++xnkS+0tcoyWto+RXhk2SRfjuKirjH2sJHi9SX
         /UD1PMmucIySVxE8wmqUDvBqG0XDcpX6AWQFQdktXn3aMCvFEl33gUFeeBnjTjv0L2Na
         wH9WCvFNvGwSaHtueEyHoM9wE7YMvO3Z4pBwEigFfyHJ9YvkZ3tJH37f+Cs85a0C8wDB
         iJPiWgox32FLxoIvVUu/IhLaAqJw18Lxn2sTyftfgYdD7cHe09fs5h5dtBQR/tsIw8aW
         A1Eh7YUEa5NLtakAzltYPrNBYTCgKiTlu5RnYdqnrEdrXAinLuApfjUqSuSVvjvmbAbX
         EGtw==
X-Gm-Message-State: AFuF++m02OmskYoOlITcocG7Qm1d6ZqWUzHi2b7BXQzZpgoPj1hukmXq
	sfGf5ej1F2vlLqZWzIbHkDLxo12Hd+VD0b/2+LX9Jmbz0EbswwW1EL30
X-Gm-Gg: AYBFou2AtUa6O9FrfqB9RliEZyGeiZQETnTFke0UBtG3z7/GvdQO5Ot7YhVkBDU2WX8
	62PcZh9VZIC2AI9xSimmqOEOU3hiLi1iMDsgnJrISz0g5gEXb9mxVADPPyTxlNen34GN5+H6Vdp
	JkQTWydgjeJmwy1EcJwC7PVkArUn1aI68VwPR/1QaBatLt9iFdqytmgipXifEJEK/71eLV875qq
	yKchKSPELFRi/loWgspgjDGYLU1OGW1HsQY6gnp4PkeX3vUxuOJFelLNqh4rTel6TTrxxN8S3Sp
	FkDNQPvF5vyt+NKCiVODcc//Fq6F7yrRISRutcmnMIkmCTVPWtwK+Ex7XBsgbj3vkC16EOC1KBa
	zT7r3swBoqquH9AsbrhxBuDb31pOSt4wHNKtcO54ScZaw+C62ySvOC9xg1yNkn3vp2FLIIynMg9
	qihcHQcH6zxqMrftbKt+yQYjY2mXegxLXW8JJ/TmtFKYR0FF+Tgvx1EbvnZiF9JpcT+ORLs5VHY
	SKfvSWkUsZWJjk1LVoBlewb2MufU1OZFec0CXFQX8aczBfW7TTj5h2Xp3zzgCtZJy8iQjGNXVnt
	h30DFErl9bjGOtTrTLGZlmSBFPq2
X-Received: by 2002:a05:600c:6291:b0:49f:ffed:2cb with SMTP id 5b1f17b1804b1-49fffed033bmr120811245e9.6.1790679039014;
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:38 -0700 (PDT)
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
Subject: [PATCH v7 4/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Tue, 29 Sep 2026 11:50:17 +0100
Message-ID: <20260929105021.542730-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 55ac11fcfcab..17c9e9a24ce2 100644
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
2.55.0

