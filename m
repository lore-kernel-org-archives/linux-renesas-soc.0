Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A651A728
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571300; cv=none; b=BJFSyB4s8OXtNZfojb1VhI9ZPf4ZPBhW6mB41HbJSq3/WK5xAafzjjuWl/vc18oWo6prq6VtHLFzPKDDEf4mBezBz2//v22uA01uagE1QjOsdZ38fVtqYbDmnjLgpknJulsWPEYnC1xAB5JcoMLvtgJUOhLVqlkHuyYmXK1EdWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571300; c=relaxed/simple;
	bh=cWdSr/HCAYpw9N2hmIHYWZwHbcHbL62T+g3jRZ9hgjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyqUNS+wh4NRtOQeVWJhSiFyA7wROVGpL+ccYnjZ4okqIdv2sHfb8oQWnJAuqxWavWZ1oz6jsnhFlM61OYh0VIq0CrS3QZxcoMz2RqdXYRG69jbngdmUBDJZCwn9eUFJv+aWpxk8FTRltwxrUNoaLiLjdq0+JMVG5j6rRPmuB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icIvWqas; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icIvWqas"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so1143325e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 11:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571293; x=1792176093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4hysl45OVBhRRFcK6ukjKkbAyi3VQ7mXgaShYNjelk=;
        b=icIvWqaswIL0xvdbmVeMnaLo3PZoqiV76okaZoItyVcMGyDo80rMvGYyZNAxj53rVi
         /mFuG4CsGkRCO6nnvE0ea1u1tFdHMYOvpOuQeALLpbVMYcfuusRLQNAM/c46ItCtKe9X
         esxCsx2DcWJJaaySQkBSGV618kJkcz+OCXfoO4M7eExn529liW8TlJTnNxg1aXE38xUs
         1qONi1/ZqkPorZYHkV8z2WjDFXIfZCLGMXpv5NSjkJmk2NdLpAjX6UiPTnVmZbDjmx+t
         5SuMbEIbAGIyhGU/b1boCSwFyLLcTXjygNL0Ktr3HjatwKtVmTMICurSQYtLUdX042Ts
         fpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571293; x=1792176093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4hysl45OVBhRRFcK6ukjKkbAyi3VQ7mXgaShYNjelk=;
        b=ZGir5DkPDGFOsRZVFOYlrWcQXtAJhmTrJuLF0q5Dfdmr8o599+F7J9/y5+3azq/gpu
         I3CLyD5LlAdlcAE54SvgBP2XSv43+aCqwUzYbYdutJTIcK/IwXO7jEsdavyHGcTpiqSf
         IaejHkdNR/6rJ+9qOtrc2FgAb016uD3/is0FkUTx3yyDqwBdZpDvt5YN447RnQY8Wjtv
         rDghpNZkhRn8wH6/+FQSYZGxBmbDsCkIvnHaQpFBml+uBJ8TW9KhIT/EV5Jg6ANCQemg
         BF988M/2By+pc9LcT3pV0lZ6F1QY0pOA1Zxoc/WhrHp8rcNNi85AGRnyYQLisz8hcDCi
         u5wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmbyVJyYRx4AnvwEMH2m6hNy6QZKXENFvnt+OSbYz7YIVGCsJgoQQhLW8BLlk1A/s+jSjkN2mCMsCOCr6JpM6w2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n4yBWJAxXEEdy20HLX4+oN9JUdjR7ThERCPl7HgmMPjr5KTXfl
	8FwUskq6yn8I1mvUob6dwUclJ1stdGBRI1G/JvkafYhtQfomjygdWf6Y
X-Gm-Gg: AYBFou2r/hQqFlAdbt+jxo0v4rv6ZMVETRYrZgGibn061gj2lmA3TIurAovipMtq7lq
	VtYAE90oSGNg0eqSEYtq9OnQ1VADGvxKhMg2o2hQJLZ8B5W1Ci8PnmN2fQ1JdD9x/EtiZR0KMF0
	63VigrCCJns8OkDIEV3+FYJ50NyhBXsOLEWvUTmWtku+KdoHCbG9HymQrDhQ3TPlmZ561y7PS95
	R75iIf/2USYyhUDMRP5MG8HssQLDOlP9raMEkqKYKN9HqeN/76wFLaZ94N9YptdRVDZNNcPZTDT
	cJw+8xiwDjKtDe5L01jdKuqQH1bAXSSZVO0dX8ejOVYg4O305XcXlfhuHftJcHTtb+Qv5/tuCpW
	RWNfRHmVjGxqksX2u3/9Ip+FMkTDe61OdM/lCweXmIaY6GSyPEHsSDAKlpzKcQ4exNpDgSzOgUa
	aDW74/k0t3EchXMPqofeZblYok4CZ27gkH0UFCkFge3RAWsTfLQkUVeZw7KAvUmGUJshHYHdJtR
	qJHrAhCzjeJSAvSxw571uvay6ywFS0dWYYFGF48VMxupUGbZ97qRQlnuVDAnsIXQTjrp6IHpO/8
	H48nMxGALL4adkqmzA==
X-Received: by 2002:a05:600c:5249:b0:4a0:1b14:e846 with SMTP id 5b1f17b1804b1-4a18e446905mr53912465e9.4.1791571293221;
        Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/8] iio: adc: rzt2h: Prepare for SoCs without sample state registers
Date: Fri,  9 Oct 2026 19:41:19 +0100
Message-ID: <20261009184122.1378797-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for SoCs that use the same ADC IP without the
per-channel sample state registers present on RZ/T2H.

Add a feature flag for the sample state registers and make the sampling
frequency handling conditional on their presence. Allow each SoC to
provide its own sampling frequency calculation and configure the existing
RZ/T2H support to use the sample state registers and corresponding
calculation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 62120d218515..9f027d524997 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -61,9 +61,13 @@
 #define RZT2H_ADC_STOP_CYCLES		2
 
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
+#define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
+
+struct rzt2h_adc;
 
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
+	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
 	unsigned int num_channels;
 	u8 features;
 };
@@ -150,6 +154,9 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
 {
+	if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+		return;
+
 	writeb(sst, adc->base + RZT2H_ADSSTRn(ch));
 }
 
@@ -530,7 +537,7 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 		*val2 = 12;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		*val = rzt2h_adc_sst_to_freq(adc, adc->sst[chan->channel]);
+		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
 	default:
 		return -EINVAL;
@@ -545,6 +552,8 @@ static int rzt2h_adc_write_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ: {
+		if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+			return -EINVAL;
 		if (val <= 0)
 			return -EINVAL;
 
@@ -734,9 +743,11 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	if (!adc->adclk_rate)
 		return dev_err_probe(dev, -EINVAL, "invalid adclk rate\n");
 
-	adc->samp_freq_avail[0] = rzt2h_adc_sst_to_freq(adc, RZT2H_ADC_SST_MAX);
-	adc->samp_freq_avail[1] = 1;
-	adc->samp_freq_avail[2] = rzt2h_adc_sst_to_freq(adc, RZT2H_ADC_SST_MIN);
+	if (chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE) {
+		adc->samp_freq_avail[0] = chip_info->sst_to_freq(adc, RZT2H_ADC_SST_MAX);
+		adc->samp_freq_avail[1] = 1;
+		adc->samp_freq_avail[2] = chip_info->sst_to_freq(adc, RZT2H_ADC_SST_MIN);
+	}
 
 	pm_runtime_set_autosuspend_delay(dev, 300);
 	pm_runtime_use_autosuspend(dev);
@@ -767,8 +778,9 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
+	.sst_to_freq = rzt2h_adc_sst_to_freq,
 	.num_channels = 16,
-	.features = RZT2H_ADC_FEATURE_CALIBRATION,
+	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
 
 static const struct of_device_id rzt2h_adc_match[] = {
-- 
2.55.0

