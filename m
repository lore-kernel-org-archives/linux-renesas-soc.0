Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06764509F00
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571303; cv=none; b=ocnC2nBzRRsHp0iqm3sF6VF7VVt0nMkdioO49iQidwm8pc9HMa76blX3WgCwwAxaHZQU9GX4/2FP0ptcLfG/16vQENH+nHAY8obP0nons5aiQ4z2q1ur+SjFnasY6YouZZlGtQ1R5LuaipRESzsLBTEMpt7NmsCD/aQz/vby/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571303; c=relaxed/simple;
	bh=ij24Tt+mBkvhMF/HqF/RT3qE9hGUKmQDHuU6BBHM+tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TaV+pWtsn2BtCfBBFJ+Y1Qna3V5dG17PwPCcBT+fiUtVtNgZCwB4YuzWv2G/YyR4KtYvF2kJYW+49MRRGWiIuwPcdFvkQI5Tl3Rj1UI5AAoLaRu/3JKbx6rGQ7Q9LzYJUu0lgk8IbtJ3eTNpEntIJGtteZEo5dPrDma7WReKBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFFgtYeq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFFgtYeq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1584775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571292; x=1792176092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFRs86ExhHlcFc1OobVar7diWKmQqv1mA0nCYrOsS0k=;
        b=fFFgtYeqL6Gj2qkYp6+d6Ez2rThjnPC8UiZBhdXCHHnambM45sfxiCQw1KV13wLVpZ
         aN1sVHO5C+c6OnLx5bEGoAcvoYSAKfN8bkSASyfKfmw5N0pA0jEaP312JgDkIv5O7ewW
         23nB8xQgDBfAkM3bD/i8KuRED7+Q7H+PpnKL2MQdHQKJ1bWVRtevKAa9g+p8EzHgO+IO
         ct1PizgPrVNdoOBDDRTfe4hB8zyvC1zrzWWi7MRuzAlmhmB6w/nGXGCuxazloNOWofov
         COqdRZ7um2fcf+Uodw/KJJoyB8OZf9PQwVEW1qX4Zf9jaIlhbyUoF6HRYFjFCCulF8xi
         TSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571292; x=1792176092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iFRs86ExhHlcFc1OobVar7diWKmQqv1mA0nCYrOsS0k=;
        b=Zokd8FppNx3py84qUwZ3ptaSswJW+ERV2/+dw618K/MFnsxoA7XWi9tzr/WeG6gNrl
         oErTNErWf07s5w9HiTX3alkolQz1pYNz+5oCHX1LccBwI9DZSdg/3tefRrbGfUtlW7D2
         LMfdJUiRByJMthK5U0cHkuz/AuaqQpM/qcabtvPK9NoJd2FkQ0BzzNew4F31FJ4w0Ea+
         FQINX/fv1xmRpqAASYjgSfINKvtZ+CFLXncGHxPCIKR4TA9Q7ufwC84v4ALHRoxA0E6m
         tDtreovsyJryjNfS7C4fPGa6nj3OVT7/cxghRbJcDFnItQJO+2e/6OsRQyxnrr7JqtiV
         15aA==
X-Forwarded-Encrypted: i=1; AKwUvByzPVTNR93ql9syjEPwy/JiNxlTcpLmGmt8I5CZrrzEZfYJx+uGLFG4JgE6NF9HNo9yOOjmoj+C1x+Ph6AkFf9yEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mm51qT3BdgFBwHeQoc/7pupz765gSVxRWf81M6hGvrPBUkjeS2
	t1MyJjaewIn0oz5iL2yn2bIj1g/5TvDy0j5k2djITE/9FVS7ziwvcxv3
X-Gm-Gg: AYBFou2UFUJCBkzE/O6Dg3gKZYOjfNWSxYbtNll6tt/Rx/DhNJ+fvZCp7OQyqEyBzZM
	1NkvBYIrZzZhPCsS/EiPow3rxTElK+5Xl0SdVaaZsrp6Eiuar859IPPpAkLSRIUB99WL3oimB37
	JkzG37dxn1e00/ilctJPMcXf6pC1jdnRelplYi0N0NHC0GCs7iPSKFdqTu2AWRkHUxM70N/tQey
	NYm3gx9YpRZFVwLGEwripXgq4rifqumYvWmH10sjVKIfIorIFNRJRbP/8mJDlfxd/4+tjSWG7Gr
	2pxQyxyvunOZlkF/qzEQja23iWc/1JdaKCi5Y1ag9d38BBGHV5gkDDUeLUjwi9i9D+P/zU5TKhC
	dD6V9j55xKOeLNbSi2QksKRxd1XAy0v0xXDxIum14881oQmjhUjnul2tX+/4dbDxo2suQNV0RC2
	0as9A8UyHO4/tgL8SbxyxKE/HK2kJIEgV0PUbogfwD13r1uFpo+WpOCE2X6yNNWVFgnSKUyUzel
	1PsxizwpIeSQ8ymylwNURjhpCMMowE6HqYlerQEHGr9lCqsYpD81f9ML4zmE3PHKwD3yOfvfp4R
	nwjePP9JY0Q7Owz3m81JMsoiDElQ
X-Received: by 2002:a05:600c:820a:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18e4a3f0dmr56852485e9.13.1791571291834;
        Fri, 09 Oct 2026 11:41:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:31 -0700 (PDT)
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
Subject: [PATCH v2 3/8] iio: adc: rzt2h: Add chip-specific configuration
Date: Fri,  9 Oct 2026 19:41:17 +0100
Message-ID: <20261009184122.1378797-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for supporting SoCs with ADC IP that is similar to the
RZ/T2H ADC but may have different channel configurations.

Introduce chip-specific configuration for the channel template and number
of channels, and use it when setting up the IIO channels and DMA layout.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Returned -ENODATA in case device_get_match_data() returns NULL
---
 drivers/iio/adc/rzt2h_adc.c | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index a46726b054b3..58e33fd0249c 100644
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
@@ -329,7 +336,8 @@ static void rzt2h_adc_dma_callback(void *data)
 static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 {
 	struct rzt2h_adc *adc = iio_priv(indio_dev);
-	unsigned int hi = 0, lo = RZT2H_ADC_MAX_CHANNELS - 1;
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	unsigned int hi = 0, lo = chip_info->num_channels - 1;
 	const struct iio_chan_spec *chan;
 	unsigned int sample_chans;
 	unsigned int first_chan;
@@ -350,7 +358,7 @@ static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 	 * width, so pick the smallest power-of-two-aligned block of channels
 	 * that covers all enabled channels.
 	 */
-	for (sample_chans = 1; sample_chans < RZT2H_ADC_MAX_CHANNELS; sample_chans <<= 1) {
+	for (sample_chans = 1; sample_chans < chip_info->num_channels; sample_chans <<= 1) {
 		first_chan = round_down(lo, sample_chans);
 
 		if (first_chan + sample_chans > hi)
@@ -610,8 +618,8 @@ static int rzt2h_adc_parse_properties(struct rzt2h_adc *adc)
 	int ret;
 
 	ret = devm_iio_adc_device_alloc_chaninfo_se(adc->dev,
-						    &rzt2h_adc_chan_template,
-						    RZT2H_ADC_MAX_CHANNELS - 1,
+						    adc->chip_info->chan_template,
+						    adc->chip_info->num_channels - 1,
 						    &chan_array);
 	if (ret < 0)
 		return dev_err_probe(adc->dev, ret, "Failed to read channel info");
@@ -632,7 +640,7 @@ static void rzt2h_adc_free_dma_buf(void *p)
 {
 	struct rzt2h_adc *adc = p;
 
-	dma_free_noncoherent(adc->dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_free_noncoherent(adc->dev, adc->dma.buf_size,
 			     adc->dma.buf, adc->dma.addr, DMA_FROM_DEVICE);
 }
 
@@ -652,13 +660,16 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
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
@@ -671,6 +682,7 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 
 static int rzt2h_adc_probe(struct platform_device *pdev)
 {
+	const struct rzt2h_adc_chip_info *chip_info;
 	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	struct rzt2h_adc *adc;
@@ -678,11 +690,16 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
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
@@ -742,8 +759,14 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
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
@@ -751,6 +774,10 @@ MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
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

