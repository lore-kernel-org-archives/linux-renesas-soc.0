Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268534C815
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916216; cv=none; b=iUMY6FebRRMHx9MLEPJq+OBqtuanBIomerNah/j41ZMXifCOyXfP4HrrIHm+BIsIVcS/ALF+fKsZbmhbw78pj0Yw3jidcWmklT8c/1U3GnEcqy/mRYX+4st2VS4pYMnGcRSWZB0fhQ5vmjWPmpj7n6m8ZP49SrkO38pmGEfoxWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916216; c=relaxed/simple;
	bh=OZkCdMx+rjplXJXoJyNaMuNBYl1kd2GTMziWSPNPsHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AORfpxYIJb23ufTC0x9fDrxHVerkinZOUZW8PqhvE9egSspKRm3KBG7RbxE9qMxH/znjEoZXolZR21xT0elIDsCzdssxKEs2zPPL2tab822GqKVKyFAwBzB/+GVGIIl8hXBXUOw9IRCwm5olfFumQn2+XrmrGhSSCNyfp5zK4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho6L+XgT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho6L+XgT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-473ba028d46so718663f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916213; x=1783521013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l3tUihLneFPrnWysYsFL0qPvzOr5P9+eaScNelAyF4=;
        b=ho6L+XgTZSpIVFZhRy6DeeDBiABpJVylcyEFeemLet60dqYTJ8w6szCEgu4mXPvYDI
         TbmZMPiNdItz7qLuCUFhe05IxAseSk3JDFPtgtsJNfrKi6Vf0szSjRojxOPknDQWm5gn
         VX2w1g44eMAPElRIx9YJXzQByEDwHPZRvbxXYdaH1/66OOcR/3omPPb3jQ8RLcrIYbCV
         2/QRaGij7uq4qeqJJURFshdL/WN8ISgjB/Lo+JWk7sMvYv/YpCi3NiTsatJ37vpEth5M
         3SBJ7rdX/evGQ5jfwwTCOz51LjUFaHgzkcI7XT+97L/GA6TD6svLkNxJSlXtEt9OuBSW
         IVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916213; x=1783521013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0l3tUihLneFPrnWysYsFL0qPvzOr5P9+eaScNelAyF4=;
        b=cUSfyU3+CqRZN+rIQHHBt1OsP8QV0rFbcF97sUk1kQ305jMkae1ln/BppXu8GM14MH
         Rl9OQuAwoVHln83B4TgOTb9rr4Jawabx2BJ8fnyV6C4q6K6Prb0xgApkz6r7BURijLuA
         52DLSzaGtR3zCuLKhOGUvvW55mmYbx9tCacAyn9em2vmfgfu5OMgyI0Nh6+Ajn7dOdjn
         8koPwbiICKgWrCd2wtu0ejVnWaUta7BAI5Vk4LCbziq2jSp8yV6TDzhIDmaj0CkfHhbd
         ARsfeKGYxxXn5/na5M26FKA1u3iDvMZvxWoBWa76Tc+sq7stKAJq4OBUhDLfvS1LMkpO
         b+rw==
X-Forwarded-Encrypted: i=1; AHgh+RpkTFoFPvYs+srj49uLQY/3wcc3gGYZUdF7bsseEXtUZ/TUBmz2VGCpWT4bBubqGv9cuMfVlyseam+8Qgo0x0ktUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1xasKIV/j07CTN5dUAYQK+Qw4beBY+6GtMFZU7QzGn1Bn4K+
	AQKC1Iqa4O/CwXpr5vUFC13TaBxt5K3Z2mB+xmMsUowYpIn9AqHUVpg8
X-Gm-Gg: AfdE7ckeYtKRCF7ZsVxqF0s3pBCLZhvXwxlALieipOFTUle+h3O9OIm8Zf2T1IMcCgC
	+ZDgOfuFKxE8r94WqQNNu1fbGnHSOEFJ1USdswP8xW1gFFQ4icT8yPyIQ2HW9fwsHIrJ3ldAS7L
	7KnrJhZHS/oYTxBnEPzRiuRsjteziB0Htf7kTa7iFsDotaC1HsyV/deB/5FAKL/NQRsi+xnPrXx
	bHSvy6N04LmiFojj4Ud7cnh5UTMOusKDx4n7gEoeADqCF/0B8+FtZkpucr28GAl1W1SgKtT+85Y
	rD80ViHoEiqrJgXty4xG/U3VQW9+65MKZdNXC6ASqHNd5YCzPCcBZ0Ak383yZ1/PJeIhh9YP4zp
	KA8wyTkX9+0bbumrG9zaOO0HAJ7peLjLn95iuoIQl0N+ITCuUEcNdonke91/H+HwuXKuY6KvdDU
	wK3gQYlaZeOxq4VTFpmCA3pS+I6h2kcvYfEb5dr3sGIkHLDfK9VTKj1sgdR4bzy1CHDxcLSmH0a
	PSi26pc4tqZ9YjpsyxmIz4hjhwlLNPzPwQetA==
X-Received: by 2002:adf:e195:0:b0:460:64e8:2553 with SMTP id ffacd0b85a97d-47757e57472mr3171049f8f.4.1782916212964;
        Wed, 01 Jul 2026 07:30:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:12 -0700 (PDT)
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
Subject: [PATCH v2 08/10] rtc: rzn1: Consistently use dev_err_probe()
Date: Wed,  1 Jul 2026 15:29:51 +0100
Message-ID: <20260701142953.2014895-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use dev_err_probe() in the IRQ request error path to make error handling
consistent with the rest of rzn1_rtc_probe().

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
index 4540d764edfb..f236b08e3ca9 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -470,7 +470,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(dev, "RTC alarm interrupt not available\n");
+		dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
-- 
2.54.0

