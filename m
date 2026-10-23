Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778370;
	b=ogym1FHMKLcEiGyb3Xe5znMQjLtc7ZwlasQOREP6k5IOSodgdKjZh/rTMsFKMWaNpQC1
	 2xOMVlKPnr6uLa/aAMW0HtpgfdLwrk1fyX6H/nUis/fgw5Zxd8QGWKZautOlfqbn6/X7H
	 KEmX8J0PslzvZ757IvgpJLK39t+cs+Lr6W1LToWPCnYNNn3QZo8zHuWMxtFmtyyYFlznL
	 VKOH77eCK3GlZB6/xNeDZVSWcqRjA3rcJ1rs2mLpHOZwScQULt7a9frWK/Qsuil17oE8z
	 e6m+O+r3wMywpSnmeUWokx03+NuE4UI7AxrouDfTdy//u314AIbI+VM8xyGqn1bpukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BBJheptbrK1Xj6AgFoLSOO83tzUQObgmpiZOvZNyRbc=;
	b=o5FJ/jbNZIikYkLHQkXqgyp4uJ858qcmv61VR8TO5LXPW0GEGu2X3Ba2stueHIOgdeW0
	 S13lI87ez/b7QNe1TT3MDgLdmo4wCaTnqs5CaOwCQW0DPFBQA7mf2D8G5EPfjzYMVFiD0
	 3vHEstlAe8ntVA9y9cAZlmVOX3J9W39uYJbpruGI0sgBvZ77mqCDQDPue6eP9q1fP/AEY
	 Tkc457vWhD4ZS+rzhD5QaEFRT1pESN84TXQ+JqI9yP7kGYgIal0Cn25tna85Fl3Twm7EM
	 raInubrtqE0ZklVrYhJGUrpPp0FfDJU9zEXsncbsqEGCn3pWobziRpHSSTtoaBKJ4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S1wCsyAz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA1606A333
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 17:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CA1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S1wCsyAz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9491785e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778368; x=1793383168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBJheptbrK1Xj6AgFoLSOO83tzUQObgmpiZOvZNyRbc=;
        b=S1wCsyAzFbrPOz3szW9M3HoEJRLbY4JkJT960VF0lYEI9tX6BdSrl9uPcUclDOD0iY
         shgMpLvvAiVZT7NpFh1ihkfuNTOyBSZA6rzQPMXxVjpd/Pq0yTz4msy9jjmZUXo1WlI1
         yHSAlCtK0oAk98KFGVlmvEa65UAiip18GfRP0PSYYi810Bez5qZg3TsJaAq+eHMVUGiC
         bEBzQm1DuRrVEncdKHglsTgNg1Yk4UXUZlt10s0y2L++P0XhNjuAqmO3Jca4JAQwzabD
         paE/0lA1cl7UNVAmTqqCF+hN2Lq4KYkFVO/siNRPBQqTJMgUvY1Hj9THzYXBMbubZpN4
         sHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778368; x=1793383168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBJheptbrK1Xj6AgFoLSOO83tzUQObgmpiZOvZNyRbc=;
        b=erN+3NTK8Mrb0yCXaO03+dP/iRm4ILLnoG6qRwXbdHow1xzBWV6pXg78w6qoWAdbv/
         fE7XqZIF/ehvcWm3Bf13llAMne8BjJvoPXr8hFBzpHdiQPX/O5CfGJms2Kn/OvOcBqb2
         l0T0nsJVfdOgoi/q3xS94t1QMkGx9uDgo5wbosdNl8UJWoVEBOQeftmrFSJ2Yl2gAvsE
         WALIKaczjTY/AnFO1dlTHw2o9pYiJvvH4tf5KvJAIvd5kyF8GItiaKm9+6jv5eM0jdBO
         GVsgQRPguqEOV2aNcEPD1IDv7ji9wsZ+ByhJZf+V5G9FZoWQZw+imzbnhgTpiShSrR3/
         XpcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5zS5RBFlp4VqA8c3xiG7BnEYzLgJZn8OTGBkNz0i0WUQ1V0Z/d4zuaD6LeLYIb/dJhtqLMZ3sxG+uZvwzvj6Qqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+F6smKxv5cJxq2Eaqz2NruTSW24hSPk8XxOr9VSwaEDJIbzKv
	F0ZQSCubCLjLR/kdXnPmOWZo8hnmppoLvkT8zJe78/R2cCcEimf8//xb
X-Gm-Gg: AYBFou3Vvd0EFt05ie3XC0t8Pte8kSTiGqjlTWOHrQoL/S12pAgwWvAHX3z83zh88EN
	LzQ4089MraVzw+qPdL2Iy89t1EV2oURCEDgqQISlrdOUrY/ABBwQCY4LcRzbRIywriBraBsIj+z
	aUhCi/Rz0wqeBiIP0V7AGLpALOKFCtABxfIhIMUqxQWnqvZtZrU+oLMaUNrQNkC2YvtsRd6YH+F
	8pSryIXMZJx7QEnp0OtKkmWUqIlUliDKDfEkCsz8KXT2hfOdeaN0ErIeDf5eCimUlclcsNhtgiK
	ysiCNG7jNw4LzUFS0NGROEaa/g2LOeNpm6idfsEdTyMaEjE+jN7P54eHJwbNycrii+Of68McF3h
	DgcIKkX5vgRSBh7W/F4jS7epYbhZp5FeWxPBYEN9hdvDN08Mp7DTbpsSp7UEjpEmtHUQjPuzFPb
	CtxJe15dy1aKFCfYSLaVNIhk7GHujPXeo2MhAJqJMqZ97RudrbgtoN4hu7KxAZkh5n8N/8sqEcJ
	I/zYmEwwQAyxoEC1CHozPM1x4SsPRGKpWo3kz430dNF+f6/0W5geHhC5hdcOAz/u7HYbW0vm9Om
	tuGlx7Egu8M24s3V2Y1IP1UQAM3w5jhF3HhQ7M+U/QIkVL4yw2QCyrULJ1W/pbQHUbUGNdyhP6O
	tmWN5COcKDgfuOJ4sbbgphoNlXWtEQ6onO+HxVhryMBxX
X-Received: by 2002:a05:600c:1909:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a21398df21mr47236325e9.16.1792778368304;
        Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.27
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
Subject: [PATCH v3 3/8] iio: adc: rzt2h: Add chip-specific configuration
Date: Fri, 23 Oct 2026 18:59:14 +0100
Message-ID: <20261023175919.160103-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for supporting SoCs with ADC IP that is similar to the
RZ/T2H ADC but may have different channel configurations.

Introduce chip-specific configuration for the channel template and number
of channels, and use it when setting up the IIO channels and DMA layout.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Returned -ENODATA in case device_get_match_data() returns NULL
---
 drivers/iio/adc/rzt2h_adc.c | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 131904d97b8c..2ada8ecb2603 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -57,15 +57,21 @@
 #define RZT2H_ADC_DMA_PERIODS		64
 #define RZT2H_ADC_DMA_BUFFER_SAMPLES	(RZT2H_ADC_DMA_PERIODS * \
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
-#define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
-					 RZT2H_ADC_MAX_CHANNELS * \
-					 RZT2H_ADC_CHANNEL_BYTES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
+
+struct rzt2h_adc_chip_info {
+	const struct iio_chan_spec *chan_template;
+	unsigned int num_channels;
+	u8 features;
+};
+
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
 	u16 *buf;
 	dma_addr_t addr;
+	size_t buf_size;
 
 	unsigned int period_index;
 	unsigned int period_bytes;
@@ -84,6 +90,7 @@ struct rzt2h_adc_dma {
 struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
+	const struct rzt2h_adc_chip_info *chip_info;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -328,7 +335,8 @@ static void rzt2h_adc_dma_callback(void *data)
 static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 {
 	struct rzt2h_adc *adc = iio_priv(indio_dev);
-	unsigned int hi = 0, lo = RZT2H_ADC_MAX_CHANNELS - 1;
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	unsigned int hi = 0, lo = chip_info->num_channels - 1;
 	const struct iio_chan_spec *chan;
 	unsigned int sample_chans;
 	unsigned int first_chan;
@@ -349,7 +357,7 @@ static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 	 * width, so pick the smallest power-of-two-aligned block of channels
 	 * that covers all enabled channels.
 	 */
-	for (sample_chans = 1; sample_chans < RZT2H_ADC_MAX_CHANNELS; sample_chans <<= 1) {
+	for (sample_chans = 1; sample_chans < chip_info->num_channels; sample_chans <<= 1) {
 		first_chan = round_down(lo, sample_chans);
 
 		if (first_chan + sample_chans > hi)
@@ -609,8 +617,8 @@ static int rzt2h_adc_parse_properties(struct rzt2h_adc *adc)
 	int ret;
 
 	ret = devm_iio_adc_device_alloc_chaninfo_se(adc->dev,
-						    &rzt2h_adc_chan_template,
-						    RZT2H_ADC_MAX_CHANNELS - 1,
+						    adc->chip_info->chan_template,
+						    adc->chip_info->num_channels - 1,
 						    &chan_array);
 	if (ret < 0)
 		return dev_err_probe(adc->dev, ret, "Failed to read channel info");
@@ -631,7 +639,7 @@ static void rzt2h_adc_free_dma_buf(void *p)
 {
 	struct rzt2h_adc *adc = p;
 
-	dma_free_noncoherent(adc->dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_free_noncoherent(adc->dev, adc->dma.buf_size,
 			     adc->dma.buf, adc->dma.addr, DMA_FROM_DEVICE);
 }
 
@@ -651,13 +659,16 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 		return 0;
 	}
 
-	adc->dma.buf = dma_alloc_noncoherent(dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	adc->dma.buf_size = adc->chip_info->num_channels *
+			    RZT2H_ADC_DMA_BUFFER_SAMPLES *
+			    RZT2H_ADC_CHANNEL_BYTES;
+	adc->dma.buf = dma_alloc_noncoherent(dev, adc->dma.buf_size,
 					     &adc->dma.addr, DMA_FROM_DEVICE,
 					     GFP_KERNEL);
 	if (!adc->dma.buf)
 		return -ENOMEM;
 
-	dma_sync_single_for_device(dev, adc->dma.addr, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_sync_single_for_device(dev, adc->dma.addr, adc->dma.buf_size,
 				   DMA_FROM_DEVICE);
 
 	ret = devm_add_action_or_reset(dev, rzt2h_adc_free_dma_buf, adc);
@@ -670,6 +681,7 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 
 static int rzt2h_adc_probe(struct platform_device *pdev)
 {
+	const struct rzt2h_adc_chip_info *chip_info;
 	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	struct rzt2h_adc *adc;
@@ -677,11 +689,16 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	struct clk *adclk;
 	int ret;
 
+	chip_info = device_get_match_data(dev);
+	if (!chip_info)
+		return -ENODATA;
+
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	adc = iio_priv(indio_dev);
+	adc->chip_info = chip_info;
 	adc->dev = dev;
 	init_completion(&adc->completion);
 	init_waitqueue_head(&adc->dma.wq);
@@ -741,8 +758,14 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	return devm_iio_device_register(dev, indio_dev);
 }
 
+static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
+	.chan_template = &rzt2h_adc_chan_template,
+	.num_channels = 16,
+	.features = RZT2H_ADC_FEATURE_CALIBRATION,
+};
+
 static const struct of_device_id rzt2h_adc_match[] = {
-	{ .compatible = "renesas,r9a09g077-adc" },
+	{ .compatible = "renesas,r9a09g077-adc", .data = &rzt2h_adc_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
@@ -750,6 +773,10 @@ MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+
+	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
+		return 0;
 
 	/*
 	 * Datasheet Page 2810, Section 41.5.6:
-- 
2.55.0

