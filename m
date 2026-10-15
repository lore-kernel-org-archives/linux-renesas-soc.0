Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C4335BDC7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028857; cv=none; b=rPh/9ld3FbdnRKCyN9kdCQG6LJobz+vjxdC8XtLoIRRqInZjFLVXZb7UR2NqJ60ZM25UuHfv6+qpCZOS0Crdr1RbaVsbBOGOx+btZMUcRQf9eDx1in60F9bjYB6G4DY1wZg6Lj/NJGZTrN6pXs8Md6+GuJoKCtYUkjK2KEMNmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028857; c=relaxed/simple;
	bh=gbKxRXgxq8DVqFsIIwbQbc//22j1RiqNWHX1MLDGpQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIGkqH5C6bnqoXYs6cFcJxW/b8VzoOaw6vJd4PdIV8Zt5DwUrFHb0YBqRxF+cYFHVIyXW7vPu1PH7HGqeYSLw05LkpCRUypQxDydigc3RAdDk1JWFs91Ct6aHU9wmIQQ3A6ovAQNIFtRqVCtesscwlyf9yisPqwHd5d9reFrGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqemQCCT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqemQCCT"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e86dce4510so24249345ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028855; x=1792633655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvYpMSlsoaD702JqdWz6T2bQ1dialbnMpsVm+cSYlj4=;
        b=JqemQCCTBrUD1u0eGdaKYB33QiRHVE9Xocx/Pl++ZPPjDWCFyLRdbU/Zrd390R3Tax
         3yngDvkyw1zqoERuNHGwFWwSGvI0IPJanw5rjFQL/rtgcJ/Q+mM1lhGvARh6NpDMNyZZ
         ztvQEkiOGZeQam8/i00bsCThd7bs6c8YjftnwuH7XS4qYLU40wWauc8r5daMHAfTZ6Zi
         l4wPiP40Xek3cJYXkWEEl4gG5yVlZAIP7vNAgEeKaMi3qk/ACsWKZe6uwfkOcmlqOjIh
         ZpOUKiUTzT6T5Pau6rSLR8hv2+xbFVDgJmHy8aQ6BYobRgKF1Ei5M90MHF+AJ6p+88nX
         FT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028855; x=1792633655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvYpMSlsoaD702JqdWz6T2bQ1dialbnMpsVm+cSYlj4=;
        b=syN8Uviamtsj7nUcvqn2hnJ3yRDatm+wru8Cfq6UO5eu2b77bj2h0XkLMdwt5o26oa
         9hbqMZSsIg+JDS6ZUIO7QKRgTHcO/J/ymOlr6DN14mHMhdA1umAdMHxxMteNINhaEURT
         VJ9qau8nfQbrmpxMhkzSVjGO9h+W+7a8DsB9KyEmLJogOZV9FEnPIeS8XeOWRVp9D5FQ
         lxm8XCs1i5VQGFtVkOju3q+x6C42dwd4fjpqRrbTsTe6gQvrTd8j3DZmjLmESYzoFVAw
         K+nPXcLXq9R3SDQ4t/FQu5pZ4o4pQDctjP0Qla3rg5YESPwOjJ6PirPrUVwbZMslAflE
         WVLw==
X-Forwarded-Encrypted: i=1; AKwUvBylqatTnvIEFv8bYnWdX4PKf2xoIwfm9SBpxiBjCstx1PTMtd8n6GtKZqy2sN0vzofPCB/vjnku3JMau6EIylRHlA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWFIcXtcqfGS4N5rT0thpfdYZXMBT4tgqamPd/Gp2oyX1cMX9+
	d6ogOiGF9wBbrVjaG80TSfTr0xxmeGM7fmQI0CHlOKK39kMygTAcMkr0
X-Gm-Gg: AYBFou0fbM6iamxFzAumxS8pU8ij85pWY+85qINNukg6y0PVh2D3MUojRUXx5BWD1Hj
	booquFhxFPK1Ihh0a/1y5NzfNzb8QlFxsMKnxYCEI24+jJszbYe7q8h5iSJtzonnS4PSgm/h39g
	VIrFi+iRHbOgGSTP5BzWb1izlNko3/pckEImu9y8ndiwDWwUTZsDsU+G9VTdohAY6x2+p/yqmXA
	ov9zUWsOsQtkqccBg9ISvROgN6iNQuJncS2FrNNmyPZ5sLLqkw3GwMBUX3FDYs9IL++wPefHcB4
	hVLzgcLOJFduRNY03IkuiBCCX3ToLGXm8a6SBZydK6fAk9itREp5jXG7Mbpbm1CNk6D1QEmJ83m
	w0jAhTuMLtjwKF0G0znJP8L7LkkJQHoHJ2cprZlYsgYYP4sLTsxVjK2gPG83woLs/k/n6QxmfuO
	WmQ8Y1mV0i0jV0tnfPWAeMaSwVhY/l6swG0PmQvDxL6ruoJJUvlizA1Izznz2XfpwewTkZapJYa
	Sm0gWWZS3RTk3e947fPIrDR+JTiRlHzp2NmxVLlfi4fYaVUrlFfjw0H8BF/eT3LtovGc5KlI2Pb
	h+g14zDI8bgj0Q==
X-Received: by 2002:a17:903:2442:b0:2e8:422e:19c5 with SMTP id d9443c01a7336-2e842dfd28emr133980465ad.55.1792028855139;
        Wed, 14 Oct 2026 18:47:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 13/25] ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:12 +0700
Message-ID: <20261015014324.5569-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8821_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8821_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8821.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee1037..7b88ee3159d1 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -829,14 +829,24 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
 	const struct nau8821_osr_attr *osr;
+	int ret;
 
 	osr = nau8821_get_osr(nau8821, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

