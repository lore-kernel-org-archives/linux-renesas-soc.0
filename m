Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778369;
	b=N8ghLgWkuRJgxZDA7pgCjLB+8LlT97Uj/nCXTNq3I2TjKeXwtFkWIyrrbs7tM200A6HQ
	 HrE5ilWupcExUNpkyUJq1VlzLbBWWMNx0TfjJs3iZ975rDZ9cte0gnVuykkh4T7QWaZ9p
	 IwIz2gHN4KyRtdWjVd3hx7zsUOTj/2I0M0wGqZgV0KAnPu7Xy+ftUW2h/JwkQ+a2Bb+yP
	 y54xn90PTlXO3aWi6gf68CiaW7r28OiIb3KXF1uoLg+ABXPZfsDomWNuk7qGhAfnZ3Ral
	 Vm2cXQ+qae61JHVEKpBAhEaSyiJTwl8imcBtCqv5OdwKVt1Cu7FBWhfSL1QKxN9vHLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
	b=5Vvsrhcw5Rb3TXhiM1rMRoJrayKP4niwNzJr3+i9HSugIOJ6nbcRqJZrwx0NeUpLz0U6
	 SraB+oWuRzMP6LTScwR76APhFjklvLakV1wIE7Doo2YcRvyJfFVU62ArnSW2K3TasPiN8
	 SluPklT2xovPqhigSTqvnAUTSHRwhqzOyi6VtXmMk/w6mCri/8Ez+X+9LB/OVLReC76oG
	 P2bDIrktROtlIGiaZKv2PbFYv+JtNCRcNQCrMarDfDeHNNg4H/GLfV7PjtLo3NZDshQbV
	 RoJgUIwt/lGZU9EP2h+W5bqL1ODXXhFtGNZQ7vqJStI8q9fKnY8PseZrmIH6DnmgO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdotHO0L;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72432606A331
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 17:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72432606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdotHO0L
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218ffa23dso4184175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778368; x=1793383168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
        b=TdotHO0LUw1mirdK8D1NBjojrI2VmIEU5egfzcux8YEvAuWfygCij3RiEUjE5TnLr+
         WpXsbdXZSHieqpN7o626WlDMX4LW+UwO1k1r7FK28CQpRKVsGCTkmdhAnsfVn1XawLdH
         VrL7GsQe+wE4DJmKu+yInnG+mXRyisWGjIJx3SDTe6Srbq58prtysyLwOoZjJfXUuBP+
         OE9A5kxovZsuX4jgkwq3urr0da7Xwfneug/sNNpWfc6kfkPcRWjeIVYFVmOiw2XlU3yB
         5uKXlSyKeJIS9LiGRwWSITgeo5jsJQ4ZP+ohwWxLHGN72YiKdOPgI+6WgJjycdoRAgh5
         K6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778368; x=1793383168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
        b=h52v0jLDJlW2KphI8uQftg8lcCUQmPMwaRc7uUa5Nhx24zTREk8MtkP/hPKRENeyaz
         vt8N7GarFBc/L0fF9xaPxBD0c+5LdmqL+V/nXMFgyT6tSXRkMhvpDtVc6hALq08eIXxf
         UXKaalw1r7eGmE8k5N/Q00fq5XPWbp5QFc3wM7dek1PEF5q2Y3Z33A7BMdW078t1FdHq
         RmCEddElZMJkiAVKnOngICvpCX5p5+kqHNGX1m/gb+gLdLvQzJ1JDHR7fBJW/vconALE
         c0tgXzscwimpWrZig6hK7RdJ+D7GCojzhTCND8jyn3beakfV1j1V1QcEXqf8tHJlILPa
         iCRw==
X-Forwarded-Encrypted: i=1; AKwUvBwWP6yB2rDXlgSdgFf4z2VYfB5wzFE1aMSAlzrd3fQGZGZv11jx+S8Lqk4Mw7P44YtA2XzYNCtSP99Qa5a+ALlc2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJNh+AFIM+QL96rS9dKIURqSaQEZs4bRPPVGVWqbvqu4m9EN9lx
	rprNmEoooMfwUXmn40foZPanx8BrqrcxUQBEABUwmqn1opJmQFMO3iLj
X-Gm-Gg: AYBFou22le7OEhN7pqtJkNvjvQyLRHrV/sh3RiLuIzF3Qu0xahBEYxtEiAafsQCK//8
	9ySLZehOLfa/wM7LBvJYtVwKj2gJlliT1SO99s3nTVmQ2lsDIZxRbhIuEczPs3jYWs4crC7p1Lm
	HPwsm9zCSAOt5qW6T598qn2LZi/DxUIe00n6EObMB7PG/4zt9JGBRzFvkkRumhQMb4CZ/ronxus
	Up4L1VkMpTbDXdmWXxs+keTyfeiCeoE/dl+f2fWd5gdE6MeythcQvasZiwUO+tnmMLGB1Dvwm4Y
	V3jNmP8vWvMPEzVA5FYjINK48zsVNCa4QJ/gW/FomsCgs3GZMXHwJ7qjT7hmQMxreeLzopb9WkE
	5tu2vj1Hfjo9shbo4w786bx23ROsETRtpdJqpHSKmXsQTE/KtChD1xy+/5M1KhmGChNNGe1s/ST
	e7S17wVrfj/es+4tQ2CUQ4rYD1Y9MUPBr/6EPOskLXrtVUMw6xtqB3akaslPFGLz0/m84c/ifne
	LKhqSS77ODKkClceCkUH/o5ziI1Eer8P/7O44gUP0UmDx3/QGG1B4PRLhs6abf+ORUsZCtMx0n7
	uNC/wEV3THh8gyzr3L9+uoPIBbd2RRucNUIvoklVbeAl95xSnhxMm9N77EvRHuYDrEysbUxTml+
	zCviwza/fbYqYzJ1+9/J66vxLdjSWGIItuVOPdkZ0Th4m
X-Received: by 2002:a05:600c:4e8a:b0:4a1:e7ce:10a4 with SMTP id 5b1f17b1804b1-4a211eebdc3mr52878955e9.29.1792778367523;
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
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
Subject: [PATCH v3 2/8] iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
Date: Fri, 23 Oct 2026 18:59:13 +0100
Message-ID: <20261023175919.160103-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

When ADCSR.ADST is cleared to forcibly stop a conversion, the analog part
of the A/D converter can take up to 2 ADCLK cycles to stop operating.

Wait for the write to ADCSR to complete and allow the analog part to stop
before reconfiguring or restarting the converter.

Fixes: fc3b97dd71ab ("iio: adc: add RZ/T2H / RZ/N2H ADC driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Avoided splitting up the ndelay calculation into multiple lines

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
---
 drivers/iio/adc/rzt2h_adc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a1..131904d97b8c 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -15,10 +15,12 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kthread.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
 #define RZT2H_ADCSR_ADIE_MASK		BIT(12)
@@ -58,6 +60,7 @@
 #define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
 					 RZT2H_ADC_MAX_CHANNELS * \
 					 RZT2H_ADC_CHANNEL_BYTES)
+#define RZT2H_ADC_STOP_CYCLES		2
 
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
@@ -124,6 +127,15 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 	reg &= ~(RZT2H_ADCSR_ADIE_MASK | RZT2H_ADCSR_ADST_MASK);
 
 	writew(reg, adc->base + RZT2H_ADCSR_REG);
+
+	/*
+	 * When a conversion is forcibly stopped, the analog part of the A/D
+	 * converter takes up to 2 ADCLK cycles to stop operating. Read back
+	 * ADCSR to make sure the write has reached the hardware before
+	 * starting the delay.
+	 */
+	readw(adc->base + RZT2H_ADCSR_REG);
+	ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC, adc->adclk_rate));
 }
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
-- 
2.55.0

