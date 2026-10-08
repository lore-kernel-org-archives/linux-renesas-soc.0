Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92252497382
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456203; cv=none; b=qFWLQi/4njBKPMtRXFiulG3+LmqoSfTti6qCKAw45ljeGMC0s2icgCY4/Gsz2Bj1SvgLsAT9KASjH3qXttmc5sf0fDCFBkAS2RvHWNMpqsj6Vg2xna6eeDHjYNRH20ovqDer/xV7NHdvJeWHLVLpcgfGFeJ7d12vtBO7AKru1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456203; c=relaxed/simple;
	bh=aeGEPZ62WG1rYJ4UmaiX7V6fFIdooxIunanCDD+ki4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jinWyLjn4jgls41WOvqP5toQ0rTl0x0ucfY4tFOyW1MEuFQ4rReubtZ7I+rPcZ5vmVdG7FW+PAafAl0uVryvDe0Vvv/5w8lryb4LMfdlmnjRBkJ3jjiYCNtdJlP5g7yHpZUDcFs7XY8xTrmJqRGxPFmSPcfVVQk0UujdtsDyrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqbaLtvd; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqbaLtvd"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-34c4a0868b6so4656563eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456202; x=1792061002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tshzH2hs2YBcBixu+hfpqJYKGYNe4yJtAc6VriLVkyE=;
        b=QqbaLtvdeAG6Y1NhbTL0mnCEim129iFor3iYntr1lKwXCDkw52HzBg+IecyfOz8hn0
         fRmJG+QLEmLhE8W3J9utOw7oxyLDW9+FarC8K+kMdbq8akphK6eJW4gFDHIYTOjKDEe8
         mEuFmxtX3Yx1FQLNmTWrgay/q2JMhs0CgRidSPCZA0Q3LD4+8orSZQBAexakzbaLj/1F
         GmWV8iuVna+J5NSFH+Dmj8weZt2cTV56okL0EMlXVkmzWO4XhGCpfwynyiBjrMyk20We
         jJUpqrx6/uPDecWL0U+MW3zts7qn7WFJ/XdYU7GiJ/MXq+r8+7PF/Cun+afPxpoSB85q
         N4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456202; x=1792061002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tshzH2hs2YBcBixu+hfpqJYKGYNe4yJtAc6VriLVkyE=;
        b=kA+trC7AJiu+Oxp9hJ7BjQvqQg7bHqTCLpdIFvtOHR+6NQg9MV9/5tQkq0vZ1ATnL4
         YyyQbLCP3c8hya16GQJX3ia+7GWfc1Q72lxDfPAK0UH1M1Un/mvD7CJ0/pC0zh6vrSAB
         wizhnSKdAQLdyRSjuZD16RE5kubuF4kGVDbWlQyyiPtS99HRmSmqm+Y3xM+NRntNUlds
         4fK8e4J4TVPhGuyqedB+DED7qS/sr+d8nvVAVo6V3be44EEpuzMa39ALGx2IFUD8QVIl
         4CiWish49MspM9x1KlgmdwGUsantd4dJBQn44lLOMeI13mhtDcpkIp3clhUrrr/GzED7
         eB3w==
X-Forwarded-Encrypted: i=1; AKwUvBzf2/1o3nLut2omhbJpMITf/tTlOaPN+r2qxb1N3v2J8D3v32vlcMB6psnwoi3jWnUyA4QHsU3MBwCXUKYz+QqOzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUyq4XB8Vq8QrHjJc64zhDQH0I2wVmXFxUmKwAP+rx3+g0VB9m
	lM3HlLj2zfpXXg1R/7bfRDDadoVL9ZtRPApvsS/VKyDjTPhVAOWXNUY8
X-Gm-Gg: AYBFou3QKD3VyPYC+b45keVxErZi5XcE+/IQyCkUJl+4z+10ns1VBkRj/G9TrzqH5g5
	dh9tTloeysiUaY3U0E4pwBein66ys0//0z0UFz/16KtVDiqWYRu3cXs04LcNKfBu3Amt9LlZY0k
	iciK6h8fw4iAdW7clhsF/i+DUg0kD4MF0QVA0pgypQz6zpyuQbBDR3gG9u15ruHpliIZzUkjJuD
	X8HD9pZ9cayXsRtBjpV+4csldDLKudTwqHOGpT1XIpL9UV7isRwDIpcx01MqTakuYZhokXHn5k7
	rGw1qLlj774hYS+Pl86ueLUUKdxti1fnYiKMGTRkTOFL97j+vDa962kVPzuPKeTARY5N8dYCIbt
	OvtxwCB4q8aNr6UVKUmSXfcqt3O/iH/uFgn2nxY85JqMYlT/ecu7bTZIFqu+jinCGXPJqw5pSPi
	9zHZ6+x6ufQgzi89I6MIk3tjNZDxLHYKM8VrV4YvbJ3r/Ys4CBKgSbsWtpc35++FZQGOORIh4Wn
	U8PmqAlwcEykEKoRNa9DypMw8wfqsAaMzWAmirufKmCmepNdGKSKS+F6mHsx8agvgn5olKYgLDT
	vEo+618AstBHkA==
X-Received: by 2002:a05:7300:601e:b0:351:2200:1cde with SMTP id 5a478bee46e88-35177712b66mr2416825eec.8.1791456201448;
        Thu, 08 Oct 2026 03:43:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:20 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 17/24] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:24 +0700
Message-ID: <20261008103831.542533-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..767251ac4f89 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,14 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0

