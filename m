Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD8526A9F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685784; cv=none; b=TnTBk/Yram5JSM69uqXeKF4iMj3YyMJkwXwstYpJQqXyCqOO03mO/p+luNsD6oCNa9h9RS3poQyo7q1gYI7pZ5H4utG9XE3QtZwmV6y7B1mUgrqN8Lbf1c4EaKCauYtT27XHuv+GWBbYQ0J8u1Hf2sTwO7hj4A37E38Hrm0APXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685784; c=relaxed/simple;
	bh=wddaOCHt1User2EKSIHrJqu11Cwft39/jyIoFbIFb/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=op+CaoMx/NarhAuwiZELx1R3ANHBShjUnHPfn6I3Mo5pyZ08kOE6k1q+FfbtceqqRd3vXEdTrBRBOlQr7uiM06XR/xFHP0sJsaNKVHhXuvixB6/AQ39gVNXiHPwddjdvsdjx5IO6qHQxApLInAw6yWcMqSusMESOJh1+RT2Tf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK+JxIdr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK+JxIdr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso30853655e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685778; x=1791290578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07bePpgedx8t7xEiy03MlooYZIPXYLGbtGJ15Yyblag=;
        b=OK+JxIdrcnn+Pa7bC5sGggzmkZ/PcqDKxaYzgJ9QeQkpYbFK4e8aCF5y8X66HD/tbk
         3cLxoKtxwZiWr3jCJj5DP8ND9daBSV9cveVHKxhR8YFh+ijx5hXoJ7eYTpNzsML46v+p
         ZnpOi1oyG2+G4//5P5XElArzGcGkG0l0/C1iVBlTSWt0oMoKHts1QUHnbw+gFwfZLNel
         0aFhUgN7xlkrOZphJzLhqykHMWGaEQLuhcj3aU0Fb9rCCqf5tyPOqOvZoQki7VxPD3Zp
         sIbYqY8kl6f0ny8H4wUBughKP7RH8tz5U81S5huFZw6lFPeP9zoccZrju7szGbHXOP/q
         GYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685778; x=1791290578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07bePpgedx8t7xEiy03MlooYZIPXYLGbtGJ15Yyblag=;
        b=Fw+uvF4PLl307uJoeIDChzv4Wxo2iR6nwYFZ4wR4V9kx9uybq36SbuFP8MRGbAwOrR
         PTVg9GOWZMAiXLZD+kYecOvYX9FjvhKUjFrQ32P7XsZwZFLPExS2Kq7RPX3ujlNUyUWU
         ds3nT5/Tz2Bdf2/2NlAeaArWQv+8akdL8NRlvwWvSWHIbohj5kuEyt47ToOPFEyRCfQc
         7GdpYFLedluFiAgIut+5fcJbItbJ/dbQ07Ip76j3balNfG99xV44zbpqy9HBKO8wTmK5
         vrAs+KgOidHTTUtfTBy5u9vzaVjVSpuS6UiCtSvJQCiwblT+8d73PHSSUR1JY3Zwyi87
         GmQw==
X-Gm-Message-State: AFuF++nt7llPftmFT/msPxosNuHRZF+ix0O5JpstfZRnNm21j5zh8+Kc
	aq/zpuDlxlbh1kpwMf+PWrNLNZ3y+i+mUy6kfd/BrA2fwLIRMUffggEs
X-Gm-Gg: AYBFou0abD8bNWLeRppXU7hQzYUhhSqVcns8FM0v0Kbm1fnvORIn3T9GsOQTWSErQl5
	hCXvOGj6zCGmjFAbjHhoakQQg53jER7x10Ev5DPwK7OcnFmc0M7Mrr68rQQ9AhZA47gGonlEGYQ
	UFqnmfviDLgo9PW8Ys00+VZeXAs5OI+wMfG2K9i+7a7htaRJ3Kl2dKdSvtQ0+Oz/s4YKVP9uQKp
	43jhZFKLIC47bU8rdOzQtPZJRb0J+NZwNbcV4Z+PhwdVtewDGa9sZkXF5mT+wYLjiCwsDe8sTyq
	vSYSPbFTYRbNmTA3i/7VB2674v21ZJivuMeJaEwgc9RKLCDN2ya00RehNOf09Iv20G4Prus3dp5
	t0Dj+w0pcoC7mscBTOf4Tll1IMOo4JntqzJgynjKu9XJVe5kRkhHq3jgzyS1thVEqlmaBOYC6qP
	f/qI/qjMAJyTQRg4CtFNk6DOixQJjRqUfgj6x7MDrtGSMTJGQBt9qRyOPriwdsIjLAEQXUgpKb3
	PMh8FoVylJUdUB4JbKKwxu8JwdnaW+GH5aS6iMerdaBl1NYFK1OV3/DawiZ91Ruj1sPXVAfddA9
	1qYETt8lGL6QIK1vkg==
X-Received: by 2002:a05:600c:46cb:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49fe7b52f06mr287934665e9.2.1790685777933;
        Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Tue, 29 Sep 2026 13:42:47 +0100
Message-ID: <20260929124248.237032-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports both
12-bit and 8-bit conversion resolutions.

Use the current IIO scan type to determine the ADC resolution when
reporting the scale instead of assuming a fixed 12-bit resolution.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 26028856b175..953736b5475a 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -59,6 +59,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_MV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -529,10 +531,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
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
+		*val = RZT2H_ADC_VREF_MV;
+		*val2 = scan_type->realbits;
+
 		return IIO_VAL_FRACTIONAL_LOG2;
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
-- 
2.55.0

