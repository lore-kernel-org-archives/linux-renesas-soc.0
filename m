Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026423446C9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916210; cv=none; b=JjXn38zZBIPEet8tXNHs11LEWwOzpZP8vgsFw+MvF2+8EMf+fsL57KlBWJJhloSV5G4db0p9I33rLkrA0XJzCRVH5inhrvFZ/gUxFVq2dmnOqoK7J64tBikM3lXvqibu09PMzwywUCQUPl8TSgB8xAhi6BWHIk2Letox25NdQQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916210; c=relaxed/simple;
	bh=0T8cC/hFFANyEgdwCbRvmlXafTxrOhEQzM04Qi4pkfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ST//ydA59FmIOkGPEXGTChVJIV/1LIZfrGFoiegxijyDLCcMGH8gXDF7av9H+SB56ILnavT/jYjtCA28MJyE+A5FRWNfxgb64jBTc0gn1V5QS/qiP0KP3vdzMOl/JzgUmSY9kdDFCnYAo1lVP9oA8+K9Zd3O0EV8Ou2kUoWEQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFkntzGQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFkntzGQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4631679f204so1126637f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916207; x=1783521007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n483I/Rl9OTXPEbvmmm1+9u73ydJ9A81WZb0oLTQhI=;
        b=AFkntzGQuqoAOTkq4wK4Xr1nknY7E4SNrN6CB9yCceiWtqCc/GcHE0YCgzDw+M1/bp
         5SA69MPitkHmwfI2TdSzb65IjoqMs/V+QbLARVpcd8eIXmswj5L0TBBMIVtDPM7yptmU
         tYouLyRXxI4V05+59cWJ+BKRxtPXn9UAzWa+VS1P77xwSH59PC78qnCO9tiLrtk9CTf+
         KdL7Ep4/he7Mz34HzSfhd8Pw1TdHtG65Jx/vD3JWj/vEoS7kzFzJqFHSAkBtVn2CCMxJ
         jqd1zm9yMHE+gMEgg0a8BhODPRXqr2gpCFVujwQiaym/wjAaOfFD58VbYWPrN6DlTOg6
         E+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916207; x=1783521007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2n483I/Rl9OTXPEbvmmm1+9u73ydJ9A81WZb0oLTQhI=;
        b=fQzs8ZFqPw/TGQENJEIqAJMlcvZyh2rw/WhGKocZOnaUzlOhoRE+vfYMbFPfj3U5CR
         Tl2YdEcZzvdd/wyPX9Mch98KNmwXrQxfwdfwOV5/+VoehkQwTxKGUZ2TWsJ/JIQxUzj0
         3F9BDEb5xYlIMaviQurCe3NCOhAgoGOqgCmLuOI2t0TYOVw6TIod/au/8Wr+LdiUlx43
         2VyYid0PWIm2MpRFHPpSxVb7NwTHz2Fr5hrDgxUQU/H0EBKzZ3fo8H4maGqtjFZ6yKji
         ishWt1UJl4njaZzLOtmTQrHq8cDUYMa/EotDpPH5vkuNMpWPgA9COGJ/U9TqpAXMBUNf
         eFNA==
X-Forwarded-Encrypted: i=1; AHgh+RrZc+g6MRe2cKxb6d9UBiSjZKOUgAtBLhNUvKhvN4WxFL7GjJr3E5bKGqJrXhea7JemvaNvYfQxY4f+4Hp7ZX5Kvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hJaNU4qWwe0a1eNj+XisHAMIaSFRfGR/gKAvON7jFjF0DYvh
	GM6j0+ijudIqV3IwNiW2U+3avxvS1h121qjBc4TsQiwrHkBSmjMoRlJI
X-Gm-Gg: AfdE7cnVqHZaWy/JjLgbau6SDqL2zKF3ZgcM/UOiJMfjoCQbRqPimifXd1Hn5OPPYYz
	Nd6K7US10DVYXXAao0o6nYrAq/Hl3BqKzjeiuet7qPEYvoNt99KIiKRthJ52wcFNKr748NBsR2u
	GFOS/wc4nhIBxBxNJa2vfKjRjG2+jg1xlYiVBT3kiCSADufe4xaPYurIC31um4GtKW4U9qST6VI
	/g19o4UYk5jSmNHWSIugdE6/krOR9rqHayKvkNDlM1Yd9IKo6gGJU9xdqTkBTk0B8YVHYTN2zEZ
	w1stUQnuhad/wB0swGRv5rkrR+7oPf4sLC2UXwCY1mUyTbgGZBNNUN9+FlqOHrFFZXTfUXk7vM4
	a/TVZTXNA47Pc0IPdvTKPv2L5HW7eDOw4P12WhQoLURzoOH5cr9t6jtPnb3w8i+QuglfHJS1mpu
	V8IBaDaJ6G7gdBgjI8MV1ozN0X1wxtRq+k++VMOdP56yEE0S/yIkXkHeLIvAYZA9yxncDQuZL97
	795pShlaPa7BQemUr1bpFDXKtg=
X-Received: by 2002:a05:6000:178d:b0:463:b7f2:cc7a with SMTP id ffacd0b85a97d-477458acf56mr3073152f8f.17.1782916207400;
        Wed, 01 Jul 2026 07:30:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:06 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 03/10] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Wed,  1 Jul 2026 15:29:46 +0100
Message-ID: <20260701142953.2014895-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index aa27ad7f5941..d56be7314a91 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -516,6 +516,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.54.0

