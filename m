Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778373;
	b=nJIOWKsSFUXiOxQLT8is7b5GQxruqZCopPqZvLFTcgWO/Sxkp1LqmtE5CVodNJkXodiH
	 eZQsISJDQCZq6otnWZi3WvUVjLTqFrGT/12rjKhy1rLQOWxHnp0xZRUWQp0V2WtsTer7w
	 hvDV/WQqRuCA/VB4IX2PtY1pGcIMoKGpPb+Y4Lv9YRgcRX3WTG/7Hj1lmYh3CEUwkNhaR
	 ehRj2E0ClBPFq1Z9U+yjk/j6rnilJbiC7mMR/xZ++a8UJ7BCXRHVeEs/MLMF5i4ltJYkl
	 PSQOT3OPqXOV02EsalgcITVceVJsbc9EAh+JGHlCuNsqpy3X0CeIh7OWP0BexKVh/6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
	b=vPVz1AXYrsZqbbOI7bgROw8X0gmmYGe/HSyUhf7lzragGmnSylzFgm10FaAbi2R/3cV9
	 i/3bh0hPS1nWATWjLgSa/SO6xxcKdvaC+E1tjAMqvcXeM0vYj+pcKVdwLPueGjx8ZXW1t
	 5Gan6h7jNSTT3Zs/G5swJYsS1YVgeb85vywEIWrhQCH3l5IJNedkX6mqjRnDuVCBGqeeJ
	 mTIOwJd6YaXLQG9ckvqE2WKGHL6wK/llWL7k7IapGEgFAPPdLC8PbFuspQ1S6is/btPWr
	 uCl0Wqqgj9Jawa4Yam8ufFxxg0Ycjo+VhqUYYcv0ovMU2pe2VHESdxuX9VUcZG0ZH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jH/5CyJx";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6898060A2637
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 17:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6898060A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jH/5CyJx
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso13397295e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778372; x=1793383172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
        b=jH/5CyJxasgvY+0HhkFIIm2P0gmCd6I7Z8tSrHqM2RBWOyvZtww24dtS7KOA51Ut4N
         KaMcTeRuN5SCws1rkHUNAR38QfSLU95B5dSwlw0gxbtXVyW9brsPeEgitDa1uCzyRdsh
         cKX/O8m+QaDZt5xDYBrSJIk3kbOFB9+mVQBJYabTGfvEEb0k7QoKTdXhm1LLC1TOb0SF
         +CvNSLxZxDI2WbqiERTyVu0iPklbrkUApbFf+h93/ynY9z4Ee7J4hTFgmlCnwcA8wNjV
         KZVbRaKp56L9klE+sl0egFwENzL1scaYTKFtwumDEqh+aAIsAUU5p0a7gftDDSuX3B0s
         TpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778372; x=1793383172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
        b=gNFoa0KBu/UIdWyqorQNm/AwbTdrnApm7RYbtXfZIcNnN7Fndwt+yPlLAIeEBFPJLx
         6ioo53rXSKC0L0NrdN5bSl8s6baEK+9/mtG1Tp7kKG0SvLIG4KGk5NCjUexEyq5rx4Uw
         2zZWeDwN+g83q53KSORwSyUTpr8c26vo+kqkFK81Oswx5TsZHz5AgIaSSpw95/ENw0iK
         5ib2+SMTQN87IWiwZ2gOdhjJZYSsA55tFUIxqZp8B2ojx5wvtBN6D4JoN4cikE5l0xZE
         cUaPOEoTxQ/PqumU3uv3Lu1l/gOHafEr4rJd+1KJeH4VTpML84zsn3byUY4KxvFGUrWK
         QkUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcO/7h1A7p9S5v5F854fQK3VnoqEAGL+VkXX9pt1oX7LUL5ddPJo7vaUHb1cDYElMq22bb3Tfjrue2ILnRkeW3vQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRHgkX/iMoujYKeXpBMYr7kK2abB3nj3wK4mWjZOf6lUORRKbs
	j5mxlJ00C8/c+QhYXyY/WZl5tvhX6Dgrx8+7mjh8RGPxUw4GZQ/EhUM1
X-Gm-Gg: AYBFou0fRm7Rp8fRTTNmVJJhSPjvmuKERM6p2VVZKxkWNRIVMvKQ3v3eBJW7BCQ89OY
	RIhoVfMruruiZ5+9Bv4b3aDZ4vvc6mUNypPJjETuBBGlw5kCftL+YsAQlZiVk0nxnU6WJA+NL9v
	jn4oBmk5C/Kpn9mF9Jc2KnnGMfRwmCe+jd5FTZVKHX5Prc40wTSGLj6YxP4L6+eNHO0Hn79dx4Z
	8tbebqq6hipoOqFeKbEJQdZvSzYFXnix3iAnmd4nEbtk44XC4jD3B8b9IXQeyOT538I65P8tti9
	evjfLxbJe/P6Br4o9VU96vLFerE1vb4mYYWt+OC2yP4Tre08ke1DT4fJAmbrp5uCPvBgSBSFgwp
	1PZWm376fbc4oVojzplfmioHQHFVNhdnSTrliu/YmHhc5AlNQClGm1fjAkxtHYeLs4PcYrvofLt
	nU2qN3WlDgWr5ngIJroUs7D7taxBk9VJW6yWgZvz1rovcVkUa3Qa0Lq56k3nNiSJugd54gf5XL1
	6Dwx4brqwnboYHeSkmXYSMvSrcXG0ZvM7bKG76lNu1uuiyWp2PA8qJht/AdZj8m7zKvimJdvhEa
	3aj9hmI3a5jQg9s7xaBhD0FQ6RaLy+TtJ8wysnW6s0EUGW/u8Teyr6cuZwXpu062BniuVWk8TMP
	yovPzCY/W5jlC5kF29GaUErUDYYc5s5yi1zGD2se2OKeG
X-Received: by 2002:a05:600c:4715:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a211eff69dmr54002725e9.29.1792778371771;
        Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Fri, 23 Oct 2026 18:59:18 +0100
Message-ID: <20261023175919.160103-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports both
12-bit and 8-bit conversion resolutions.

Use the current IIO scan type to determine the ADC resolution when
reporting the scale instead of assuming a fixed 12-bit resolution.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
---
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index dbe82939acc2..debd5873ed2a 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -60,6 +60,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_mV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -532,10 +534,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
 		return rzt2h_adc_read_single(adc, chan->channel, val);
 	}
-	case IIO_CHAN_INFO_SCALE:
-		*val = 1800;
-		*val2 = 12;
+	case IIO_CHAN_INFO_SCALE: {
+		const struct iio_scan_type *scan_type;
+
+		scan_type = iio_get_current_scan_type(indio_dev, chan);
+		if (IS_ERR(scan_type))
+			return PTR_ERR(scan_type);
+
+		*val = RZT2H_ADC_VREF_mV;
+		*val2 = scan_type->realbits;
+
 		return IIO_VAL_FRACTIONAL_LOG2;
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
-- 
2.55.0

