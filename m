Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9941524B0D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685783; cv=none; b=SCiCnILtvoH0XW53o5Qv/M6BUBOkjzRy2nR+gLdVzr9yGQsgJerwOL7YXDU4UZeNL9VVCFGtL+0BmNudf1HAu/fbJVcarNF83KXC1/+jRKGt+l5iC66sml9k1ob/WqJcKKtzm/tIk2lQ55wDPG0jsVJu5wxFa07mk89ePhb0hY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685783; c=relaxed/simple;
	bh=gxd4NjTwiQfLfFXIDJZLSDsIqAyE9ZX6azzI4bFOI74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGxSgtXk3iC/7EC3XfehV4ASP8gCf6FRMjenvT1E8VNfMjWYtitz8YCPC7sTW+81q3tdP0832aD3OLkN4YHgYEBLSTG566C9CeOgasURFEF80nfBmSm0AxtFRxonGFqSr36tbPdCq2S2ZMIGyqX2IjZeX3tvNzX2AeTL275q7y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsOjdkpR; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsOjdkpR"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-48af929e59dso239841f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685777; x=1791290577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msmGm5WStFQvq0wjc81cWcABYp/qlsGC5Rsr/nQSxYA=;
        b=DsOjdkpRCzNBQ1vNDwRRXcQu20EaWQ08KoBlJkx1NIUCY0Ewkv/ceRvrKEs4R+wPg+
         oeWkW6XmkhjC6R3nZTZMqIvw8jlMVbZsLTa1V8Rz795sJ8Myqfi4prE2GZxEgz5RzwpO
         RkOZwQtkUWXSipiU3eVJrHT99xOCU/zAneDKPycNYhGYy3pMonQcoAxzsXiWHMbFcOwG
         1trzUAI5V0eWu0Kdx3qgMCQQjN2taUIYZ70saMDVwNZsc8wTkrQYR430P+Q68E/EkwJR
         Zzh3+be6+0lXHf/33XCNt7x2B57dbPGWayifBX3mCrP9j8CTBpVoWTJVC7i6N22KLKh7
         OiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685777; x=1791290577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msmGm5WStFQvq0wjc81cWcABYp/qlsGC5Rsr/nQSxYA=;
        b=KH7CkH5bRH+d1erdp8cbPEgBjtdaitXdNCBWgMBWK58KlS2yVSn4G2+vtYfnLjMVX6
         GJdN9mbfzHrn7ikDXENEnC9MV6wWvDvAfIAxmCV60y1oDuSB+da8THvgllHlJbv6XXve
         L35PHsIWq96+OVh77ajthtoWuEIYVxccRqwcJUuv0uOeeq4YrZfhwM4UVwkctXs2X9wN
         98DdmP9pv1MUr0yigGzvePE6C6SrprjaSExdbAJLwvw9o7w2pr8spPa80ZhCuHxyQcKb
         OgkPokyyIq16/O4k0Qspwaze8VO2Cwd+ehrM+vLiQFB9XOSHVsu0ORnoxqXE5YFmA2U2
         5N+g==
X-Gm-Message-State: AFq9FYKjbFBYWBOfHAByKTYsaSmkUfSXBrI2l3PeoQJIgDXYiy4qe66y
	0MkgfBoqaugecxui7zrTSyDEdkspoD8KZ5SZXy2c2PS7aN/qbrzPx9Oo
X-Gm-Gg: AYBFou15DJtVEMZ4Q3e3n06gc9jVgYPHoEX3XtZq8gCi3VXxcF4GYd5iFMj0oWEaG73
	+phRq0bzRmdAdThRFR8go1iAGpf4Rb1O5ZpqaZZLYoqlJPPP8MoftEdiloT4MjBK2Qb6/MiDczJ
	X58do4bh9neRUEyN0xkJihv9SPTj3iX+gOXGqtEdHZVhA/i1NLDaPhKHbOzZ5996VrysNqKimw7
	4LXEb4aTtn0V2If2o6kP0wXdEMH6bch3CirxZQFZ0m/0Jd4uOke71rooYYHjaax85gq16RTQ1tB
	V+x2LtCBBw4cSLBr3W/5XfA7H3OVlDRc+A8ZvZLy9wQ1DVdu203cl165RaBO4sXZ2ZH6OgdFtlk
	55isg2EAJwLE1xKrtElqa45WsKpE8zjjfFNxkNjnzrki63C/1BivVF5wTdOXjuZVp6G1phd+WLB
	aeBjFV+jdm2o0CkNvlGCl/QL7gPjWQZofLpJq3j39HjvhjbJCbKo2V0cmjCtQOUmqVRJRf1o9sR
	9mqhI1ZkJeLv95v/u1599V5OzUSg7H6lngUeQY3E9F8hJUz44RmwbkTQi6BLBe038Aoh5hTxdrV
	ruj+0Xguq4tMo9coOw==
X-Received: by 2002:a5d:5849:0:b0:487:6f2:1a45 with SMTP id ffacd0b85a97d-4887172593amr28549256f8f.18.1790685777142;
        Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:56 -0700 (PDT)
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
Subject: [PATCH 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Tue, 29 Sep 2026 13:42:46 +0100
Message-ID: <20260929124248.237032-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index cf34895928f1..26028856b175 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -67,6 +67,7 @@ struct rzt2h_adc;
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
 	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
+	const struct iio_info *info;
 	unsigned int num_channels;
 	u8 features;
 };
@@ -760,7 +761,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -775,6 +776,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0

