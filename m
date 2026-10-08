Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7A496D2A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456173; cv=none; b=tT2iwDc/q0I89UMB01L2ElRYMOSxIQmvQVUrksQ55/o1isL58vH22++AX7jn+blsiptnZ0uxOvr2yAuJJxtRPxYv4GvbLw9B8e6JfHcnDddRKt+EABZ0bGqYS+nNsPJj9eObrowUggFyQnlG6Ps1Q/ehh6lLUAlJI0rHGwiO/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456173; c=relaxed/simple;
	bh=5gdHEOl1guP3lKSItABKnxUiFa7+ruLS9jKThkThl7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agUyV0fqpPDIB7mMXBum2yuOx2Cl0RpOnhYYpCRPrKj3UuWy5L1P2pI6BNnYGaikeTTMtJMuzihI//nN62WLJkeo7JnBitkOHR51YQzIlQ5v8NtLPvNiOsXvIbQd00IxNT0iQI2Y7coA0ugZqJ5RqyNjpTaJc4hbVLprnLz5xBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fionkPFW; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fionkPFW"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3515f9a5d25so4191774eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456171; x=1792060971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=fionkPFWrDrAstDn+o1Q7dWab4riLi1f6A/rIsQHGHYjcP0wbkd1BL1MNHmumFFrti
         KwXHsEjTMAGTMupIw+5jEHNOXqiQY6bBBWvQpE9xOM0lha98fe2BWdqQ1TyqnnYkvuPm
         uQ9G8lNrAWrkvO3OblQzaUPoHk7hdYxpcbAJsR249PnoNsNtLQkyDrwx+I5oaiaUwidC
         bdNNnlpmWA8hkINoJ0bbwIlAWfdRpICIyMyH4mn90x9C26kKZ1HAblYzjH9YR8vz9082
         C0gLcQuT4oOuG78hC7KHLGeVDAyaLqGBwlpToY52Gm4J+zujNv8EiozF+HyWwPS0cgs7
         caog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456171; x=1792060971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=uyMs1Tlg68nVRfOUmBd6mSf5mYxnWoGchsvJSsZgPDEUGjyWLHYwc5BxXMGl0Lim6v
         CilvH4WuJTJID6+5NDh/Eqvs9fsjxgDtdJXDKtfH/Yrsf5UEdOg6c7s7InNsjLctpx+f
         3Pk6Djhs929swepSTOCBl5Z4p5MHGFE/xiSYnsyZgErLNYhRhWSarEbxciDW3CjscE6M
         tnPZF+SHhOAZHwEp+W1dJUEzBlZNV2SQ3LQ1dHRa4oRYsO2ZJxP2zGBftU8iHtwA4WZu
         LU755uMdNFmltj7fC/mSq6qEZ2DzMWSJXvfiq6BAFNd0Oi/vGTSLpxff2eRDUwTSFxU/
         B4eg==
X-Forwarded-Encrypted: i=1; AKwUvBwE4jPezNZ4Vg4AYxpYOo1H118y4YVNvINCIBFjGM51YOiuN6XyGOFP9ZL5VLeM6TZKSpYgnGcT8NY4p7gNi7/j8g==@vger.kernel.org
X-Gm-Message-State: AFuF++m/ER3CdCld+ga3paaehUQnXsMmpeQtE6ihGG5+BdPTGIfFOMTy
	1tW6okNKdmcx6n/uB40mDA1peqY7x29laKMzjRAVsdE+LqnP+opb4yWt
X-Gm-Gg: AYBFou1jZdIY4Tg3McISPebS4+NFTEFXdUSEUA5Uo6WavFSheZv6p8f95e0aFmabZ5q
	Cgp8q5JWIsOP6rC+LTS0XBH9qKLh6jQmE1KDG5yLztaLRS/a5qmeQrPYA/ucMXr/yEpokN2GIkW
	a6C8OMMUgXRaQI1SzALcnQ2tqKY/YJNYcj7903MxmQ9fwAhf4yZTrWsRRM/RHdqmlGws22eVF6X
	D53iVGfwkUTtNDoXHp/4H3xGuaiRB3Tt2d5J6ybQR1LA3gcG+f5eFcavimRQ/XJDwwHrn0L8mk7
	JEN9vvO0aTJ8VL9Ec+fZ0IZT11UbR8vc3u6UD+jp6tw5uflSV5ZEpnpU4KrZL6W7lpwug1KuRCW
	N/L1M+jKkcjYReJ1KayfWdYqZJR/TVB8kQ+75THTStMKdNtrGWNoQTXDebIVcbFvuyZSBt9S4p9
	ZB5HpmgR1ZM23XMnKuHrb0werB2EXyj3Wjqw70rPL43bCpMVNqD1+Pt16QXFQUoMb5KFxZdx3kf
	03MsX3Cs2RFKjlEIuuemDWD8W2Atdupd7k6jSRqqCCQGyVVwKpUnIl2bW17iUgs8hSlYG+4KE8P
	XxqYzFquuEquVA==
X-Received: by 2002:a05:7301:8617:b0:351:11aa:5d5b with SMTP id 5a478bee46e88-3515dde8bbbmr5895512eec.19.1791456170565;
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
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
Subject: [PATCH 15/24] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:22 +0700
Message-ID: <20261008103831.542533-16-phucduc.bui@gmail.com>
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
from nau8825_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8825_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8825.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..10bbfbb460b1 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,19 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 	const struct nau8825_osr_attr *osr;
+	int ret;
 
 	osr = nau8825_get_osr(nau8825, substream->stream);
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
+	return 0;
 }
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

